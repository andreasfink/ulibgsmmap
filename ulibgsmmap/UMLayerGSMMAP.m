//
//  UMLayerGSMMAP.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMLayerGSMMAP.h"
#import <ulibgt/ulibgt.h>
#import <ulibsccp/ulibsccp.h>
#import <ulibtcap/ulibtcap.h>
#import "UMGSMMAP_RoutingInfoForSM_Arg.h"
#import "UMGSMMAP_Opcodes.h"
#import "UMGSMMAP_AddressString.h"
#import "UMGSMMAP_asn1.h"
#import "UMLayerGSMMAP_Dialog.h"
#import "UMLayerGSMMAP_OpCode.h"
#import "UMLayerGSMMAPApplicationContextProtocol.h"
#import "UMGSMMAP_HousekeepingTask.h"
#import "UMGSMMAP_TimeoutTask.h"

@implementation UMLayerGSMMAP

@synthesize tcap;
@synthesize address;
@synthesize ssn;
@synthesize user;

-(UMMTP3Variant) variant
{
    return tcap.variant;
}

- (UMLayerGSMMAP *)init
{
    self = [super init];
    if(self)
    {
        dialogs = [[UMSynchronizedDictionary alloc]init];
        _dialogIdLock = [[UMMutex alloc]init];
    }
    return self;
}


- (UMLayerGSMMAP *)initWithTaskQueueMulti:(UMTaskQueueMulti *)tq
{
    self = [super initWithTaskQueueMulti:tq];
    if(self)
    {
        dialogs = [[UMSynchronizedDictionary alloc]init];
        _dialogIdLock = [[UMMutex alloc]init];
    }
    return self;
}




- (void)tcapBeginIndication:(NSString *)dialogId
          tcapTransactionId:(NSString *)localTransactionId
    tcapRemoteTransactionId:(NSString *)remoteTransactionId
                    variant:(UMTCAP_Variant)var
             callingAddress:(SccpAddress *)src
              calledAddress:(SccpAddress *)dst
            dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
               callingLayer:(UMLayerTCAP *)tcapLayer
                 components:(TCAP_NSARRAY_OF_COMPONENT_PDU *)components
                    options:(NSDictionary *)options
{
    UMLayerGSMMAP_Dialog *dialog = [self getNewDialogForUser:user withId:dialogId];

    if(logLevel <= UMLOG_DEBUG)
    {
        [logFeed debugText:[NSString stringWithFormat:@"tcapBeginIndication creates a new dialogId: %@\n",dialog.userDialogId]];
    }
    [dialog MAP_Open_Ind_forUser:user
                            tcap:tcapLayer
                             map:self
                         variant:var
                  callingAddress:src
                   calledAddress:dst
                 dialoguePortion:xdialoguePortion
                   transactionId:localTransactionId
             remoteTransactionId:remoteTransactionId
                         options:options];
    if(dialog.tcapTransactionId == NULL)
    {
        dialog.tcapTransactionId = localTransactionId;
    }
    if(dialog.tcapRemoteTransactionId==NULL)
    {
        dialog.tcapRemoteTransactionId = remoteTransactionId;
    }
    [dialog MAP_ProcessComponents:components
                          options:options];
    [dialog MAP_Delimiter_Ind:options
                       dialog:(NSString *)dialogId
               callingAddress:src
                calledAddress:dst
              dialoguePortion:xdialoguePortion
                transactionId:localTransactionId
          remoteTransactionId:remoteTransactionId];
    if(components.count==0)
    {
        UMTCAP_asn1_Associate_result *r = [[UMTCAP_asn1_Associate_result alloc]initWithValue:0];
        UMTCAP_asn1_Associate_source_diagnostic *d = [[UMTCAP_asn1_Associate_source_diagnostic alloc]init];
        d.dialogue_service_user =[[UMASN1Integer alloc]initWithValue:0];
        [dialog MAP_Delimiter_Req:options
                           result:r
                       diagnostic:d];
    }
}

- (void)tcapContinueIndication:(NSString *)dialogId
             tcapTransactionId:(NSString *)xlocalTransactionId
       tcapRemoteTransactionId:(NSString *)xremoteTransactionId
                       variant:(UMTCAP_Variant)var
                callingAddress:(SccpAddress *)src
                 calledAddress:(SccpAddress *)dst
               dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
                  callingLayer:(UMLayerTCAP *)tcapLayer
                    components:(TCAP_NSARRAY_OF_COMPONENT_PDU *)components
                       options:(NSDictionary *)options
{
    UMLayerGSMMAP_Dialog *dialog = [self dialogById:dialogId];

    if((dialog==NULL) && (options[@"injected"]))
    {
        /*  if we are using sccp injecting into the stack to debug
            decoding incoming packets, then we might not have a previous transaction.
            For example if we submit a sccp pdu with tcapContinue without previous tcapBegin.
            In this case we enfore to decode it anyway by creating the missing transaction on the fly
            so the decoding runs through.
        */
        if(dialogId)
        {
            dialog = [self getNewDialogForUser:user withId:dialogId];
        }
        else
        {
            dialog = [self getNewDialogForUser:user];
        }
        [dialog MAP_Open_Ind_forUser:user
                                tcap:tcapLayer
                                 map:self
                             variant:var
                      callingAddress:src
                       calledAddress:dst
                     dialoguePortion:xdialoguePortion
                       transactionId:xlocalTransactionId
                 remoteTransactionId:xremoteTransactionId
                             options:options];
        dialogId = dialog.userDialogId;
    }
    if(dialog==NULL)
    {
        [logFeed minorErrorText:[NSString stringWithFormat:@"tcapContinueIndication: DialogNotFound %@ for transaction [local %@ remote %@]",dialogId,xlocalTransactionId,xremoteTransactionId]];
        return;
    }
    else
    {
        if(logLevel <= UMLOG_DEBUG)
        {
            NSString *s = [NSString stringWithFormat:@"tcapContinueIndication\n"
                           @"    dialogId: %@\n"
                           @"    localTransactionId: %@\n"
                           @"    remoteTransactionId: %@\n"
                           @"    userIdentifier: %@\n",
                           dialog.userDialogId,
                           dialog.tcapTransactionId,
                           dialog.tcapRemoteTransactionId,
                           dialog.userIdentifier];
            [logFeed debugText:s];
        }
        if(dialog.tcapTransactionId == NULL)
        {
            dialog.tcapTransactionId = xlocalTransactionId;
        }
        if(dialog.tcapRemoteTransactionId == NULL)
        {
            dialog.tcapRemoteTransactionId = xremoteTransactionId;
        }
        dialog.remoteAddress = src;
        dialog.localAddress = dst;
        [dialog MAP_ProcessComponents:components
                              options:options];
        [dialog MAP_Delimiter_Ind:options
                           dialog:dialogId
                   callingAddress:src
                    calledAddress:dst
                  dialoguePortion:xdialoguePortion
                    transactionId:xlocalTransactionId
              remoteTransactionId:xremoteTransactionId];

        [dialog MAP_Continue_Ind:options
                  callingAddress:src
                   calledAddress:dst
                 dialoguePortion:xdialoguePortion
                   transactionId:xlocalTransactionId
             remoteTransactionId:xremoteTransactionId];
    }
}

- (void)tcapEndIndication:(NSString *)dialogId
        tcapTransactionId:(NSString *)transactionId
  tcapRemoteTransactionId:(NSString *)remoteTransactionId
                  variant:(UMTCAP_Variant)var
           callingAddress:(SccpAddress *)src
            calledAddress:(SccpAddress *)dst
          dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
             callingLayer:(UMLayerTCAP *)tcapLayer
               components:(TCAP_NSARRAY_OF_COMPONENT_PDU *)components
                  options:(NSDictionary *)options
{
    UMLayerGSMMAP_Dialog *dialog = [self dialogById:dialogId];
    if(dialog==NULL)
    {
        [logFeed minorErrorText:[NSString stringWithFormat:@"tcapEndIndication: DialogNotFound %@ for transaction [local %@ remote %@]",dialogId,transactionId,remoteTransactionId]];
        return;
    }
    else
    {
        if(logLevel <= UMLOG_DEBUG)
        {
            NSString *s = [NSString stringWithFormat:@"tcapEndIndication\n"
                           @"    dialogId: %@\n"
                           @"    localTransactionId: %@\n"
                           @"    remoteTransactionId: %@\n"
                           @"    userIdentifier: %@\n",
                           dialog.userDialogId,
                           dialog.tcapTransactionId,
                           dialog.tcapRemoteTransactionId,
                           dialog.userIdentifier];
            [logFeed debugText:s];
        }
        if(dialog.tcapTransactionId == NULL)
        {
            dialog.tcapTransactionId = transactionId;
        }
        if(dialog.tcapRemoteTransactionId == NULL)
        {
            dialog.tcapRemoteTransactionId = remoteTransactionId;
        }
        dialog.remoteAddress = src;
        dialog.localAddress = dst;

        @try
        {
            [dialog MAP_ProcessComponents:components options:options];
        }
        @catch(NSException *ex)
        {
            [logFeed majorErrorText:[NSString stringWithFormat:@"Exception: %@",ex]];
        }
        @try
        {
            [dialog MAP_Close_Ind:options];
        }
        @catch(NSException *ex)
        {
            [logFeed majorErrorText:[NSString stringWithFormat:@"Exception: %@",ex]];
        }
    }
}

- (void)tcapUnidirectionalIndication:(NSString *)dialogId
                   tcapTransactionId:(NSString *)localTransactionId
             tcapRemoteTransactionId:(NSString *)remoteTransactionId
                             variant:(UMTCAP_Variant)var
                      callingAddress:(SccpAddress *)src
                       calledAddress:(SccpAddress *)dst
                     dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
                        callingLayer:(UMLayerTCAP *)tcapLayer
                          components:(TCAP_NSARRAY_OF_COMPONENT_PDU *)components
                             options:(NSDictionary *)options
{

    if(logLevel <= UMLOG_DEBUG)
    {
        [logFeed debugText:@"tcapUnidirectionalIndication received"];
    }

    @try
    {
        [user MAP_Unidirectional_Ind:options
                      callingAddress:src
                       calledAddress:dst
                     dialoguePortion:xdialoguePortion
                       transactionId:localTransactionId
                 remoteTransactionId:remoteTransactionId];
    }
    @catch(NSException *ex)
    {
        [logFeed majorErrorText:[NSString stringWithFormat:@"Exception: %@",ex]];
    }
}

- (void)tcapUAbortIndication:(NSString *)userDialogId
           tcapTransactionId:(NSString *)localTransactionId
     tcapRemoteTransactionId:(NSString *)remoteTransactionId
                     variant:(UMTCAP_Variant)variant
              callingAddress:(SccpAddress *)src
               calledAddress:(SccpAddress *)dst
             dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
                callingLayer:(UMLayer *)tcapLayer
                        asn1:(UMASN1Object *)asn1
                     options:(NSDictionary *)options
{
    if(logLevel <= UMLOG_DEBUG)
    {
        [logFeed debugText:@"tcapUAbortIndication received"];
    }
    UMLayerGSMMAP_Dialog *dialog = [self dialogById:userDialogId];
    if(dialog==NULL)
    {
        [logFeed minorErrorText:[NSString stringWithFormat:@"tcapUAbortIndication: DialogNotFound %@ for transaction [local %@ remote %@]",userDialogId,localTransactionId,remoteTransactionId]];
        return;
    }

    dialog.tcapTransactionId = localTransactionId;
    @try
    {
        [dialog MAP_U_Abort_Ind:options
                 callingAddress:src
                   calledAddress:dst
                dialoguePortion:xdialoguePortion
                  transactionId:localTransactionId
             remoteTransactionId:remoteTransactionId];
    }
    @catch(NSException *ex)
    {
        [logFeed majorErrorText:[NSString stringWithFormat:@"Exception: %@",ex]];
    }
    @try
    {
        [dialog MAP_Close_Ind:options];
    }
    @catch(NSException *ex)
    {
        [logFeed majorErrorText:[NSString stringWithFormat:@"Exception: %@",ex]];
    }
}


- (void)tcapPAbortIndication:(NSString *)userDialogId
           tcapTransactionId:(NSString *)localTransactionId
     tcapRemoteTransactionId:(NSString *)remoteTransactionId
                     variant:(UMTCAP_Variant)variant
              callingAddress:(SccpAddress *)src
               calledAddress:(SccpAddress *)dst
             dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
                callingLayer:(UMLayerTCAP *)tcapLayer
                        asn1:(UMASN1Object *)asn1
                     options:(NSDictionary *)options
{
    if(logLevel <=UMLOG_DEBUG)
    {
        [logFeed debugText:[NSString stringWithFormat:@"tcapPAbortIndication for dialog %@",userDialogId]];
    }
    UMLayerGSMMAP_Dialog *dialog = [self dialogById:userDialogId];
    if(dialog==NULL)
    {
        [logFeed minorErrorText:[NSString stringWithFormat:@"tcapPAbortIndication: DialogNotFound %@ for transaction [local %@ remote %@]",userDialogId,localTransactionId,remoteTransactionId]];
        return;
    }

    dialog.tcapTransactionId = localTransactionId;

    @try
    {
        [dialog MAP_P_Abort_Ind:options
                 callingAddress:src
                  calledAddress:dst
                dialoguePortion:xdialoguePortion
                  transactionId:localTransactionId
            remoteTransactionId:remoteTransactionId];
    }
    @catch(NSException *ex)
    {
        [logFeed majorErrorText:[NSString stringWithFormat:@"Exception: %@",ex]];
    }

    @try
    {
        [dialog MAP_Close_Ind:options];
    }
    @catch(NSException *ex)
    {
        [logFeed majorErrorText:[NSString stringWithFormat:@"Exception: %@",ex]];
    }
}


- (void)tcapNoticeIndication:(NSString *)dialogId
           tcapTransactionId:(NSString *)localTransactionId
     tcapRemoteTransactionId:(NSString *)remoteTransactionId
                     variant:(UMTCAP_Variant)variant
              callingAddress:(SccpAddress *)src
               calledAddress:(SccpAddress *)dst
             dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
                callingLayer:(UMLayerTCAP *)tcapLayer
                  components:(TCAP_NSARRAY_OF_COMPONENT_PDU *)components
                      reason:(SCCP_ReturnCause)reason
                     options:(NSDictionary *)options;
{
    UMLayerGSMMAP_Dialog *dialog = [self dialogById:dialogId];

    [dialog MAP_Notice_Ind:options
         tcapTransactionId:localTransactionId
                    reason:reason];
}

-(void) setConfig:(NSDictionary *)cfg applicationContext:(id<UMLayerGSMMAPApplicationContextProtocol>)appContext
{
    [self readLayerConfig:cfg];
    if (cfg[@"address"])
    {
        address =  [cfg[@"address"] stringValue];
    }
    if (cfg[@"operations"])
    {
        NSString *operations_string =  [cfg[@"operations"] stringValue];
        if([operations_string isEqualToString:@"any"])
        {
            operations = NULL;
        }
        else
        {
            operations = [[UMSynchronizedArray alloc]init];
            NSArray *operations_array = [operations_string componentsSeparatedByString:@","];
            for(NSString *entry in operations_array)
            {
                int64_t op = [entry longLongValue];
                [operations addObject:@(op)];
            }
        }
    }

}


- (void)startUp
{
    if(operations == NULL)
    {
        [tcap setDefaultUser:self];
    }
    else
    {
        NSUInteger n = [operations count];
        for(NSUInteger i=0;i<n;i++)
        {
            NSNumber *op = operations[i];
            [tcap setUser:self forOperation:[op longLongValue]];
        }
    }
    /* lets call housekeeping once per 2.8second */
    houseKeepingTimer = [[UMTimer alloc]initWithTarget:self
                                              selector:@selector(housekeepingTask)
                                                object:NULL duration:2800000
                                                  name:@"gsmmap-housekeeping"
                                               repeats:YES];
    [houseKeepingTimer start];
}

- (UMASN1Object *)decodeASN1:(UMASN1Object *)params
               operationCode:(int64_t)opcode
               operationType:(UMTCAP_Operation)operationType
               operationName:(NSString **)operationName
                     context:(id)context
{
    UMGSMMAP_asn1 *asn1 = [[UMGSMMAP_asn1 alloc]initWithASN1Object:params context:context];
    NSString *name = NULL;
    UMASN1Object<UMGSMMAP_asn1_protocol> *o = [asn1 decodeASN1opcode:opcode
                                                       operationType:operationType
                                                       operationName:&name
                                                         withContext:context];

    return o;
}



/*
    switch(component.asn1_tag.tagNumber)
    {
        case TCAP_ITU_COMPONENT_INVOKE:
        case TCAP_ANSI_COMPONENT_INVOKE_LAST:
            *doEnd=YES;
            return [handler handleInvoke:component
                          endTransaction:doEnd];
            break;
        case TCAP_ANSI_COMPONENT_INVOKE_NOT_LAST:
            *doEnd=NO;
            return [handler handleInvoke:component endTransaction:doEnd];
            break;
        case TCAP_ITU_COMPONENT_RETURN_RESULT_LAST:
        case TCAP_ANSI_COMPONENT_RETURN_RESULT_LAST:
            *doEnd=YES;
            return [handler hhandleInvokeForTransactionId:(NSString *)t
        dialogId:(NSString *)d
        operation:(int64_t)operation
        userId:(NSString *)u
        invokeId:(int64_t)invokeId
        param:(UMGSMMAP_asn1 *)param
        returnType:(UMGSMMAP_ReturnType *)returnType
        errorCode:(int64_t *)errorCode
        options:(NSDictionary *)options

            break;

        case TCAP_ITU_COMPONENT_RETURN_RESULT_NOT_LAST:
        case TCAP_ANSI_COMPONENT_RETURN_RESULT_NOT_LAST:
            *doEnd=NO;
            return [handler handleReturnResult:component endTransaction:doEnd];
            break;
        case TCAP_ITU_COMPONENT_RETURN_ERROR:
        case TCAP_ANSI_COMPONENT_RETURN_ERROR:
            *doEnd=YES;
            return [handler handleReturnError:component endTransaction:doEnd];
            break;
        case TCAP_ITU_COMPONENT_REJECT:
        case TCAP_ANSI_COMPONENT_REJECT:
            *doEnd=YES;
            return [handler handleReject:component endTransaction:doEnd];
            break;
    }
    return NULL;
}

- (UMTCAP_generic_asn1_componentPDU *)handleInvoke:(UMTCAP_generic_asn1_componentPDU *)component endTransaction:(BOOL *)doEnd
{
    return NULL;
}

- (UMTCAP_generic_asn1_componentPDU *)handleReturnResult:(UMTCAP_generic_asn1_componentPDU *)component endTransaction:(BOOL *)doEnd
{
    return NULL;
}
- (UMTCAP_generic_asn1_componentPDU *)handleReturnError:(UMTCAP_generic_asn1_componentPDU *)component endTransaction:(BOOL *)doEnd
{
    return NULL;
}
- (UMTCAP_generic_asn1_componentPDU *)handleReject:(UMTCAP_generic_asn1_componentPDU *)component endTransaction:(BOOL *)doEnd
{
    return NULL;
}
*/

- (NSString *)getNewUserDialogId
{
    static int64_t lastDialogId =1;
    int64_t did;
    [_dialogIdLock lock];
    lastDialogId = (lastDialogId + 1 ) % 0x7FFFFFFF;
    did = lastDialogId;
    [_dialogIdLock unlock];
    return [NSString stringWithFormat:@"D%08llX",(long long)did];
}

- (UMLayerGSMMAP_Dialog *)getNewDialogForUser:(id<UMLayerGSMMAP_UserProtocol>)u withId:(NSString *)dialogId
{
    UMLayerGSMMAP_Dialog *d = [[UMLayerGSMMAP_Dialog alloc]init];
    d.userDialogId = dialogId;
    d.tcapLayer = tcap;
    d.gsmmapLayer = self;
    d.mapUser = u;
    dialogs[d.userDialogId] = d;
    return d;
}
- (NSUInteger)dialogsCount
{
    return dialogs.count;
}

- (UMLayerGSMMAP_Dialog *)getNewDialogForUser:(id<UMLayerGSMMAP_UserProtocol>)u
{
    NSString *dialogId  = [self getNewUserDialogId];
    UMLayerGSMMAP_Dialog *d =[self getNewDialogForUser:u withId:dialogId];
    return d;
}

- (UMLayerGSMMAP_Dialog *)dialogById:(NSString *)did
{
    return dialogs[did];
}

- (NSString *)decodeError:(int)err
{
    return [UMLayerGSMMAP decodeError:err];
}

+ (NSString *)decodeError:(int)err
{
    switch(err)
    {
        case 1:
            return @"unknownSubscriber";
        case 2:
            return @"unknownBaseStation";
        case 3:
            return @"unknownMSC";
        case 4:
            return @"secureTransportError";
        case 5:
            return @"unidentifiedSubscriber";
        case 6:
            return @"absentSubscriberSM";
        case 7:
            return @"unknownEquipment";
        case 8:
            return @"roamingNotAllowed";
        case 9:
            return @"illegalSubscriber";
        case 10:
            return @"bearerServiceNotProvisioned";
        case 11:
            return @"teleserviceNotProvisioned";
        case 12:
            return @"illegalEquipment";
        case 13:
            return @"callBarred";
        case 14:
            return @"forwardingViolation";
        case 15:
            return @"cug-Reject";
        case 16:
            return @"illegalSS-Operation";
        case 17:
            return @"ss-ErrorStatus";
        case 18:
            return @"ss-NotAvailable";
        case 19:
            return @"ss-SubscriptionViolatio";
        case 20:
            return @"ss-Incompatibility";
        case 21:
            return @"facilityNotSupported";
        case 22:
            return @"ongoingGroupCall";
        case 23:
            return @"invalidTargetBaseStation";
        case 24:
            return @"noRadioResourceAvailable";
        case 25:
            return @"noHandoverNumberAvailable";
        case 26:
            return @"subsequentHandoverFailure";
        case 27:
            return @"absentSubscriber";
        case 28:
            return @"incompatibleTerminal";
        case 29:
            return @"shortTermDenial";
        case 30:
            return @"longTermDenial";
        case 31:
            return @"subscriberBusyForMT-SMS";
        case 32:
            return @"sm-DeliveryFailure";
        case 33:
            return @"messageWaitingListFull";
        case 34:
            return @"systemFailure";
        case 35:
            return @"dataMissing";
        case 36:
            return @"unexpectedDataValue";
        case 37:
            return @"pw-RegistrationFailur";
        case 38:
            return @"negativePW-Check";
        case 39:
            return @"noRoamingNumberAvailable";
        case 40:
            return @"tracingBufferFull";
        case 42:
            return @"targetCellOutsideGroupCallArea";
        case 43:
            return @"numberOfPW-AttemptsViolation";
        case 44:
            return @"numberChanged";
        case 45:
            return @"busySubscriber";
        case 46:
            return @"noSubscriberReply";
        case 47:
            return @"forwardingFailed";
        case 48:
            return @"or-NotAllowed";
        case 49:
            return @"ati-NotAllowed";
        case 50:
            return @"noGroupCallNumberAvailable";
        case 51:
            return @"resourceLimitation";
        case 52:
            return @"unauthorizedRequestingNetwork";
        case 53:
            return @"unauthorizedLCSClient";
        case 54:
            return @"positionMethodFailure";
        case 58:
            return @"unknownOrUnreachableLCSClient";
        case 59:
            return @"mm-EventNotSupported";
        case 60:
            return @"atsi-NotAllowed";
        case 61:
            return @"atm-NotAllowed";
        case 62:
            return @"informationNotAvailabl";
        case 71:
            return @"unknownAlphabe";
        case 72:
            return @"ussd-Busy";

    }
    return [NSString stringWithFormat:@"unknown-error(%d)",err];
}

-(void) MAP_U_Abort_Req:(NSString *)dialogId
                options:(NSDictionary *)options
{
    UMLayerGSMMAP_Dialog *dialog = [self dialogById:dialogId];
    if(dialog==NULL)
    {
        [logFeed minorErrorText:[NSString stringWithFormat:@"MAP_U_Abort_Req: Dialog ID %@ not found. Ignoring",dialogId]];
        return;
    }
    [dialog MAP_U_Abort_Req:options];
}


-(NSString *) MAP_Open_Req_forUser:(id<UMLayerGSMMAP_UserProtocol>)xuser
                           variant:(UMTCAP_Variant)variant
                    callingAddress:(SccpAddress *)src
                     calledAddress:(SccpAddress *)dst
                applicationContext:(UMTCAP_asn1_objectIdentifier *)appContext
                          userInfo:(UMTCAP_asn1_userInformation *)xuserInfo
                    userIdentifier:(NSString *)xuserIdentifier
                           options:(NSDictionary *)options
{
    UMLayerGSMMAP_Dialog *dialog = [self getNewDialogForUser:xuser];
    [dialog MAP_Open_Req_forUser:xuser
                            tcap:self.tcap
                             map:self
                         variant:variant
                  callingAddress:src
                   calledAddress:dst
              applicationContext:appContext
                        userInfo:xuserInfo
                  userIdentifier:xuserIdentifier
                         options:options];
    return dialog.userDialogId;
}

-(void) MAP_Delimiter_Req:(NSString *)dialogId
                  options:(NSDictionary *)options
                   result:(UMTCAP_asn1_Associate_result *)result
               diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic
{
    [self MAP_Delimiter_Req:dialogId
             callingAddress:NULL
              calledAddress:NULL
                    options:options
                     result:result
                 diagnostic:result_source_diagnostic];
}

-(void) MAP_Delimiter_Req:(NSString *)dialogId
           callingAddress:(SccpAddress *)src
            calledAddress:(SccpAddress *)dst
                  options:(NSDictionary *)options
                   result:(UMTCAP_asn1_Associate_result *)result
               diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic
{
    UMLayerGSMMAP_Dialog *dialog = [self dialogById:dialogId];
    if(dialog==NULL)
    {
        [logFeed minorErrorText:[NSString stringWithFormat:@"MAP_Delimiter_Req: Dialog ID %@ not found. Ignoring",dialogId]];
        return;
    }
    [dialog MAP_Delimiter_Req:options
               callingAddress:src
                calledAddress:dst
                       result:result
                   diagnostic:result_source_diagnostic];
}

-(void) MAP_Delimiter_Req:(NSString *)dialogId
                  options:(NSDictionary *)options;
{
    UMLayerGSMMAP_Dialog *dialog = [self dialogById:dialogId];
    if(dialog==NULL)
    {
        [logFeed minorErrorText:[NSString stringWithFormat:@"MAP_Delimiter_Req1: Dialog ID %@ not found. Ignoring",dialogId]];
        return;
    }
    [dialog MAP_Delimiter_Req:options];
}


- (void)MAP_Close_Req:(NSString *)dialogId
              options:(NSDictionary *)options
{
    [self MAP_Close_Req:dialogId
                options:options
                 result:NULL
             diagnostic:NULL];
}



- (void)MAP_Close_Req:(NSString *)dialogId
              options:(NSDictionary *)options
               result:(UMTCAP_asn1_Associate_result *)result
           diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic
{
    [ self MAP_Close_Req:dialogId
          callingAddress:NULL
           calledAddress:NULL
                 options:options
                  result:result
              diagnostic:result_source_diagnostic];
}

- (void)MAP_Close_Req:(NSString *)dialogId
       callingAddress:(SccpAddress *)src
        calledAddress:(SccpAddress *)dst
              options:(NSDictionary *)options
               result:(UMTCAP_asn1_Associate_result *)result
           diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic
{
    UMLayerGSMMAP_Dialog *dialog = [self dialogById:dialogId];
    if(dialog==NULL)
    {
        /* the dialog is already closed from the remote. so we can safely ignore it */
        //[logFeed minorErrorText:[NSString stringWithFormat:@"MAP_Close_Req: Dialog ID %@ not found. Ignoring",dialogId]];
        return;
    }
    [dialog MAP_Close_Req:options
           callingAddress:src
            calledAddress:dst
                   result:result
               diagnostic:result_source_diagnostic];
}

- (void) MAP_Invoke_Req:(UMASN1Object *)param
                 dialog:(NSString *)dialogId
               invokeId:(int64_t)xinvokeId
               linkedId:(int64_t)xlinkedId
                 opCode:(UMLayerGSMMAP_OpCode *)xopcode
                   last:(int64_t)last
                options:(NSDictionary *)options
{
    UMLayerGSMMAP_Dialog *dialog = [self dialogById:dialogId];
    if(dialog==NULL)
    {
        [logFeed minorErrorText:[NSString stringWithFormat:@"MAP_Invoke_Req: Dialog ID %@ not found. Ignoring",dialogId]];
        return;
    }

    [dialog MAP_Invoke_Req:param
                  invokeId:xinvokeId
                  linkedId:xlinkedId
                    opCode:xopcode
                      last:last
                   options:options];
}

- (void) MAP_ReturnResult_Req:(UMASN1Object *)xparam
                       dialog:(NSString *)dialogId
                     invokeId:(int64_t)xinvokeId
                     linkedId:(int64_t)xlinkedId
                       opCode:(UMLayerGSMMAP_OpCode *)xopcode
                         last:(int64_t)xlast
                      options:(NSDictionary *)xoptions
{
    UMLayerGSMMAP_Dialog *dialog = [self dialogById:dialogId];
    if(dialog==NULL)
    {
        [logFeed minorErrorText:[NSString stringWithFormat:@"MAP_ReturnResult_Req: Dialog ID %@ not found. Ignoring",dialogId]];
        return;
    }
    [dialog MAP_ReturnResult_Req:xparam
                        invokeId:xinvokeId  /* if not used: AUTO_ASSIGN_INVOKE_ID */
                        linkedId:xlinkedId  /* if not used: TCAP_UNDEFINED_LINKED_ID */
                          opCode:xopcode
                            last:xlast
                         options:xoptions];
}

- (void)MAP_ReturnError_Req:(UMASN1Object *)xparam
                     dialog:(NSString *)xdialogId
                   invokeId:(int64_t)xinvokeId  /* if not used: AUTO_ASSIGN_INVOKE_ID */
                   linkedId:(int64_t)xlinkedId  /* if not used: TCAP_UNDEFINED_LINKED_ID */
                     opCode:(UMLayerGSMMAP_OpCode *)xopcode
                  errorCode:(int64_t)xerrorCode
                    options:(NSDictionary *)xoptions
{
    UMLayerGSMMAP_Dialog *dialog = [self dialogById:xdialogId];
    if(dialog==NULL)
    {
        [logFeed minorErrorText:[NSString stringWithFormat:@"MAP_ReturnError_Req: Dialog ID %@ not found. Ignoring",xdialogId]];
        return;
    }
    [dialog MAP_ReturnError_Req:xparam
                       invokeId:xinvokeId  /* if not used: AUTO_ASSIGN_INVOKE_ID */
                       linkedId:xlinkedId  /* if not used: TCAP_UNDEFINED_LINKED_ID */
                         opCode:xopcode
                      errorCode:xerrorCode
                        options:xoptions];
}

- (NSString *)status
{
    return [NSString stringWithFormat:@"IS:%lu",[dialogs count]];
}

- (void)housekeepingTask
{
    UMGSMMAP_HousekeepingTask *task = [[UMGSMMAP_HousekeepingTask alloc]initForGSMMAP:self];
    //[self queueFromLower:task];
    [task main];
}


- (void)housekeeping
{
    if(self.housekeeping_running)
    {
        return;
    }
    self.housekeeping_running = YES;

    NSArray *keys = [dialogs allKeys];
    for(NSString *key in keys)
    {
        UMLayerGSMMAP_Dialog *dialog = dialogs[key];
        if(dialog.dialogIsClosed)
        {
            [dialogs removeObjectForKey:key];
        }
        if([dialog isTimedOut]==YES)
        {
            UMGSMMAP_TimeoutTask *task = [[UMGSMMAP_TimeoutTask alloc]initForGSMMAP:self dialog:dialog];
            [self queueFromLower:task];
        }
    }
    self.housekeeping_running = NO;
}

@end

//
//  UMLayerGSMMAP.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
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

@implementation UMLayerGSMMAP

@synthesize tcap;
@synthesize address;
@synthesize ssn;
@synthesize user;


- (UMLayerGSMMAP *)init
{
    self = [super init];
    if(self)
    {
        dialogs = [[UMSynchronizedDictionary alloc]init];
    }
    return self;
}


- (UMLayerGSMMAP *)initWithTaskQueueMulti:(UMTaskQueueMulti *)tq
{
    self = [super initWithTaskQueueMulti:tq];
    if(self)
    {
        dialogs = [[UMSynchronizedDictionary alloc]init];
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
    UMLayerGSMMAP_Dialog *dialog = [self dialogById:dialogId];
    if(dialog==NULL)
    {
        dialog = [self getNewDialogForUser:user];
    }
    
    NSLog(@"tcapBeginIndication creates a new dialogId: %@\n",dialog.userDialogId);
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
               callingAddress:src
                calledAddress:dst
              dialoguePortion:xdialoguePortion
                transactionId:localTransactionId
          remoteTransactionId:remoteTransactionId];
    if(components.count==0)
    {
        [dialog MAP_Delimiter_Req:options];
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
    if(dialog==NULL)
    {
        NSLog(@"tcapContinueIndication: DialogNotFound %@",dialogId);
    }
    else
    {
        NSLog(@"tcapContinueIndication\n");
        NSLog(@"    dialogId: %@\n",dialog.userDialogId);
        NSLog(@"    localTransactionId: %@\n",dialog.tcapTransactionId);
        NSLog(@"    remoteTransactionId: %@\n",dialog.tcapRemoteTransactionId);
        NSLog(@"    userIdentifier: %@\n",dialog.userIdentifier);
        if(dialog.tcapTransactionId == NULL)
        {
            dialog.tcapTransactionId = xlocalTransactionId;
        }
        if(dialog.tcapRemoteTransactionId == NULL)
        {
            dialog.tcapRemoteTransactionId = xremoteTransactionId;
        }
        [dialog MAP_ProcessComponents:components
                              options:options];
        [dialog MAP_Delimiter_Ind:options
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
        NSLog(@"tcapEndIndication: DialogNotFound %@",dialogId);
    }
    else
    {
        NSLog(@"tcapEndIndication\n");
        NSLog(@"    dialogId: %@\n",dialog.userDialogId);
        NSLog(@"    localTransactionId: %@\n",dialog.tcapTransactionId);
        NSLog(@"    remoteTransactionId: %@\n",dialog.tcapRemoteTransactionId);
        NSLog(@"    userIdentifier: %@\n",dialog.userIdentifier);
        if(dialog.tcapTransactionId == NULL)
        {
            dialog.tcapTransactionId = transactionId;
        }
        if(dialog.tcapRemoteTransactionId == NULL)
        {
            dialog.tcapRemoteTransactionId = remoteTransactionId;
        }
        @try
        {
            [dialog MAP_ProcessComponents:components options:options];
        }
        @catch(NSException *ex)
        {
            NSLog(@"Exception: %@",ex);
        }
        @try
        {
            [dialog MAP_Delimiter_Ind:options
                       callingAddress:src
                        calledAddress:dst
                      dialoguePortion:xdialoguePortion
                        transactionId:transactionId
                  remoteTransactionId:remoteTransactionId];
        }
        @catch(NSException *ex)
        {
            NSLog(@"Exception: %@",ex);
        }
        @try
        {
            [dialog MAP_Close_Ind:options];
        }
        @catch(NSException *ex)
        {
            NSLog(@"Exception: %@",ex);
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


    NSLog(@"tcapUnidirectionalIndication received");
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
        NSLog(@"Exception: %@",ex);
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
    NSLog(@"tcapUAbortIndication received");

    UMLayerGSMMAP_Dialog *dialog = [self dialogById:userDialogId];
    if(dialog==NULL)
    {
        NSLog(@"tcapUAbortIndication DialogNotFound %@",userDialogId);
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
        NSLog(@"Exception: %@",ex);
    }
    @try
    {
        [dialog MAP_Close_Ind:options];
    }
    @catch(NSException *ex)
    {
        NSLog(@"Exception: %@",ex);
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
    NSLog(@"tcapPAbortIndication received");

    UMLayerGSMMAP_Dialog *dialog = [self dialogById:userDialogId];
    if(dialog==NULL)
    {
        NSLog(@"tcapPAbortIndication DialogNotFound %@",userDialogId);
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
        NSLog(@"Exception: %@",ex);
    }

    @try
    {
        [dialog MAP_Close_Ind:options];
    }
    @catch(NSException *ex)
    {
        NSLog(@"Exception: %@",ex);
    }
}


- (void)tcapNoticeIndication:(NSString *)dialogId
           tcapTransactionId:(NSString *)localTransactionId
     tcapRemoteTransactionId:(NSString *)remoteTransactionId
                     variant:(UMTCAP_Variant)variant
              callingAddress:(SccpAddress *)src
               calledAddress:(SccpAddress *)dst
             dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
          applicationContext:(UMTCAP_asn1_objectIdentifier *)appContext
                    userInfo:(UMTCAP_asn1_userInformation *)xuserInfo
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

-(void) setConfig:(NSDictionary *)cfg
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
    /* lets call housekeeping once per second */
    houseKeepingTimer = [[UMTimer alloc]initWithTarget:self selector:@selector(housekeeping) object:NULL duration:1000000 name:@"gsmmap-housekeeping" repeats:YES];
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
    @synchronized(self)
    {
        lastDialogId = (lastDialogId + 1 ) % 0x7FFFFFFF;
        did = lastDialogId;
    }
    return [NSString stringWithFormat:@"D%08llX",(long long)did];
}


- (UMLayerGSMMAP_Dialog *)getNewDialogForUser:(id<UMLayerGSMMAP_UserProtocol>)u
{
    UMLayerGSMMAP_Dialog *d = [[UMLayerGSMMAP_Dialog alloc]init];
    d.userDialogId = [self getNewUserDialogId];
    d.tcapLayer = tcap;
    d.gsmmapLayer = self;
    d.mapUser = u;
    dialogs[d.userDialogId] = d;

    NSLog(@"getNewDialogForUser created a new dialog: %@\n",d.userDialogId);
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
        case 34:
            return @"systemFailure";
        case 35:
            return @"dataMissing";
        case 36:
            return @"unexpectedDataValue";
        case 21:
            return @"facilityNotSupported";
        case 28:
            return @"incompatibleTerminal";
        case 51:
            return @"resourceLimitation";
        case 1:
            return @"unknownSubscriber";
        case 44:
            return @"numberChanged";
        case 3:
            return @"unknownMSC";
        case 5:
            return @"unidentifiedSubscriber";
        case 7:
            return @"unknownEquipment";
        case 8:
            return @"roamingNotAllowed";
        case 9:
            return @"illegalSubscriber";
        case 12:
            return @"illegalEquipment";
        case 10:
            return @"bearerServiceNotProvisioned";
        case 11:
            return @"teleserviceNotProvisioned";
        case 25:
            return @"noHandoverNumberAvailable";
        case 26:
            return @"subsequentHandoverFailure";
        case 42:
            return @"targetCellOutsideGroupCallArea";
        case 40:
            return @"tracingBufferFull";
        case 39:
            return @"noRoamingNumberAvailable";
        case 27:
            return @"absentSubscriber";
        case 45:
            return @"busySubscriber";
        case 46:
            return @"noSubscriberReply";
        case 13:
            return @"callBarred";
        case 14:
            return @"forwardingViolation";
        case 47:
            return @"forwardingFailed";
        case 15:
            return @"cug-Reject";
        case 48:
            return @"or-NotAllowed";
        case 49:
            return @"ati-NotAllowed";
        case 60:
            return @"atsi-NotAllowed";
        case 61:
            return @"atm-NotAllowed";
        case 62:
            return @"informationNotAvailable";
        case 16:
            return @"illegalSS-Operation";
        case 17:
            return @"ss-ErrorStatus";
        case 18:
            return @"ss-NotAvailable";
        case 19:
            return @"ss-SubscriptionViolation";
        case 20:
            return @"ss-Incompatibility";
        case 71:
            return @"unknownAlphabet";
        case 72:
            return @"ussd-Busy";
        case 37:
            return @"pw-RegistrationFailure";
        case 38:
            return @"negativePW-Check";
        case 43:
            return @"numberOfPW-AttemptsViolation";
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
        case 6:
            return @"absentSubscriberSM";
        case 50:
            return @"noGroupCallNumberAvailable";
        case 22:
            return @"ongoingGroupCall";
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
    }
    return [NSString stringWithFormat:@"unknown-error(%d)",err];
}

- (void)housekeeping
{
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
            [dialog timeOut];
        }
    }
}

-(void) MAP_U_Abort_Req:(NSString *)dialogId
                options:(NSDictionary *)options
{
    UMLayerGSMMAP_Dialog *dialog = [self dialogById:dialogId];
    if(dialog==NULL)
    {
        NSLog(@"Dialog ID %@ not found. Ignoring",dialogId);
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
                  options:(NSDictionary *)options;
{
    UMLayerGSMMAP_Dialog *dialog = [self dialogById:dialogId];
    if(dialog==NULL)
    {
        NSLog(@"Dialog ID %@ not found. Ignoring",dialogId);
        return;
    }
    [dialog MAP_Delimiter_Req:options];
}

- (void)MAP_Close_Req:(NSString *)dialogId
              options:(NSDictionary *)options

{
    UMLayerGSMMAP_Dialog *dialog = [self dialogById:dialogId];
    if(dialog==NULL)
    {
        NSLog(@"Dialog ID %@ not found. Ignoring",dialogId);
        return;
    }
    [dialog MAP_Close_Req:options];
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
        NSLog(@"Dialog ID %@ not found. Ignoring",dialogId);
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
        NSLog(@"Dialog ID %@ not found. Ignoring",dialogId);
        return;
    }
    [dialog MAP_ReturnResult_Req:xparam
                        invokeId:xinvokeId  /* if not used: AUTO_ASSIGN_INVOKE_ID */
                        linkedId:xlinkedId  /* if not used: TCAP_UNDEFINED_LINKED_ID */
                          opCode:xopcode
                            last:xlast
                         options:xoptions];
}


- (NSString *)status
{
    return [NSString stringWithFormat:@"IS:%lu",[dialogs count]];
}


@end

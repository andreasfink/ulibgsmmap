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
#import "UMGSMMAP_U_Abort_Req_Task.h"
#import "UMGSMMAP_Delimiter_Req_Task.h"
#import "UMGSMMAP_Close_Req_Task.h"
#import "UMGSMMAP_U_Abort_Req_Task.h"
#import "UMGSMMAP_Invoke_Req_Task.h"
#import "UMGSMMAP_ReturnResult_Req_Task.h"
#import "UMGSMMAP_ReturnError_Req_Task.h"

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
    @autoreleasepool
    {
        self = [super init];
        if(self)
        {
            dialogs = [[UMSynchronizedDictionary alloc]init];
            _dialogIdLock = [[UMMutex alloc]initWithName:@"gsmmap-dialog-id-lock"];
            _dialogTimeout = 70.0;
            _houseKeepingTimerRun = [[UMAtomicDate alloc]init];
            _houseKeepingTimer = [[UMTimer alloc]initWithTarget:self
                                                       selector:@selector(housekeepingTask)
                                                         object:NULL
                                                       seconds:2.8
                                                           name:@"housekeeping"
                                                        repeats:YES];
            [_houseKeepingTimer start];

        }
        return self;
    }
}

- (UMLayerGSMMAP *)initWithTaskQueueMulti:(UMTaskQueueMulti *)tq
{
    return [self initWithTaskQueueMulti:tq name:@""];
}

- (UMLayerGSMMAP *)initWithTaskQueueMulti:(UMTaskQueueMulti *)tq name:(NSString *)name
{
    @autoreleasepool
    {
        self = [super initWithTaskQueueMulti:tq name:name];
        if(self)
        {
            dialogs = [[UMSynchronizedDictionary alloc]init];
            _dialogIdLock = [[UMMutex alloc]initWithName:@"gsmmap-dialog-id-lock"];
            _dialogTimeout = 70.0;
            _houseKeepingTimerRun = [[UMAtomicDate alloc]init];
            _houseKeepingTimer = [[UMTimer alloc]initWithTarget:self
                                                       selector:@selector(housekeeping)
                                                         object:NULL
                                                        seconds:1.1 /* every sec */
                                                           name:@"housekeeping"
                                                        repeats:YES];
            [_houseKeepingTimer start];
        }
        return self;
    }
}

- (void)tcapBeginIndication:(UMTCAP_UserDialogIdentifier *)tcapUserId
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
    @autoreleasepool
    {
        UMGSMMAP_DialogIdentifier *dialogId = [[UMGSMMAP_DialogIdentifier alloc]initWithTcapUserDialogIdentifier:tcapUserId];

        UMLayerGSMMAP_Dialog *dialog = [self getNewDialogForUser:user withId:dialogId];

        if(self.logLevel <= UMLOG_DEBUG)
        {
            [self.logFeed debugText:[NSString stringWithFormat:@"tcapBeginIndication creates a new dialogId: %@\n",dialog.userDialogId]];
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
                              options:options
                              willEnd:NO];
        [dialog MAP_Delimiter_Ind:options
                           dialog:dialogId
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
}

- (void)tcapContinueIndication:(UMTCAP_UserDialogIdentifier *)tcapUserId
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
    @autoreleasepool
    {
        UMGSMMAP_DialogIdentifier *dialogId = [[UMGSMMAP_DialogIdentifier alloc]initWithTcapUserDialogIdentifier:tcapUserId];
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
            [self.logFeed minorErrorText:[NSString stringWithFormat:@"tcapContinueIndication: DialogNotFound %@ for transaction [local %@ remote %@]",dialogId,xlocalTransactionId,xremoteTransactionId]];
            return;
        }
        else
        {
            if(self.logLevel <= UMLOG_DEBUG)
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
                [self.logFeed debugText:s];
            }
            if(dialog.tcapTransactionId == NULL)
            {
                dialog.tcapTransactionId = xlocalTransactionId;
            }
            if(dialog.tcapRemoteTransactionId == NULL)
            {
                dialog.tcapRemoteTransactionId = xremoteTransactionId;
            }
            /* we must set local addresses/remote addresses here because when processing components this info might already be needed */
            if(dialog.tcapContinueSeen == NO)
            {
                /* this is the first tcap continue so we take over the remote address for it */
                /* update the GT's based on the response but keep the translation types */
                int tt = dialog.remoteAddress.tt.tt;
                dialog.remoteAddress = src;
                dialog.remoteAddress.tt.tt = tt;
                
                tt = dialog.localAddress.tt.tt;
                dialog.localAddress = dst;
                dialog.localAddress.tt.tt = tt;
                
                dialog.tcapContinueSeen=YES;
            }
            [dialog MAP_ProcessComponents:components
                                  options:options
                                  willEnd:NO];
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
}

- (void)tcapEndIndication:(UMTCAP_UserDialogIdentifier *)tcapUserId
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
    @autoreleasepool
    {
        UMGSMMAP_DialogIdentifier *dialogId = [[UMGSMMAP_DialogIdentifier alloc]initWithTcapUserDialogIdentifier:tcapUserId];
        UMLayerGSMMAP_Dialog *dialog = [self dialogById:dialogId];
        if(dialog==NULL)
        {
            [self.logFeed minorErrorText:[NSString stringWithFormat:@"tcapEndIndication: DialogNotFound %@ for transaction [local %@ remote %@]",dialogId,transactionId,remoteTransactionId]];
            return;
        }
        else
        {
            if(self.logLevel <= UMLOG_DEBUG)
            {
                NSString *s = [NSString stringWithFormat:@"tcapEndIndication\n"
                               @"    dialogId: %@\n"
                               @"    localTransactionId: %@\n"
                               @"    remoteTransactionId: %@\n"
                               @"    userIdentifier: %@\n"
                               @"    dialoguePortion: %@\n",
                               dialog.userDialogId,
                               dialog.tcapTransactionId,
                               dialog.tcapRemoteTransactionId,
                               dialog.userIdentifier,
                               xdialoguePortion];
                [self.logFeed debugText:s];
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
            NSMutableDictionary *xoptions = [options mutableCopy];
            xoptions[@"sccp-calling-address"] = src;
            xoptions[@"sccp-called-address"] = dst;;
            options = xoptions;

            @try
            {
                [dialog MAP_ProcessComponents:components
                                      options:options
                                      willEnd:YES];
            }
            @catch(NSException *ex)
            {
                [self.logFeed majorErrorText:[NSString stringWithFormat:@"Exception: %@",ex]];
            }
            @try
            {
                [dialog MAP_Close_Ind:options];
            }
            @catch(NSException *ex)
            {
                [self.logFeed majorErrorText:[NSString stringWithFormat:@"Exception: %@",ex]];
            }
        }
    }
}

- (void)tcapUnidirectionalIndication:(UMTCAP_UserDialogIdentifier *)tcapUserId
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
    @autoreleasepool
    {
        //UMGSMMAP_DialogIdentifier *dialogId =   [[UMGSMMAP_DialogIdentifier alloc] initWithTcapUserDialogIdentifier:tcapUserId];
        if(self.logLevel <= UMLOG_DEBUG)
        {
            [self.logFeed debugText:@"tcapUnidirectionalIndication received"];
        }

        @try
        {
            [user queueMAP_Unidirectional_Ind:options
                               callingAddress:src
                                calledAddress:dst
                              dialoguePortion:xdialoguePortion
                                transactionId:localTransactionId
                          remoteTransactionId:remoteTransactionId];
        }
        @catch(NSException *ex)
        {
            [self.logFeed majorErrorText:[NSString stringWithFormat:@"Exception: %@",ex]];
        }
    }
}

- (void)tcapUAbortIndication:(UMTCAP_UserDialogIdentifier  *)tcapUserId
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
    @autoreleasepool
    {
        UMGSMMAP_DialogIdentifier *dialogId =   [[UMGSMMAP_DialogIdentifier alloc] initWithTcapUserDialogIdentifier:tcapUserId];

        if(self.logLevel <= UMLOG_DEBUG)
        {
            [self.logFeed debugText:@"tcapUAbortIndication received"];
        }
        UMLayerGSMMAP_Dialog *dialog = [self dialogById:dialogId];
        if(dialog==NULL)
        {
            [self.logFeed minorErrorText:[NSString stringWithFormat:@"tcapUAbortIndication: Dialog %@ not found for transaction [local %@ remote %@]",tcapUserId,localTransactionId,remoteTransactionId]];
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
            [self.logFeed majorErrorText:[NSString stringWithFormat:@"Exception: %@",ex]];
        }
        @try
        {
            [dialog MAP_Close_Ind:options];
        }
        @catch(NSException *ex)
        {
            [self.logFeed majorErrorText:[NSString stringWithFormat:@"Exception: %@",ex]];
        }
    }
}


- (void)tcapPAbortIndication:(UMTCAP_UserDialogIdentifier *)tcapUserId
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
    @autoreleasepool
    {
        UMGSMMAP_DialogIdentifier *dialogId =   [[UMGSMMAP_DialogIdentifier alloc] initWithTcapUserDialogIdentifier:tcapUserId];
        if(self.logLevel <=UMLOG_DEBUG)
        {
            [self.logFeed debugText:[NSString stringWithFormat:@"tcapPAbortIndication for dialog %@",dialogId]];
        }
        UMLayerGSMMAP_Dialog *dialog = [self dialogById:dialogId];
        if(dialog==NULL)
        {
            [self.logFeed minorErrorText:[NSString stringWithFormat:@"tcapPAbortIndication: Dialog %@ not found for transaction [local %@ remote %@]",dialogId,localTransactionId,remoteTransactionId]];
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
            /* this is an implicit close */
        }
        @catch(NSException *ex)
        {
            [self.logFeed majorErrorText:[NSString stringWithFormat:@"Exception: %@",ex]];
        }
    }
}


- (void)tcapNoticeIndication:(UMTCAP_UserDialogIdentifier *)tcapUserId
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
    @autoreleasepool
    {
        UMGSMMAP_DialogIdentifier *dialogId =   [[UMGSMMAP_DialogIdentifier alloc] initWithTcapUserDialogIdentifier:tcapUserId];

        UMLayerGSMMAP_Dialog *dialog = [self dialogById:dialogId];

        [dialog MAP_Notice_Ind:options
             tcapTransactionId:localTransactionId
                        reason:reason];
    }
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
    if (cfg[@"timeout"])
    {
        _dialogTimeout = [cfg[@"timeout"] doubleValue];
    }
    else
    {
        _dialogTimeout = 70;
    }


    if(_dialogTimeout <= 5.0)
    {
        NSLog(@"GSMMAMP Dialog Timeout is below 5s. Setting it to 5s");
        _dialogTimeout = 5.0;
    }
    else if(_dialogTimeout >=120.0)
    {
        NSLog(@"GSMMAMP Dialog Timeout is above 120s. Setting it to 70s");
        _dialogTimeout = 70.0;
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
    /* lets call housekeeping  */
}

- (UMASN1Object *)decodeASN1:(UMASN1Object *)params
               operationCode:(int64_t)opcode
               operationType:(UMTCAP_InternalOperation)operationType
               operationName:(NSString **)operationName
                     context:(id)context
{
    @autoreleasepool
    {
        UMASN1Object<UMGSMMAP_asn1_protocol>  *o;
        if(params)
        {
            UMGSMMAP_asn1 *asn1 = [[UMGSMMAP_asn1 alloc]initWithASN1Object:params context:context];
            NSString *name = NULL;
            o = [asn1 decodeASN1opcode:opcode
                         operationType:operationType
                         operationName:&name
                           withContext:context];
        }
        else
        {
            UMGSMMAP_asn1 *asn1 = [[UMGSMMAP_asn1 alloc]init];
            NSString *name = NULL;
            o = [asn1 decodeASN1opcode:opcode
                         operationType:operationType
                         operationName:&name
                           withContext:context];
            o = NULL;
        }
        return o;
    }
}



- (UMGSMMAP_DialogIdentifier *)getNewUserDialogId
{
    @autoreleasepool
    {
        static int64_t lastDialogId =1;
        int64_t did;
        [_dialogIdLock lock];
        lastDialogId = (lastDialogId + 1 ) % 0x7FFFFFFF;
        did = lastDialogId;
        [_dialogIdLock unlock];
        return [[UMGSMMAP_DialogIdentifier alloc]initWithString: [NSString stringWithFormat:@"D%08llX",(long long)did]];
    }
}

- (UMLayerGSMMAP_Dialog *)getNewDialogForUser:(id<UMLayerGSMMAP_UserProtocol>)u withId:(UMGSMMAP_DialogIdentifier *)dialogId
{
    @autoreleasepool
    {
        UMLayerGSMMAP_Dialog *d = [[UMLayerGSMMAP_Dialog alloc]init];
        d.userDialogId = dialogId;
        d.tcapLayer = tcap;
        d.gsmmapLayer = self;
        d.mapUser = u;
        d.logFeed = self.logFeed;
        d.logLevel = self.logLevel;
        if(self.dialogTimeout > 0.0)
        {
            d.timeoutInSeconds = self.dialogTimeout;
        }
        dialogs[d.userDialogId.description] = d;
        [d touch];
        return d;
    }
}

- (NSUInteger)dialogsCount
{
    return dialogs.count;
}

- (UMLayerGSMMAP_Dialog *)getNewDialogForUser:(id<UMLayerGSMMAP_UserProtocol>)u
{
    UMGSMMAP_DialogIdentifier *dialogId  = [self getNewUserDialogId];
    UMLayerGSMMAP_Dialog *d = [self getNewDialogForUser:u withId:dialogId];
    return d;
}

- (UMLayerGSMMAP_Dialog *)dialogById:(UMGSMMAP_DialogIdentifier *)did
{
    return dialogs[did.description];
}

- (NSString *)decodeError:(int)err
{
    return [UMLayerGSMMAP decodeError:err];
}

- (void)tcBeginIndication
{
    
}


- (void)tcCancelIndication
{
    /* future implementation */
}


- (void)tcContinueIndication
{
    /* future implementation */
}


- (void)tcEndIndication
{
    /* future implementation */
}


- (void)tcInvokeIndication
{
    /* future implementation */
}


- (void)tcNoticeIndication
{
    /* future implementation */
}


- (void)tcPAbortIndication
{
    /* future implementation */
}


- (void)tcRRejectIndication
{
    /* future implementation */
}


- (void)tcResultLastIndication
{
    /* future implementation */
}

- (void)tcResultNotLastIndication
{
    /* future implementation */
}


- (void)tcUAbortIndication
{
    /* future implementation */
}


- (void)tcUErrorIndication
{
    /* future implementation */
}


- (void)tcURejectIndication
{
    /* future implementation */
}


- (void)tcUniIndication
{
    /* future implementation */
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


-(void) queueMAP_U_Abort_Req:(UMGSMMAP_DialogIdentifier *)dialogId
                     options:(NSDictionary *)options
                      result:(UMTCAP_asn1_Associate_result *)result
                  diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic
                    userInfo:(UMTCAP_asn1_userInformation *)userInfo
                       cause:(int64_t)cause
{
    @autoreleasepool
    {
        UMGSMMAP_U_Abort_Req_Task *task = [[UMGSMMAP_U_Abort_Req_Task alloc]initWithInstance:self
                                                                                     dialog:dialogId
                                                                                    options:options
                                                                                     result:result
                                                                                 diagnostic:result_source_diagnostic
                                                                                   userInfo:userInfo
                                                                                       cause:cause];
        [self queueFromUpper:task];
    }
}

-(void) executeMAP_U_Abort_Req:(UMGSMMAP_DialogIdentifier *)dialogId
                       options:(NSDictionary *)options
                        result:(UMTCAP_asn1_Associate_result *)result
                    diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic
                      userInfo:(UMTCAP_asn1_userInformation *)userInfo
                         cause:(int64_t)cause
{
    @autoreleasepool
    {
        UMLayerGSMMAP_Dialog *dialog = [self dialogById:dialogId];
        if(dialog==NULL)
        {
            [self.logFeed minorErrorText:[NSString stringWithFormat:@"MAP_U_Abort_Req: Dialog ID %@ not found. Ignoring",dialogId]];
            return;
        }
        

        [dialog MAP_U_Abort_Req:options
                 callingAddress:NULL
                  calledAddress:NULL
                          cause:cause
                         result:result
                     diagnostic:result_source_diagnostic
                       userInfo:userInfo];
    }
}


-(UMGSMMAP_DialogIdentifier *) executeMAP_Open_Req_forUser:(id<UMLayerGSMMAP_UserProtocol>)xuser
                                                   variant:(UMTCAP_Variant)variant
                                            callingAddress:(SccpAddress *)src
                                             calledAddress:(SccpAddress *)dst
                                        applicationContext:(UMTCAP_asn1_objectIdentifier *)appContext
                                                  userInfo:(UMTCAP_asn1_userInformation *)xuserInfo
                                            userIdentifier:(UMGSMMAP_UserIdentifier *)xuserIdentifier
                                                   options:(NSDictionary *)options
{
    @autoreleasepool
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
}

-(void) queueMAP_Delimiter_Req:(UMGSMMAP_DialogIdentifier *)dialogId
                callingAddress:(SccpAddress *)src
                 calledAddress:(SccpAddress *)dst
                       options:(NSDictionary *)options
                        result:(UMTCAP_asn1_Associate_result *)result
                    diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic
{
    @autoreleasepool
    {

        UMGSMMAP_Delimiter_Req_Task *task = [[UMGSMMAP_Delimiter_Req_Task alloc]initWithInstance:self
                                                                                          dialog:dialogId
                                                                                  callingAddress:src
                                                                                   calledAddress:dst
                                                                                         options:options
                                                                                          result:result
                                                                                      diagnostic:result_source_diagnostic];
        [self queueFromUpper:task];
    }
}

-(void) executeMAP_Delimiter_Req:(UMGSMMAP_DialogIdentifier *)dialogId
                  callingAddress:(SccpAddress *)src
                   calledAddress:(SccpAddress *)dst
                         options:(NSDictionary *)options
                          result:(UMTCAP_asn1_Associate_result *)result
                      diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic
{
    @autoreleasepool
    {
        NSString *s = UMBacktrace(NULL,0);
        NSLog(@"**** DEBUG*** executeMAP_Delimiter_Req:\n%@",s);
        UMLayerGSMMAP_Dialog *dialog = [self dialogById:dialogId];
        
        

        if(dialog==NULL)
        {
            [self.logFeed minorErrorText:[NSString stringWithFormat:@"MAP_Delimiter_Req: Dialog ID %@ not found. Ignoring",dialogId]];
            return;
        }
        [dialog setOptions:options];
        [dialog MAP_Delimiter_Req:options
                   callingAddress:src
                    calledAddress:dst
                           result:result
                       diagnostic:result_source_diagnostic];
    }
}


-(void) executeMAP_Delimiter_Req_Prepare:(UMGSMMAP_DialogIdentifier *)dialogId
                          callingAddress:(SccpAddress *)src
                           calledAddress:(SccpAddress *)dst
                                 options:(NSDictionary *)options
                                  result:(UMTCAP_asn1_Associate_result *)result
                              diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic
{
    @autoreleasepool
    {
        UMLayerGSMMAP_Dialog *dialog = [self dialogById:dialogId];
        if(dialog==NULL)
        {
            [self.logFeed minorErrorText:[NSString stringWithFormat:@"MAP_Delimiter_Req: Dialog ID %@ not found. Ignoring",dialogId]];
            return;
        }
        [dialog setOptions:options];
        [dialog MAP_Delimiter_Req_Prepare:options
                           callingAddress:src
                            calledAddress:dst
                                   result:result
                               diagnostic:result_source_diagnostic
				 userInfo:NULL];
    }
}

-(void) MAP_Delimiter_Req:(UMGSMMAP_DialogIdentifier *)dialogId
                  options:(NSDictionary *)options;
{
    @autoreleasepool
    {
        UMLayerGSMMAP_Dialog *dialog = [self dialogById:dialogId];
        if(dialog==NULL)
        {
            [self.logFeed minorErrorText:[NSString stringWithFormat:@"MAP_Delimiter_Req1: Dialog ID %@ not found. Ignoring",dialogId]];
            return;
        }
        [dialog MAP_Delimiter_Req:options];
    }
}


- (void)queueMAP_Close_Req:(UMGSMMAP_DialogIdentifier *)dialogId
              callingAddress:(SccpAddress *)src
               calledAddress:(SccpAddress *)dst
                     options:(NSDictionary *)options
                      result:(UMTCAP_asn1_Associate_result *)result
                  diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic
{
    @autoreleasepool
    {
        UMGSMMAP_Close_Req_Task *task = [[UMGSMMAP_Close_Req_Task alloc]initWithInstance:self
                                                                                  dialog:(UMGSMMAP_DialogIdentifier *)dialogId
                                                                          callingAddress:(SccpAddress *)src
                                                                           calledAddress:(SccpAddress *)dst
                                                                                 options:(NSDictionary *)options
                                                                                  result:(UMTCAP_asn1_Associate_result *)result
                                                                              diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic];
        [self queueFromUpper:task];
    }
}

- (void)executeMAP_Close_Req:(UMGSMMAP_DialogIdentifier *)dialogId
              callingAddress:(SccpAddress *)src
               calledAddress:(SccpAddress *)dst
                     options:(NSDictionary *)options
                      result:(UMTCAP_asn1_Associate_result *)result
                  diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic
{
    @autoreleasepool
    {
        UMLayerGSMMAP_Dialog *dialog = [self dialogById:dialogId];
        if((dialog==NULL) || (dialog.dialogIsClosed))
        {
            /* the dialog is already closed from the remote. so we can safely ignore it */
            //[self.logFeed minorErrorText:[NSString stringWithFormat:@"MAP_Close_Req: Dialog ID %@ not found. Ignoring",dialogId]];
            return;
        }
        [dialog MAP_Close_Req:options
               callingAddress:src
                calledAddress:dst
                       result:result
                   diagnostic:result_source_diagnostic];
    }
}

- (void) queueMAP_Invoke_Req:(UMASN1Object *)param
                      dialog:(UMGSMMAP_DialogIdentifier *)dialogId
                    invokeId:(int64_t)invokeId
                    linkedId:(int64_t)linkedId
                      opCode:(UMLayerGSMMAP_OpCode *)opcode
                        last:(int64_t)last
                     options:(NSDictionary *)options
{
    @autoreleasepool
    {
        UMGSMMAP_Invoke_Req_Task *task = [[UMGSMMAP_Invoke_Req_Task alloc]initWithInstance:self
                                                                                     param:param
                                                                                    dialog:dialogId
                                                                                  invokeId:invokeId
                                                                                  linkedId:linkedId
                                                                                    opCode:opcode
                                                                                      last:last
                                                                                   options:options];
        [self queueFromUpper:task];
    }
}

- (void) executeMAP_Invoke_Req:(UMASN1Object *)param
                        dialog:(UMGSMMAP_DialogIdentifier *)dialogId
                      invokeId:(int64_t)xinvokeId
                      linkedId:(int64_t)xlinkedId
                        opCode:(UMLayerGSMMAP_OpCode *)xopcode
                          last:(int64_t)last
                       options:(NSDictionary *)options
{
    UMLayerGSMMAP_Dialog *dialog = [self dialogById:dialogId];
    if(dialog==NULL)
    {
        [self.logFeed minorErrorText:[NSString stringWithFormat:@"MAP_Invoke_Req: Dialog ID %@ not found. Ignoring",dialogId]];
        return;
    }

    [dialog MAP_Invoke_Req:param
                  invokeId:xinvokeId
                  linkedId:xlinkedId
                    opCode:xopcode
                      last:last
                   options:options];
}

- (void) queueMAP_ReturnResult_Req:(UMASN1Object *)param
                              dialog:(UMGSMMAP_DialogIdentifier *)dialogId
                            invokeId:(int64_t)invokeId
                            linkedId:(int64_t)linkedId
                              opCode:(UMLayerGSMMAP_OpCode *)opcode
                                last:(int64_t)last
                             options:(NSDictionary *)options
{
    @autoreleasepool
    {
        UMGSMMAP_ReturnResult_Req_Task *task = [[UMGSMMAP_ReturnResult_Req_Task alloc] initWithInstance:self
                                                                                                  param:param
                                                                                                 dialog:dialogId
                                                                                               invokeId:invokeId
                                                                                               linkedId:linkedId
                                                                                                 opCode:opcode
                                                                                                   last:last
                                                                                                options:options];
        [self queueFromUpper:task];
    }
}

- (void) executeMAP_ReturnResult_Req:(UMASN1Object *)xparam
                              dialog:(UMGSMMAP_DialogIdentifier *)dialogId
                            invokeId:(int64_t)xinvokeId
                            linkedId:(int64_t)xlinkedId
                              opCode:(UMLayerGSMMAP_OpCode *)xopcode
                                last:(int64_t)xlast
                             options:(NSDictionary *)xoptions
{
    @autoreleasepool
    {
        UMLayerGSMMAP_Dialog *dialog = [self dialogById:dialogId];
        if(dialog==NULL)
        {
            [self.logFeed minorErrorText:[NSString stringWithFormat:@"MAP_ReturnResult_Req: Dialog ID %@ not found. Ignoring",dialogId]];
            return;
        }
        [dialog MAP_ReturnResult_Req:xparam
                            invokeId:xinvokeId  /* if not used: AUTO_ASSIGN_INVOKE_ID */
                            linkedId:xlinkedId  /* if not used: TCAP_UNDEFINED_LINKED_ID */
                              opCode:xopcode
                                last:xlast
                             options:xoptions];
    }
}

- (void)queueMAP_ReturnError_Req:(UMASN1Object *)param
                          dialog:(UMGSMMAP_DialogIdentifier *)dialogId
                        invokeId:(int64_t)invokeId
                        linkedId:(int64_t)linkedId
                          opCode:(UMLayerGSMMAP_OpCode *)opcode
                       errorCode:(int64_t)error
                         options:(NSDictionary *)options
{
    @autoreleasepool
    {
        UMGSMMAP_ReturnError_Req_Task *task = [[UMGSMMAP_ReturnError_Req_Task alloc] initWithInstance:self
                                                                                                param:param
                                                                                               dialog:dialogId
                                                                                             invokeId:invokeId
                                                                                             linkedId:linkedId
                                                                                               opCode:opcode
                                                                                                error:error
                                                                                              options:options];
        [self queueFromUpper:task];
    }
}

- (void)executeMAP_ReturnError_Req:(UMASN1Object *)xparam
                            dialog:(UMGSMMAP_DialogIdentifier *)xdialogId
                          invokeId:(int64_t)xinvokeId  /* if not used: AUTO_ASSIGN_INVOKE_ID */
                          linkedId:(int64_t)xlinkedId  /* if not used: TCAP_UNDEFINED_LINKED_ID */
                            opCode:(UMLayerGSMMAP_OpCode *)xopcode
                         errorCode:(int64_t)xerrorCode
                           options:(NSDictionary *)xoptions
{
    @autoreleasepool
    {
        UMLayerGSMMAP_Dialog *dialog = [self dialogById:xdialogId];
        if(dialog==NULL)
        {
            [self.logFeed minorErrorText:[NSString stringWithFormat:@"MAP_ReturnError_Req: Dialog ID %@ not found. Ignoring",xdialogId]];
            return;
        }
        [dialog MAP_ReturnError_Req:xparam
                           invokeId:xinvokeId  /* if not used: AUTO_ASSIGN_INVOKE_ID */
                           linkedId:xlinkedId  /* if not used: TCAP_UNDEFINED_LINKED_ID */
                             opCode:xopcode
                          errorCode:xerrorCode
                            options:xoptions];
    }
}

- (NSString *)status
{
    return [NSString stringWithFormat:@"IS:%lu",(unsigned long)[dialogs count]];
}

- (void)housekeepingTask
{
    @autoreleasepool
    {
        UMGSMMAP_HousekeepingTask *task = [[UMGSMMAP_HousekeepingTask alloc]initForGSMMAP:self];
        //[self queueFromLower:task];
        [task main];
    }
}


- (void)housekeeping
{
    @autoreleasepool
    {

        if(self.housekeeping_running)
        {
            [_houseKeepingTimerRun touch];
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
            else if([dialog isTimedOut]==YES)
            {

                UMGSMMAP_TimeoutTask *task = [[UMGSMMAP_TimeoutTask alloc]initForGSMMAP:self dialog:dialog];
                [self queueFromAdmin:task];
            }
        }
        self.housekeeping_running = NO;
    }
}

- (void)dump:(NSFileHandle *)filehandler
{
    [super dump:filehandler];
    
    NSArray *allDialogs = [dialogs allKeys];
    for(NSString *did in allDialogs)
    {
        NSMutableString *s = [[NSMutableString alloc]init];
        [s appendString:@"    ----------------------------------------------------------------------------\n"];
        [s appendFormat:@"    MAP Dialog: %@\n",did];
        [s appendString:@"    ----------------------------------------------------------------------------\n"];
        [filehandler writeData: [s dataUsingEncoding:NSUTF8StringEncoding]];
        UMLayerGSMMAP_Dialog *d = dialogs[did];
        [d dump:filehandler];
    }
}

- (NSDictionary *)apiStatus
{
    NSDictionary *d = [[NSDictionary alloc]init];
    return d;
}

- (SccpAddress *)dialogLocalSccpAddress:(UMGSMMAP_DialogIdentifier *)dialogId
{
    UMLayerGSMMAP_Dialog *dialog = [self dialogById:dialogId];
    return dialog.localAddress;
}

- (SccpAddress *)dialogRemoteSccpAddress:(UMGSMMAP_DialogIdentifier *)dialogId
{
    UMLayerGSMMAP_Dialog *dialog = [self dialogById:dialogId];
    return dialog.remoteAddress;
}

- (void)setDialogLocalSccpAddress:(UMGSMMAP_DialogIdentifier *)dialogId sccpAddress:(SccpAddress *)addr
{
    UMLayerGSMMAP_Dialog *dialog = [self dialogById:dialogId];
    dialog.localAddress = addr;

}
- (void)setDialogRemoteSccpAddress:(UMGSMMAP_DialogIdentifier *)dialogId sccpAddress:(SccpAddress *)addr
{
    UMLayerGSMMAP_Dialog *dialog = [self dialogById:dialogId];
    dialog.remoteAddress = addr;

}

SccpAddress *remoteAddress;

@end

//
//  UMGSMMAP_Dialog.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMLayerGSMMAP_Dialog.h"
#import "UMLayerGSMMAP.h"

@implementation UMLayerGSMMAP_Dialog

#pragma mark -
#pragma mark Properties

@synthesize userDialogId;
@synthesize tcapTransactionId;
@synthesize userIdentifier;
@synthesize mapUser;
@synthesize tcapLayer;
@synthesize gsmmapLayer;
@synthesize applicationContext;
@synthesize applicationContext2;
@synthesize localAddress;
@synthesize remoteAddress;
@synthesize dialogProtocolVersion;
@synthesize variant;
@synthesize tcapRemoteTransactionId;

#pragma mark -
#pragma mark Initialisation

- (UMLayerGSMMAP_Dialog *)init
{
    self = [super init];
    if(self)
    {
        _nextInvokeId = 0;
        pendingOutgoingComponents = [[UMSynchronizedArray alloc]init];
        timeoutValue = 90;
        _startDate = [NSDate new];
        _lastActivity = [[UMAtomicDate alloc]init];
        _logLevel = UMLOG_MAJOR;
    }
    return self;
}


- (int64_t)nextInvokeId
{

    int64_t inv = _nextInvokeId;
    _nextInvokeId++;
    _nextInvokeId = _nextInvokeId % 0xFF;
    return inv;
}

- (void) setThisInvokeId:(int64_t)iid
{
    _nextInvokeId = (iid + 1) % 0xFF;
}

- (UMGSMMAP_DialogIdentifier *)getNewUserDialogId
{
    return NULL;
}

- (void)tcapBeginIndication:(NSString *)userDialogId
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

}

#pragma mark -
#pragma mark Various helper


- (UMASN1Object *)decodeASN1:(UMASN1Object *)params
               operationCode:(int64_t)opcode
               operationType:(UMTCAP_Operation)operation
               operationName:(NSString **)xoperationName
                     context:(id)context
{
    return NULL;
}

- (NSString *)decodeError:(int)err
{
    return [UMLayerGSMMAP decodeError:err];

}

- (void)touch
{
    [_lastActivity touch];

}

- (BOOL)isTimedOut
{
    BOOL r = NO;
    NSTimeInterval duration = [[NSDate date]timeIntervalSinceDate:_lastActivity.date];
    if(duration > timeoutValue)
    {
        r = YES;
    }
    return r;
}

/* --------------------------------------------------------------------------- */
/*  DIALOG HANDLING */
/* --------------------------------------------------------------------------- */
#pragma mark -
#pragma mark Dialog Handling Methods


-(void) MAP_Open_Req_forUser:(id<UMLayerGSMMAP_UserProtocol>)user
                        tcap:(UMLayerTCAP *)xtcap
                         map:(UMLayerGSMMAP *)xgsmmap
                     variant:(UMTCAP_Variant)xvariant
              callingAddress:(SccpAddress *)src
               calledAddress:(SccpAddress *)dst
          applicationContext:(UMTCAP_asn1_objectIdentifier *)appContext
                    userInfo:(UMTCAP_asn1_userInformation *)xuserInfo
              userIdentifier:(UMGSMMAP_UserIdentifier *)xuserIdentifier
                     options:(NSDictionary *)xoptions
{
    [self touch];

    self.mapUser = user;
    self.tcapLayer = xtcap;
    self.gsmmapLayer = xgsmmap;
    self.variant = xvariant;
    self.localAddress = src;
    self.remoteAddress = dst;
    self.applicationContext = appContext;
    self.requestUserInfo = xuserInfo;

    if((appContext) || (xuserInfo))
    {
        self.dialogRequestRequired=YES;
        uint8_t ver[]  = { 0x07,0x80 };
        UMASN1BitString *v = [[UMASN1BitString alloc]init];
        v.asn1_data = [NSData dataWithBytes:ver  length:sizeof(ver)];
        self.dialogProtocolVersion = v;
    }
    self.userIdentifier  = xuserIdentifier;

    UMTCAP_Transaction *t = [tcapLayer getNewOutgoingTransactionForUserDialogId:userDialogId user:self.gsmmapLayer];
    self.tcapTransactionId = t.localTransactionId;

    self.initiatedOutgoing = YES;
    self.openEstablished = NO;
    pendingOutgoingComponents = [[UMSynchronizedArray alloc]init];
    pendingIncomingComponents = [[UMSynchronizedArray alloc]init];
}


-(void) MAP_Open_Ind_forUser:(id<UMLayerGSMMAP_UserProtocol>)user
                        tcap:(UMLayerTCAP *)xtcap
                         map:(UMLayerGSMMAP *)xgsmmap
                     variant:(UMTCAP_Variant)xvariant
              callingAddress:(SccpAddress *)src
               calledAddress:(SccpAddress *)dst
             dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
               transactionId:(NSString *)localTransactionId
         remoteTransactionId:(NSString *)remoteTransactionId
                     options:(NSDictionary *)xoptions
{
    [self touch];

    NSMutableDictionary *yoptions = [xoptions mutableCopy];
    yoptions[@"gsmmap-timestamp"] = [NSDate new];
    if(xgsmmap.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"MAP_Open_Ind_forUser\n"
                       @"\tlocalTransactionId: %@\n"
                       @"\tremoteTransactionId: %@\n"
                       @"\tuserDialogId: %@\n"
                       @"\tuserIdentifier: %@\n",
                       localTransactionId,
                       remoteTransactionId,
                       self.userDialogId,
                       self.userIdentifier];
        [xgsmmap.logFeed debugText:s];
    }
    self.mapUser = user;
    self.tcapLayer = xtcap;
    self.gsmmapLayer = xgsmmap;
    self.variant = xvariant;
    self.remoteAddress = src;
    self.localAddress = dst;

    if(xdialoguePortion && xvariant==TCAP_VARIANT_ITU)
    {
        UMTCAP_itu_asn1_dialoguePortion *itu = (UMTCAP_itu_asn1_dialoguePortion *)xdialoguePortion;
        self.applicationContext = itu.dialogRequest.objectIdentifier;
        self.requestUserInfo = itu.dialogRequest.user_information;
        self.dialogProtocolVersion = itu.dialogRequest.protocolVersion;
    }
    self.tcapRemoteTransactionId = remoteTransactionId;
    self.tcapTransactionId = localTransactionId;
    if(self.applicationContext)
    {
        self.dialogResponseRequired = YES;
    }

    self.initiatedOutgoing = NO;
    self.openEstablished = YES;
    pendingOutgoingComponents = [[UMSynchronizedArray alloc]init];
    pendingIncomingComponents = [[UMSynchronizedArray alloc]init];

    if(self.userIdentifier==NULL)
    {
        UMGSMMAP_UserIdentifier *uid = [user getNewUserIdentifier];
        self.userIdentifier = uid;
        if(xgsmmap.logLevel <= UMLOG_DEBUG)
        {
            NSString *s = [NSString stringWithFormat:@"newUserIdentifier: %@",uid];
            [xgsmmap.logFeed debugText:s];
        }
    }
    else
    {
        if(xgsmmap.logLevel <= UMLOG_DEBUG)
        {
            NSString *s = [NSString stringWithFormat:@"existingUserIdentifier: %@",self.userIdentifier];
            [xgsmmap.logFeed debugText:s];
        }
    }
    [user queueMAP_Open_Ind:self.userIdentifier
                     dialog:self.userDialogId
                transaction:localTransactionId
          remoteTransaction:remoteTransactionId
                        map:xgsmmap
                    variant:xvariant
             callingAddress:src
              calledAddress:dst
            dialoguePortion:xdialoguePortion
                    options:xoptions];
}

-(void) MAP_Open_Resp_forUser:(id<UMLayerGSMMAP_UserProtocol>)user
                         tcap:(UMLayerTCAP *)xtcap
                          map:(UMLayerGSMMAP *)xgsmmap
                      variant:(UMTCAP_Variant)xvariant
               callingAddress:(SccpAddress *)src
                calledAddress:(SccpAddress *)dst
              dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
                transactionId:(NSString *)localTransactionId
          remoteTransactionId:(NSString *)remoteTransactionId
                      options:(NSDictionary *)xoptions
{
    [self touch];

    if(xgsmmap.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"MAP_Open_Resp_forUser\n"
                       @"\tlocalTransactionId: %@\n"
                       @"\tremoteTransactionId: %@\n"
                       @"\tuserDialogId: %@\n"
                       @"\tuserIdentifier: %@\n",
                       localTransactionId,
                       remoteTransactionId,
                       self.userDialogId,
                       self.userIdentifier];
        [xgsmmap.logFeed debugText:s];
    }
    self.mapUser = user;
    self.tcapLayer = xtcap;
    self.gsmmapLayer = xgsmmap;
    self.variant = xvariant;
    self.localAddress = src;
    self.remoteAddress = dst;
    self.tcapTransactionId = localTransactionId;
    self.tcapRemoteTransactionId = remoteTransactionId;


    if(xdialoguePortion && xvariant==TCAP_VARIANT_ITU)
    {
        UMTCAP_itu_asn1_dialoguePortion *itu = (UMTCAP_itu_asn1_dialoguePortion *)xdialoguePortion;
        self.responseApplicationContext = itu.dialogRequest.objectIdentifier;
        self.responseUserInfo = itu.dialogRequest.user_information;
    }

    self.openEstablished = YES;
    pendingOutgoingComponents = [[UMSynchronizedArray alloc]init];
    pendingIncomingComponents = [[UMSynchronizedArray alloc]init];

    UMGSMMAP_UserIdentifier *uid = [user getNewUserIdentifier];
    self.userIdentifier = uid;
    
    NSMutableDictionary *options = [xoptions mutableCopy];
    options[@"gsmmap-timestamp"] = [NSDate new];

    [user queueMAP_Open_Resp:uid
                           dialog:self.userDialogId
                      transaction:self.tcapTransactionId
                remoteTransaction:self.tcapRemoteTransactionId
                              map:xgsmmap
                          variant:xvariant
                   callingAddress:src
                    calledAddress:dst
                  dialoguePortion:xdialoguePortion
                          options:options];
}

- (void)MAP_Delimiter_Req:(NSDictionary *)xoptions
{
    return [self MAP_Delimiter_Req:xoptions result:NULL diagnostic:NULL];
}


- (void)MAP_Delimiter_Req:(NSDictionary *)xoptions
                   result:(UMTCAP_asn1_Associate_result *)result
               diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic
{
    [self MAP_Delimiter_Req:xoptions
             callingAddress:NULL
              calledAddress:NULL
                     result:result
                 diagnostic:result_source_diagnostic];
}


- (void)MAP_Delimiter_Req:(NSDictionary *)xoptions
           callingAddress:(SccpAddress *)src
            calledAddress:(SccpAddress *)dst
                   result:(UMTCAP_asn1_Associate_result *)result
               diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic
{
    [self MAP_Delimiter_Req:xoptions
             callingAddress:src
              calledAddress:dst
                     result:result
                 diagnostic:result_source_diagnostic
                   userInfo:NULL];
}

- (void)MAP_Delimiter_Req:(NSDictionary *)xoptions
           callingAddress:(SccpAddress *)src
            calledAddress:(SccpAddress *)dst
                   result:(UMTCAP_asn1_Associate_result *)result
               diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic
                 userInfo:(UMTCAP_asn1_userInformation *)xuserInfo

{
    [self touch];
    if(self.openEstablished==NO)
    {
        if(tcapTransactionId == NULL)
        {
            UMTCAP_Transaction *t = [tcapLayer getNewOutgoingTransactionForUserDialogId:userDialogId user:self.gsmmapLayer];
            tcapTransactionId = t.localTransactionId;
        }
    }
    else
    {
        if(tcapTransactionId == NULL)
        {
            [gsmmapLayer.logFeed minorErrorText:@"MAP_Continue_Req: continuing a non existing transation"];
            return;
        }
    }

    NSMutableArray *components = [pendingOutgoingComponents mutableCopy];
    pendingOutgoingComponents = [[UMSynchronizedArray alloc] init];

    UMTCAP_itu_asn1_dialoguePortion *itu_dialoguePortion = NULL;
    if(self.openEstablished==NO)
    {
        if(self.dialogRequestRequired)
        {
            itu_dialoguePortion = [[UMTCAP_itu_asn1_dialoguePortion alloc]init];
            itu_dialoguePortion.dialogRequest = [[UMTCAP_asn1_AARQ_apdu alloc]init];
            itu_dialoguePortion.dialogRequest.protocolVersion = dialogProtocolVersion;
            itu_dialoguePortion.dialogRequest.objectIdentifier = applicationContext;
            itu_dialoguePortion.dialogRequest.user_information = xuserInfo;
        }

        [tcapLayer tcapBeginRequest:tcapTransactionId
                       userDialogId:userDialogId
                            variant:self.variant
                               user:self
                     callingAddress:localAddress
                      calledAddress:remoteAddress
                    dialoguePortion:itu_dialoguePortion
                         components:components
                            options:xoptions];
        self.openEstablished = YES;
        self.dialogRequestRequired = NO;
        self.dialogResponseRequired = NO;
    }
    else
    {
        if(self.dialogResponseRequired)
        {
            itu_dialoguePortion = [[UMTCAP_itu_asn1_dialoguePortion alloc]init];
            itu_dialoguePortion.dialogResponse = [[UMTCAP_asn1_AARE_apdu alloc]init];
            itu_dialoguePortion.dialogResponse.protocolVersion = dialogProtocolVersion;
            itu_dialoguePortion.dialogResponse.objectIdentifier = applicationContext;
            itu_dialoguePortion.dialogResponse.user_information = xuserInfo;
            itu_dialoguePortion.dialogResponse.result = result;
            itu_dialoguePortion.dialogResponse.result_source_diagnostic = result_source_diagnostic;
        }
        if(src)
        {
            localAddress = src;
        }
        if(dst)
        {
            remoteAddress = dst;
        }
        [tcapLayer tcapContinueRequest:tcapTransactionId
                          userDialogId:userDialogId
                               variant:self.variant
                                  user:self
                        callingAddress:localAddress
                         calledAddress:remoteAddress
                       dialoguePortion:itu_dialoguePortion
                            components:components
                               options:xoptions];
        self.dialogRequestRequired = NO;
        self.dialogResponseRequired = NO;
    }
}

-(void) MAP_Close_Req:(NSDictionary *)xoptions
{
    [self MAP_Close_Req:xoptions
         callingAddress:NULL
          calledAddress:NULL
                 result:NULL
             diagnostic:NULL];
    [mapUser queueMAP_Close_Ind:self.userIdentifier
                        options:xoptions];
}

-(void) MAP_Close_Req:(NSDictionary *)xoptions
               result:(UMTCAP_asn1_Associate_result *)result
           diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic
{
    [self MAP_Close_Req:xoptions
         callingAddress:NULL
          calledAddress:NULL
                 result:result
             diagnostic:result_source_diagnostic];
}

-(void) MAP_Close_Req:(NSDictionary *)xoptions
       callingAddress:(SccpAddress *)src
        calledAddress:(SccpAddress *)dst
               result:(UMTCAP_asn1_Associate_result *)result
           diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic
{
    [self MAP_Close_Req:xoptions
         callingAddress:src
          calledAddress:dst
                 result:result
             diagnostic:result_source_diagnostic
               userInfo:NULL];
}

-(void) MAP_Close_Req:(NSDictionary *)xoptions
       callingAddress:(SccpAddress *)src
        calledAddress:(SccpAddress *)dst
               result:(UMTCAP_asn1_Associate_result *)result
           diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic
             userInfo:(UMTCAP_asn1_userInformation *)userInfo
{
    [self touch];
    if((self.dialogIsClosed==NO) && (self.openEstablished==YES) && (tcapTransactionId!=NULL))
    {
        if(src==NULL)
        {
            src = localAddress;
        }
        if(dst==NULL)
        {
            dst = remoteAddress;
        }
        NSMutableArray *components  = [pendingOutgoingComponents mutableCopy];
        pendingOutgoingComponents   = [[UMSynchronizedArray alloc] init];

        UMTCAP_itu_asn1_dialoguePortion *itu_dialoguePortion = NULL;
        if(self.dialogResponseRequired)
        {
            itu_dialoguePortion = [[UMTCAP_itu_asn1_dialoguePortion alloc]init];
            itu_dialoguePortion.dialogResponse = [[UMTCAP_asn1_AARE_apdu alloc]init];
            itu_dialoguePortion.dialogResponse.protocolVersion = dialogProtocolVersion;
            itu_dialoguePortion.dialogResponse.objectIdentifier = applicationContext;
            itu_dialoguePortion.dialogResponse.user_information = userInfo;
            itu_dialoguePortion.dialogResponse.result = result;
            itu_dialoguePortion.dialogResponse.result_source_diagnostic = result_source_diagnostic;

        }
        [tcapLayer tcapEndRequest:tcapTransactionId
                     userDialogId:userDialogId
                          variant:self.variant
                             user:self
                   callingAddress:src
                    calledAddress:dst
                  dialoguePortion:itu_dialoguePortion
                       components:components
                          options:xoptions];
        self.dialogIsClosed = YES;
        self.dialogRequestRequired = NO;
        self.dialogResponseRequired = NO;
        self.openEstablished = NO;
        [self touch];
    }

}


-(void) MAP_Close_Ind:(NSDictionary *)xoptions
{
    [self touch];
    NSMutableDictionary *options = [xoptions mutableCopy];
    options[@"gsmmap-timestamp"] = [NSDate new];

    if((self.openEstablished==YES) && (tcapTransactionId != NULL))
    {
        [mapUser queueMAP_Close_Ind:userIdentifier options:options];
        self.dialogIsClosed = YES;
        self.dialogResponseRequired = NO;
        self.openEstablished = NO;
        pendingOutgoingComponents   = [[UMSynchronizedArray alloc] init];
        [self touch];
    }
}

-(void) MAP_Delimiter_Ind:(NSDictionary *)xoptions
                   dialog:(UMGSMMAP_DialogIdentifier *)dialogId
           callingAddress:(SccpAddress *)src
            calledAddress:(SccpAddress *)dst
          dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
            transactionId:(NSString *)localTransactionId
      remoteTransactionId:(NSString *)remoteTransactionId
{
    [self touch];
    NSMutableDictionary *options = [xoptions mutableCopy];
    options[@"gsmmap-timestamp"] = [NSDate new];

    /* update the GT's based on the response */
    self.remoteAddress = src;
    self.localAddress = dst;
    [mapUser queueMAP_Delimiter_Ind:userIdentifier
                        dialog:dialogId
                callingAddress:src
                 calledAddress:dst
               dialoguePortion:xdialoguePortion
                 transactionId:localTransactionId
           remoteTransactionId:remoteTransactionId
                       options:options];
}

-(void) MAP_Continue_Ind:(NSDictionary *)xoptions
          callingAddress:(SccpAddress *)src
           calledAddress:(SccpAddress *)dst
         dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
           transactionId:(NSString *)localTransactionId
     remoteTransactionId:(NSString *)remoteTransactionId
{
    [self touch];

    NSMutableDictionary *options = [xoptions mutableCopy];
    options[@"gsmmap-timestamp"] = [NSDate new];

    /* update calling/called from the incoming continue of the transaction */
    self.remoteAddress = src;
    self.localAddress = dst;
    [mapUser queueMAP_Continue_Ind:userIdentifier
               callingAddress:src
                calledAddress:dst
              dialoguePortion:xdialoguePortion
                transactionId:localTransactionId
          remoteTransactionId:remoteTransactionId
                      options:options];
}


-(void) MAP_U_Abort_Req:(NSDictionary *)xoptions
{
    [self MAP_U_Abort_Req:xoptions
           callingAddress:NULL
            calledAddress:NULL
                   result:NULL
               diagnostic:NULL
                 userInfo:NULL];
}

-(void) MAP_U_Abort_Req:(NSDictionary *)xoptions
         callingAddress:(SccpAddress *)src
          calledAddress:(SccpAddress *)dst
                 result:(UMTCAP_asn1_Associate_result *)result
             diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic
               userInfo:(UMTCAP_asn1_userInformation *)userInfo
{
    [self touch];
    if(self.dialogIsClosed==YES)
    {
        return;
    }
    if(self.openEstablished==NO)
    {
        [gsmmapLayer.logFeed minorErrorText:@"MAP_U_Abort_Req: aborting a never opened dialog"];
        return;
    }
    if(tcapTransactionId == NULL)
    {
        [gsmmapLayer.logFeed minorErrorText:@"MAP_U_Abort_Req: closing a non existing transation"];
        return;
    }
    if(src==NULL)
    {
        src = localAddress;
    }
    if(dst==NULL)
    {
        dst = remoteAddress;
    }
    NSMutableArray *components  = [pendingOutgoingComponents mutableCopy];
    pendingOutgoingComponents   = [[UMSynchronizedArray alloc] init];
    UMTCAP_itu_asn1_dialoguePortion *itu_dialoguePortion = NULL;
    [tcapLayer tcapUAbortRequest:tcapTransactionId
                      variant:self.variant
                         user:self
               callingAddress:src
                calledAddress:dst
              dialoguePortion:itu_dialoguePortion
                    callingLayer:gsmmapLayer
                   components:components
                      options:xoptions];
    self.dialogIsClosed = YES;
    self.dialogRequestRequired = NO;
    self.dialogResponseRequired = NO;
    self.openEstablished = NO;
}

-(void) MAP_P_Abort_Ind:(NSDictionary *)xoptions
         callingAddress:(SccpAddress *)src
          calledAddress:(SccpAddress *)dst
        dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
          transactionId:(NSString *)localTransactionId
    remoteTransactionId:(NSString *)remoteTransactionId
{
    [self touch];

    NSMutableDictionary *options = [xoptions mutableCopy];
    options[@"gsmmap-timestamp"] = [NSDate new];
    [mapUser queueMAP_P_Abort_Ind:self.userIdentifier
              callingAddress:src
               calledAddress:dst
             dialoguePortion:xdialoguePortion
               transactionId:localTransactionId
         remoteTransactionId:remoteTransactionId
                     options:options];
    self.dialogIsClosed = YES;
    self.dialogResponseRequired = NO;
    self.openEstablished = NO;
}

-(void) MAP_U_Abort_Ind:(NSDictionary *)xoptions
         callingAddress:(SccpAddress *)src
          calledAddress:(SccpAddress *)dst
        dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
          transactionId:(NSString *)localTransactionId
    remoteTransactionId:(NSString *)remoteTransactionId
{
    [self touch];

    NSMutableDictionary *options = [xoptions mutableCopy];
    options[@"gsmmap-timestamp"] = [NSDate new];
    [mapUser queueMAP_U_Abort_Ind:self.userIdentifier
              callingAddress:src
               calledAddress:dst
             dialoguePortion:xdialoguePortion
               transactionId:localTransactionId
         remoteTransactionId:remoteTransactionId
                     options:options];
    self.dialogIsClosed = YES;
    self.dialogResponseRequired = NO;
    self.openEstablished = NO;
}

-(void) MAP_Notice_Ind:(NSDictionary *)rxoptions
     tcapTransactionId:(NSString *)localTransactionId
                reason:(SCCP_ReturnCause)returnCause
{
    [self touch];
    NSMutableDictionary *options = [rxoptions mutableCopy];
    options[@"gsmmap-timestamp"] = [NSDate new];
    [mapUser queueMAP_Notice_Ind:userIdentifier
          tcapTransactionId:localTransactionId
                     reason:returnCause
                    options:options];
}


/* --------------------------------------------------------------------------- */
/*  COMPONENT HANDLING */
/* --------------------------------------------------------------------------- */
#pragma mark -
#pragma mark component handling: Outgoing Requests
#pragma mark -

- (void) MAP_Invoke_Req:(UMASN1Object *)param
               invokeId:(int64_t)xinvokeId
               linkedId:(int64_t)linkedId
                 opCode:(UMLayerGSMMAP_OpCode *)opcode
                   last:(BOOL)last
                options:(NSDictionary *)options
{
    [self touch];
    if(tcapTransactionId == NULL)
    {
        [gsmmapLayer.logFeed majorErrorText:@"MAP_Invoke: adding to a non existing transation"];
        return;
    }
    if(xinvokeId == AUTO_ASSIGN_INVOKE_ID)
    {
        xinvokeId = [self nextInvokeId];
    }
    else
    {
        [self setThisInvokeId:xinvokeId];
    }

    UMASN1Object *invoke = [tcapLayer tcapInvoke:param
                                         variant:TCAP_VARIANT_DEFAULT
                                        invokeId:xinvokeId
                                        linkedId:linkedId
                                     useLinkedId: ((linkedId == TCAP_UNDEFINED_LINKED_ID) ? NO : YES)
                                     opCodeValue:opcode.operation
                                    opCodeFamily:opcode.family
                                  opCodeNational:opcode.national
                                            last:last];
    [pendingOutgoingComponents addObject:invoke];
}

- (void) MAP_ReturnResult_Req:(UMASN1Object *)param
                     invokeId:(int64_t)xinvokeId  /* if not used: AUTO_ASSIGN_INVOKE_ID */
                     linkedId:(int64_t)linkedId  /* if not used: TCAP_UNDEFINED_LINKED_ID */
                       opCode:(UMLayerGSMMAP_OpCode *)opcode
                         last:(BOOL)last
                      options:(NSDictionary *)options;
{
    [self touch];
    if(tcapTransactionId == NULL)
    {

        UMTCAP_Transaction *t = [tcapLayer getNewOutgoingTransactionForUserDialogId:userDialogId user:self];
        tcapTransactionId = t.localTransactionId;
    }
    /* FIXME: is this correct here?? */
    if(xinvokeId == AUTO_ASSIGN_INVOKE_ID)
    {
        xinvokeId = [self nextInvokeId];
    }

    UMASN1Object *r;
    if(last)
    {
        r =  [tcapLayer tcapResultLastRequest:param
                                      variant:TCAP_VARIANT_DEFAULT
                                     invokeId:xinvokeId
                                     linkedId:linkedId
                                  useLinkedId: ((linkedId == TCAP_UNDEFINED_LINKED_ID) ? NO : YES)
                                  opCodeValue:opcode.operation
                                 opCodeFamily:opcode.family
                               opCodeNational:opcode.national];
    }
    else
    {
        r =  [tcapLayer tcapResultNotLastRequest:param
                                         variant:TCAP_VARIANT_DEFAULT
                                        invokeId:xinvokeId
                                        linkedId:linkedId
                                     useLinkedId: ((linkedId == TCAP_UNDEFINED_LINKED_ID) ? NO : YES)
                                     opCodeValue:opcode.operation
                                    opCodeFamily:opcode.family
                                  opCodeNational:opcode.national];
    }
    [pendingOutgoingComponents addObject:r];
}

- (void)MAP_Error_Req:(UMASN1Object *)param
       callingAddress:(SccpAddress *)src
        calledAddress:(SccpAddress *)dst
      dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
            operation:(int64_t)operation
              options:(NSDictionary *)options
{
    [self touch];
    [gsmmapLayer.logFeed majorErrorText:@"Missing implementation: MAP_Error_Req"];
}


- (void)MAP_Reject_Req:(UMASN1Object *)param
        callingAddress:(SccpAddress *)src
         calledAddress:(SccpAddress *)dst
       dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
              invokeId:(int64_t)invokeId
               problem:(UMGSMMAP_asn1 *)problem
               options:(NSDictionary *)options
{
    [self touch];
    [gsmmapLayer.logFeed majorErrorText:@"Missing implementation: MAP_Reject_Req"];
}

- (void)MAP_ReturnError_Req:(UMASN1Object *)param
                   invokeId:(int64_t)xinvokeId  /* if not used: AUTO_ASSIGN_INVOKE_ID */
                   linkedId:(int64_t)xlinkedId  /* if not used: TCAP_UNDEFINED_LINKED_ID */
                     opCode:(UMLayerGSMMAP_OpCode *)opcode
                  errorCode:(int64_t)errorCode
                    options:(NSDictionary *)options
{
    [self touch];
    if(tcapTransactionId == NULL)
    {

        UMTCAP_Transaction *t = [tcapLayer getNewOutgoingTransactionForUserDialogId:userDialogId user:self];
        tcapTransactionId = t.localTransactionId;
    }
    /* FIXME: is this correct here?? */
    if(xinvokeId == AUTO_ASSIGN_INVOKE_ID)
    {
        xinvokeId = [self nextInvokeId];
    }

    UMASN1Object *r;
    r =  [tcapLayer tcapUErrorRequest:param
                              variant:TCAP_VARIANT_DEFAULT
                             invokeId:xinvokeId
                            errorCode:errorCode
                       isPrivateError:NO];
    [pendingOutgoingComponents addObject:r];
}

- (void)MAP_ReturnError_Ind:(UMGSMMAP_asn1 *)params
                     opCode:(UMLayerGSMMAP_OpCode *)opcode
                   invokeId:(int64_t)invokeId
                   linkedId:(int64_t)linkedId
                  errorCode:(int64_t)errorCode
                    options:(NSDictionary *)options
{
    [gsmmapLayer.logFeed majorErrorText:@"Missing implementation: MAP_ReturnError_Ind"];
    [self touch];
}

- (void)MAP_Reject_Ind:(UMGSMMAP_asn1 *)params
                opCode:(UMLayerGSMMAP_OpCode *)opcode
              invokeId:(int64_t)invokeId
              linkedId:(int64_t)linkedId
             errorCode:(int64_t)errorCode
               options:(NSDictionary *)options
{
    [self touch];
    [gsmmapLayer.logFeed majorErrorText:@"Missing implementation: MAP_Reject_Ind"];
}

#pragma mark -
#pragma mark component handling: incoming indicatins & requests

- (void)MAP_Invoke_Ind:(UMASN1Object *)params
                opCode:(UMLayerGSMMAP_OpCode *)xopcode
              invokeId:(int64_t)xinvokeId
              linkedId:(int64_t)xlinkedId
                  last:(BOOL)xlast
               options:(NSDictionary *)xoptions
{
    [self touch];
    NSMutableDictionary *yoptions;
    if(xoptions)
    {
         yoptions = [xoptions mutableCopy];
    }
    else
    {
        yoptions = [[NSMutableDictionary alloc]init];
    }
    if(remoteAddress)
    {
        yoptions[@"sccp-remote"] = remoteAddress;
    }
    if(localAddress)
    {
        yoptions[@"sccp-local"] = localAddress;
    }
    if(tcapRemoteTransactionId)
    {
        yoptions[@"tcap-remote-transaction-id"] = tcapRemoteTransactionId;
    }

    [mapUser queueMAP_Invoke_Ind:params
                     userId:userIdentifier
                     dialog:userDialogId
                transaction:tcapTransactionId
                     opCode:xopcode
                   invokeId:xinvokeId
                   linkedId:xlinkedId
                       last:xlast
                    options:yoptions];
}


- (void)MAP_ReturnResult_Resp:(UMGSMMAP_asn1 *)params
                       opCode:(UMLayerGSMMAP_OpCode *)xopcode
                     invokeId:(int64_t)xinvokeId
                     linkedId:(int64_t)xlinkedId
                         last:(BOOL)xlast
                      options:(NSDictionary *)xoptions
{
    [self touch];
    [mapUser queueMAP_ReturnResult_Resp:params
                            userId:userIdentifier
                            dialog:userDialogId
                       transaction:tcapTransactionId
                            opCode:xopcode
                          invokeId:xinvokeId
                          linkedId:xlinkedId
                              last:xlast
                           options:xoptions];
}

- (void)MAP_ReturnError_Resp:(UMGSMMAP_asn1 *)params
                      opCode:(UMLayerGSMMAP_OpCode *)xopcode
                    invokeId:(int64_t)xinvokeId
                    linkedId:(int64_t)xlinkedId
                   errorCode:(int64_t)xerrorCode
                     options:(NSDictionary *)xoptions
{
    [self touch];
    [mapUser queueMAP_ReturnError_Resp:params
                           userId:userIdentifier
                           dialog:userDialogId
                      transaction:tcapTransactionId
                           opCode:xopcode
                         invokeId:xinvokeId
                         linkedId:xlinkedId
                        errorCode:xerrorCode
                          options:xoptions];
}

- (void)MAP_Reject_Resp:(UMGSMMAP_asn1 *)params
                 opCode:(UMLayerGSMMAP_OpCode *)xopcode
               invokeId:(int64_t)xinvokeId
               linkedId:(int64_t)xlinkedId
              errorCode:(int64_t)xerrorCode
                options:(NSDictionary *)xoptions
{
    [self touch];
    [mapUser queueMAP_Reject_Resp:params
                      userId:userIdentifier
                      dialog:userDialogId
                 transaction:tcapTransactionId
                      opCode:xopcode
                    invokeId:xinvokeId
                    linkedId:xlinkedId
                   errorCode:xerrorCode
                     options:xoptions];
}


- (void)MAP_ProcessComponents:(NSArray *)components
                      options:(NSDictionary *)xoptions
{
    [self touch];

    for(UMTCAP_generic_asn1_componentPDU *component in components)
    {
        UMLayerGSMMAP_OpCode *op = [[UMLayerGSMMAP_OpCode alloc]init];
        op.operation = component.operationCode;
        op.family = component.operationCodeFamily;
        op.national = component.operationNational;

        switch(component.asn1_tag.tagNumber)
        {
            case TCAP_ITU_COMPONENT_INVOKE:
                [self MAP_Invoke_Ind:component.params
                              opCode:op
                            invokeId:component.invokeId
                            linkedId:component.linkedId
                                last:component.isLast
                             options:xoptions];
                break;
            case TCAP_ITU_COMPONENT_RETURN_RESULT_LAST:
            {
                UMGSMMAP_asn1 *gasn1 = [[UMGSMMAP_asn1 alloc]initWithASN1Object:component.params context:self];
                [self MAP_ReturnResult_Resp:gasn1
                                     opCode:op
                                   invokeId:component.invokeId
                                   linkedId:component.linkedId
                                       last:YES
                                    options:xoptions];
                break;
            }
            case TCAP_ITU_COMPONENT_RETURN_RESULT_NOT_LAST:
            {
                UMGSMMAP_asn1 *gasn1 = [[UMGSMMAP_asn1 alloc]initWithASN1Object:component.params context:self];
                [self MAP_ReturnResult_Resp:gasn1
                                     opCode:op
                                   invokeId:component.invokeId
                                   linkedId:component.linkedId
                                       last:NO
                                    options:xoptions];
                break;
            }
            case TCAP_ITU_COMPONENT_RETURN_ERROR:
            {
                UMGSMMAP_asn1 *gasn1 = [[UMGSMMAP_asn1 alloc]initWithASN1Object:component.params context:self];
                [self MAP_ReturnError_Resp:gasn1
                                    opCode:op
                                  invokeId:component.invokeId
                                  linkedId:component.linkedId
                                 errorCode:component.errorCode
                                   options:xoptions];
                break;
            }
            case TCAP_ITU_COMPONENT_REJECT:
            {
                UMGSMMAP_asn1 *gasn1 = [[UMGSMMAP_asn1 alloc]initWithASN1Object:component.params context:self];
                [self MAP_Reject_Resp:gasn1
                               opCode:op
                             invokeId:component.invokeId
                             linkedId:component.linkedId
                            errorCode:component.errorCode
                              options:xoptions];
                break;
            }
        }
    }
}


- (void)tcapContinueIndication:(NSString *)userDialogId
             tcapTransactionId:(NSString *)localTransactionId
       tcapRemoteTransactionId:(NSString *)remoteTransactionId
                       variant:(UMTCAP_Variant)var
                callingAddress:(SccpAddress *)src
                 calledAddress:(SccpAddress *)dst
               dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
                  callingLayer:(UMLayer *)tcapLayer
                    components:(TCAP_NSARRAY_OF_COMPONENT_PDU *)components
                       options:(NSDictionary *)options
{

}

- (void)tcapEndIndication:(NSString *)userDialogId
        tcapTransactionId:(NSString *)localTransactionId
  tcapRemoteTransactionId:(NSString *)remoteTransactionId
                  variant:(UMTCAP_Variant)var
           callingAddress:(SccpAddress *)src
            calledAddress:(SccpAddress *)dst
          dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
             callingLayer:(UMLayer *)tcapLayer
               components:(TCAP_NSARRAY_OF_COMPONENT_PDU *)components
                  options:(NSDictionary *)options
{

}


- (void)tcapUnidirectionalIndication:(NSString *)userDialogId
                   tcapTransactionId:(NSString *)localTransactionId
             tcapRemoteTransactionId:(NSString *)remoteTransactionId
                             variant:(UMTCAP_Variant)variant
                      callingAddress:(SccpAddress *)src
                       calledAddress:(SccpAddress *)dst
                     dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
                        callingLayer:(UMLayer *)tcapLayer
                          components:(TCAP_NSARRAY_OF_COMPONENT_PDU *)components
                             options:(NSDictionary *)options
{

}


- (void)tcapNoticeIndication:(NSString *)userDialogId
           tcapTransactionId:(NSString *)localTransactionId
     tcapRemoteTransactionId:(NSString *)remoteTransactionId
                     variant:(UMTCAP_Variant)variant
              callingAddress:(SccpAddress *)src
               calledAddress:(SccpAddress *)dst
             dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
                callingLayer:(UMLayer *)tcapLayer
                  components:(TCAP_NSARRAY_OF_COMPONENT_PDU *)components
                      reason:(SCCP_ReturnCause)reason
                     options:(NSDictionary *)options
{

}





- (void)tcapPAbortIndication:(NSString *)userDialogId
           tcapTransactionId:(NSString *)localTransactionId
     tcapRemoteTransactionId:(NSString *)remoteTransactionId
                     variant:(UMTCAP_Variant)variant
              callingAddress:(SccpAddress *)src
               calledAddress:(SccpAddress *)dst
             dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
                callingLayer:(UMLayer *)tcapLayer
                        asn1:(UMASN1Object *)asn1
                     options:(NSDictionary *)xoptions
{
    [mapUser queueMAP_P_Abort_Ind:self.userIdentifier
              callingAddress:src
               calledAddress:dst
             dialoguePortion:NULL
               transactionId:self.tcapTransactionId
         remoteTransactionId:self.tcapRemoteTransactionId
                     options:xoptions];
    [self touch];
    self.dialogIsClosed = YES;
    self.dialogResponseRequired = NO;
    self.openEstablished = NO;
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
    [self touch];
    self.dialogIsClosed = YES;
    self.dialogResponseRequired = NO;
    self.openEstablished = NO;
}

- (void)timeOut
{
    @try
    {
        [mapUser queueMAP_P_Abort_Ind:self.userIdentifier
                  callingAddress:remoteAddress
                   calledAddress:localAddress
                 dialoguePortion:NULL
                   transactionId:self.tcapTransactionId
             remoteTransactionId:self.tcapRemoteTransactionId
                         options:@{}];
        self.dialogIsClosed = YES;
        self.dialogResponseRequired = NO;
        self.openEstablished = NO;
    }
    @catch(NSException *e)
    {
        [gsmmapLayer.logFeed majorErrorText:[NSString stringWithFormat:@"Exception %@",e]];
    }
}

- (void)dump:(NSFileHandle *)filehandler
{
    NSMutableString *s = [[NSMutableString alloc]init];
    [s appendFormat:@"    localTransactionId: %@\n",tcapTransactionId];
    [s appendFormat:@"    remoteTransactionId: %@\n",tcapRemoteTransactionId];
    [s appendFormat:@"    userDialogId: %@\n",userDialogId];
    [s appendFormat:@"    userIdentifier: %@\n",userIdentifier];
    NSDictionary *d = [applicationContext objectValue];
    [s appendFormat:@"    applicationContext: %@\n",d[@"objectIdentifier"]];
    d = [applicationContext2 objectValue];
    [s appendFormat:@"    applicationContext2: %@\n",d[@"objectIdentifier"]];
    [s appendFormat:@"    localAddress: %@\n",[localAddress description]];
    [s appendFormat:@"    remoteAddress: %@\n",[remoteAddress description]];
    [s appendFormat:@"    timeout: %8.2lfs\n",timeoutValue];
    [s appendFormat:@"    startDate: %@\n",[_startDate description]];
    [s appendFormat:@"    lastActivity: %@\n",[_lastActivity description]];
    [filehandler writeData: [s dataUsingEncoding:NSUTF8StringEncoding]];
}
@end

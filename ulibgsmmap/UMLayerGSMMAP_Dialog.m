//
//  UMGSMMAP_Dialog.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
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
@synthesize options;
@synthesize localAddress;
@synthesize remoteAddress;
@synthesize userInfo;
@synthesize dialogProtocolVersion;
@synthesize variant;
@synthesize tcapRemoteTransactionId;

@synthesize initiatedOutgoing;
@synthesize openEstablished;
@synthesize returnResultLastSent;
@synthesize dialogResponseRequired;
@synthesize dialogIsClosed;

#pragma mark -
#pragma mark Initialisation


- (UMLayerGSMMAP_Dialog *)init
{
    self = [super init];
    if(self)
    {
        lastInvokeId = -1;
        pendingOutgoingComponents = [[UMSynchronizedArray alloc]init];
        timeoutValue = 90;
        createdDate = [NSDate dateWithTimeIntervalSinceNow:0];
        timeoutDate = [NSDate dateWithTimeIntervalSinceNow:timeoutValue];
    }
    return self;
}


- (int64_t)nextInvokeId
{
    int64_t inv = ++lastInvokeId % 0xFF;
    lastInvokeId = inv;
    return inv;
}

- (NSString *)getNewUserDialogId
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
    @synchronized(self)
    {
        if(timeoutValue==0)
        {
            timeoutValue=90;
        }
        timeoutDate = [NSDate dateWithTimeIntervalSinceNow:timeoutValue];
    }
}

- (BOOL)isTimedOut
{
    @synchronized(self)
    {
        if(timeoutDate == NULL)
        {
            return NO;
        }
        NSDate *now = [NSDate date];
        if([now compare:timeoutDate] == NSOrderedDescending)
        {
            return YES;
        }
        return NO;
    }
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
              userIdentifier:(NSString *)xuserIdentifier
                     options:(NSDictionary *)xoptions
{
    @synchronized (self)
    {

        self.mapUser = user;
        self.tcapLayer = xtcap;
        self.gsmmapLayer = xgsmmap;
        self.variant = xvariant;
        self.localAddress = src;
        self.remoteAddress = dst;
        self.applicationContext = appContext;
        self.userInfo = xuserInfo;

        if((appContext) || (xuserInfo))
        {
            dialogRequestRequired=YES;
            uint8_t ver[]  = { 0x07,0x80 };
            UMASN1BitString *v = [[UMASN1BitString alloc]init];
            v.asn1_data = [NSData dataWithBytes:ver  length:sizeof(ver)];
            self.dialogProtocolVersion = v;
        }
        self.options = xoptions;
        self.userIdentifier  = xuserIdentifier;

        UMTCAP_Transaction *t = [tcapLayer getNewOutgoingTransactionForUserDialogId:userDialogId user:self.gsmmapLayer];
        self.tcapTransactionId = t.localTransactionId;

        initiatedOutgoing = YES;
        openEstablished = NO;
        pendingOutgoingComponents = [[UMSynchronizedArray alloc]init];
        pendingIncomingComponents = [[UMSynchronizedArray alloc]init];
        [self touch];
    }
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
    @synchronized (self)
    {
        NSLog(@"MAP_Open_Ind_forUser\n");
        NSLog(@"\tlocalTransactionId: %@\n",localTransactionId);
        NSLog(@"\tremoteTransactionId: %@\n",remoteTransactionId);
        NSLog(@"\tuserDialogId: %@\n",self.userDialogId);
        NSLog(@"\tuserIdentifier: %@\n",self.userIdentifier);

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
            self.userInfo = itu.dialogRequest.user_information;
            self.dialogProtocolVersion = itu.dialogRequest.protocolVersion;
        }
        self.tcapRemoteTransactionId = remoteTransactionId;
        self.tcapTransactionId = localTransactionId;
        if(self.applicationContext)
        {
            dialogResponseRequired = YES;
        }

        initiatedOutgoing = NO;
        openEstablished = YES;
        pendingOutgoingComponents = [[UMSynchronizedArray alloc]init];
        pendingIncomingComponents = [[UMSynchronizedArray alloc]init];

        if(self.userIdentifier==NULL)
        {
            NSString *uid = [user getNewUserIdentifier];
            self.userIdentifier = uid;
            NSLog(@"newUserIdentifier: %@",uid);
        }
        else
        {
            NSLog(@"existingUserIdentifier: %@",self.userIdentifier);

        }
        [user MAP_Open_Ind:self.userIdentifier
                    dialog:self.userDialogId
               transaction:localTransactionId
         remoteTransaction:remoteTransactionId
                       map:xgsmmap
                   variant:xvariant
            callingAddress:src
             calledAddress:dst
           dialoguePortion:xdialoguePortion
                   options:xoptions];
        [self touch];
    }
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
    @synchronized (self)
    {
        NSLog(@"MAP_Open_Resp_forUser\n");
        NSLog(@"\tlocalTransactionId: %@\n",localTransactionId);
        NSLog(@"\tremoteTransactionId: %@\n",remoteTransactionId);
        NSLog(@"\tuserDialogId: %@\n",self.userDialogId);
        NSLog(@"\tuserIdentifier: %@\n",self.userIdentifier);

        self.mapUser = user;
        self.tcapLayer = xtcap;
        self.gsmmapLayer = xgsmmap;
        self.variant = xvariant;
        self.localAddress = src;
        self.remoteAddress = dst;
        // self.applicationContext = appContext;
        // self.userInfo = xuserInfo;
        self.options = xoptions;
        self.tcapTransactionId = localTransactionId;
        self.tcapRemoteTransactionId = remoteTransactionId;

        openEstablished = YES;
        pendingOutgoingComponents = [[UMSynchronizedArray alloc]init];
        pendingIncomingComponents = [[UMSynchronizedArray alloc]init];

        NSString *uid = [user getNewUserIdentifier];

        self.userIdentifier = uid;

        [user MAP_Open_Resp:uid
                     dialog:self.userDialogId
                transaction:self.tcapTransactionId
          remoteTransaction:self.tcapRemoteTransactionId
                        map:xgsmmap
                    variant:xvariant
             callingAddress:src
              calledAddress:dst
            dialoguePortion:xdialoguePortion
                    options:xoptions];
        [self touch];
    }
}


- (void)MAP_Delimiter_Req:(NSDictionary *)xoptions
{
    return [self MAP_Delimiter_Req:options result:NULL diagnostic:NULL];
}

- (void)MAP_Delimiter_Req:(NSDictionary *)xoptions
                   result:(UMTCAP_asn1_Associate_result *)result
               diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic
{
    @synchronized (self)
    {
        if(openEstablished==NO)
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
                NSLog(@"MAP_Continue_Req: continuing a non existing transation");
                return;
            }
        }

        NSMutableArray *components = [pendingOutgoingComponents mutableCopy];
        pendingOutgoingComponents = [[UMSynchronizedArray alloc] init];

        UMTCAP_itu_asn1_dialoguePortion *itu_dialoguePortion = NULL;
        if(openEstablished==NO)
        {
            if(dialogRequestRequired)
            {
                itu_dialoguePortion = [[UMTCAP_itu_asn1_dialoguePortion alloc]init];
                itu_dialoguePortion.dialogRequest = [[UMTCAP_asn1_AARQ_apdu alloc]init];
                itu_dialoguePortion.dialogRequest.protocolVersion = dialogProtocolVersion;
                itu_dialoguePortion.dialogRequest.objectIdentifier = applicationContext;
                itu_dialoguePortion.dialogRequest.user_information = userInfo;
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
            openEstablished = YES;
            dialogRequestRequired = NO;
            dialogResponseRequired = NO;
        }
        else
        {
            if(dialogResponseRequired)
            {
                itu_dialoguePortion = [[UMTCAP_itu_asn1_dialoguePortion alloc]init];
                itu_dialoguePortion.dialogResponse = [[UMTCAP_asn1_AARE_apdu alloc]init];
                itu_dialoguePortion.dialogResponse.protocolVersion = dialogProtocolVersion;
                itu_dialoguePortion.dialogResponse.objectIdentifier = applicationContext;
                itu_dialoguePortion.dialogResponse.user_information = userInfo;
                itu_dialoguePortion.dialogResponse.result = result;
                itu_dialoguePortion.dialogResponse.result_source_diagnostic = result_source_diagnostic;
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
            dialogRequestRequired = NO;
            dialogResponseRequired = NO;
        }
        [self touch];
    }
}

-(void) MAP_Close_Req:(NSDictionary *)xoptions
{
    [self MAP_Close_Req:xoptions
                 result:NULL
             diagnostic: NULL];
}

-(void) MAP_Close_Req:(NSDictionary *)xoptions
               result:(UMTCAP_asn1_Associate_result *)result
           diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic
{
    @synchronized(self)
    {
        if(dialogIsClosed==YES)
        {
            NSLog(@"MAP_Close_Req: closing a already closed dialog");
            return;
        }
        if(openEstablished==NO)
        {
            NSLog(@"MAP_Close_Req: closing a never opened dialog");
            return;
        }
        if(tcapTransactionId == NULL)
        {
            NSLog(@"MAP_Close_Req: closing a non existing transation");
            return;
        }
        SccpAddress *src = localAddress;
        SccpAddress *dst = remoteAddress;
        NSMutableArray *components  = [pendingOutgoingComponents mutableCopy];
        pendingOutgoingComponents   = [[UMSynchronizedArray alloc] init];

        UMTCAP_itu_asn1_dialoguePortion *itu_dialoguePortion = NULL;
        if(dialogResponseRequired)
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
        dialogIsClosed = YES;
        dialogRequestRequired = NO;
        dialogResponseRequired = NO;
        openEstablished = NO;
        [self touch];
    }
}


-(void) MAP_Close_Ind:(NSDictionary *)xoptions
{
    @synchronized(self)
    {
        if(openEstablished==NO)
        {
            NSLog(@"MAP_Close_Ind: closing a never opened dialog");
            return;
        }
        if(tcapTransactionId == NULL)
        {
            NSLog(@"MAP_Close_Ind: closing a non existing transation");
            return;
        }
        [mapUser MAP_Close_Ind:userIdentifier options:xoptions];
        dialogIsClosed = YES;
        dialogResponseRequired = NO;
        openEstablished = NO;
        pendingOutgoingComponents   = [[UMSynchronizedArray alloc] init];
        [self touch];
    }
}

-(void) MAP_Delimiter_Ind:(NSDictionary *)xoptions
           callingAddress:(SccpAddress *)src
            calledAddress:(SccpAddress *)dst
          dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
            transactionId:(NSString *)localTransactionId
      remoteTransactionId:(NSString *)remoteTransactionId
{
    @synchronized(self)
    {
        /* update the GT's based on the response */
        remoteAddress = src;
        localAddress = dst;
        [mapUser MAP_Delimiter_Ind:userIdentifier
                    callingAddress:src
                     calledAddress:dst
                   dialoguePortion:xdialoguePortion
                     transactionId:localTransactionId
               remoteTransactionId:remoteTransactionId
                           options:xoptions];
        [self touch];
    }
}

-(void) MAP_Continue_Ind:(NSDictionary *)xoptions
          callingAddress:(SccpAddress *)src
           calledAddress:(SccpAddress *)dst
         dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
           transactionId:(NSString *)localTransactionId
     remoteTransactionId:(NSString *)remoteTransactionId
{
    @synchronized(self)
    {
        /* update calling/called from the incoming continue of the transaction */
        remoteAddress = src;
        localAddress = dst;
        [mapUser MAP_Continue_Ind:userIdentifier
                   callingAddress:src
                    calledAddress:dst
                  dialoguePortion:xdialoguePortion
                    transactionId:localTransactionId
              remoteTransactionId:remoteTransactionId
                          options:xoptions];
        [self touch];
    }
}


-(void) MAP_U_Abort_Req:(NSDictionary *)xoptions
{
    @synchronized (self)
    {
        NSLog(@"MAP_U_Abort_Req not yet implemented");
        [self touch];
        dialogIsClosed = YES;
        dialogResponseRequired = NO;
        openEstablished = NO;
    }
}

-(void) MAP_P_Abort_Ind:(NSDictionary *)xoptions
         callingAddress:(SccpAddress *)src
          calledAddress:(SccpAddress *)dst
        dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
          transactionId:(NSString *)localTransactionId
    remoteTransactionId:(NSString *)remoteTransactionId
{
    @synchronized(self)
    {
        [mapUser MAP_P_Abort_Ind:self.userIdentifier
                  callingAddress:src
                   calledAddress:dst
                 dialoguePortion:xdialoguePortion
                   transactionId:localTransactionId
             remoteTransactionId:remoteTransactionId
                         options:xoptions];
        [self touch];
        dialogIsClosed = YES;
        dialogResponseRequired = NO;
        openEstablished = NO;
    }
}

-(void) MAP_U_Abort_Ind:(NSDictionary *)xoptions
         callingAddress:(SccpAddress *)src
          calledAddress:(SccpAddress *)dst
        dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
          transactionId:(NSString *)localTransactionId
    remoteTransactionId:(NSString *)remoteTransactionId
{
    @synchronized(self)
    {
        @try
        {
            [mapUser MAP_U_Abort_Ind:self.userIdentifier
                      callingAddress:src
                       calledAddress:dst
                     dialoguePortion:xdialoguePortion
                       transactionId:localTransactionId
                 remoteTransactionId:remoteTransactionId
                             options:xoptions];
        }
        @catch(NSException *e)
        {
            NSLog(@"Exception: %@",e);
        }
        [self touch];
        dialogIsClosed = YES;
        dialogResponseRequired = NO;
        openEstablished = NO;
    }
}

-(void) MAP_Notice_Ind:(NSDictionary *)rxoptions
     tcapTransactionId:(NSString *)localTransactionId
                reason:(SCCP_ReturnCause)returnCause
{
    @synchronized(self)
    {
        [mapUser MAP_Notice_Ind:userIdentifier
              tcapTransactionId:localTransactionId
                         reason:returnCause
                        options:rxoptions];
        [self touch];
    }
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
    @synchronized (self)
    {
        if(tcapTransactionId == NULL)
        {
            NSLog(@"MAP_Invoke: adding to a non existing transation");
            return;
        }
        if(xinvokeId == AUTO_ASSIGN_INVOKE_ID)
        {
            xinvokeId = [self nextInvokeId];
        }
        lastInvokeId = xinvokeId;

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
        [self touch];
    }
}

- (void) MAP_ReturnResult_Req:(UMASN1Object *)param
                     invokeId:(int64_t)xinvokeId  /* if not used: AUTO_ASSIGN_INVOKE_ID */
                     linkedId:(int64_t)linkedId  /* if not used: TCAP_UNDEFINED_LINKED_ID */
                       opCode:(UMLayerGSMMAP_OpCode *)opcode
                         last:(BOOL)last
                      options:(NSDictionary *)options;
{
    @synchronized (self)
    {
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
        lastInvokeId = xinvokeId;

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
        [self touch];
    }
}

- (void)MAP_Error_Req:(UMASN1Object *)param
       callingAddress:(SccpAddress *)src
        calledAddress:(SccpAddress *)dst
      dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
            operation:(int64_t)operation
              options:(NSDictionary *)options
{
    @synchronized(self)
    {
        NSLog(@"Missing implementation: MAP_Error_Req");
        [self touch];
    }
}


- (void)MAP_Reject_Req:(UMASN1Object *)param
        callingAddress:(SccpAddress *)src
         calledAddress:(SccpAddress *)dst
       dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
              invokeId:(int64_t)invokeId
               problem:(UMGSMMAP_asn1 *)problem
               options:(NSDictionary *)options
{
    @synchronized(self)
    {
        NSLog(@"Missing implementation: MAP_Reject_Req");
        [self touch];
    }
}

- (void)MAP_ReturnError_Req:(UMASN1Object *)param
                   invokeId:(int64_t)invokeId  /* if not used: AUTO_ASSIGN_INVOKE_ID */
                   linkedId:(int64_t)linkedId  /* if not used: TCAP_UNDEFINED_LINKED_ID */
                     opCode:(UMLayerGSMMAP_OpCode *)opcode
                  errorCode:(int64_t)errorCode
                    options:(NSDictionary *)options
{
    NSLog(@"Missing implementation: MAP_ReturnError_Req");
    [self touch];
}

- (void)MAP_ReturnError_Ind:(UMGSMMAP_asn1 *)params
                     opCode:(UMLayerGSMMAP_OpCode *)opcode
                   invokeId:(int64_t)invokeId
                   linkedId:(int64_t)linkedId
                  errorCode:(int64_t)errorCode
                    options:(NSDictionary *)options
{
    NSLog(@"Missing implementation: MAP_ReturnError_Ind");
    [self touch];
}

- (void)MAP_Reject_Ind:(UMGSMMAP_asn1 *)params
                opCode:(UMLayerGSMMAP_OpCode *)opcode
              invokeId:(int64_t)invokeId
              linkedId:(int64_t)linkedId
             errorCode:(int64_t)errorCode
               options:(NSDictionary *)options
{
    NSLog(@"Missing implementation: MAP_Reject_Ind");
    [self touch];
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
    @synchronized (self)
    {
        [mapUser MAP_Invoke_Ind:params
                         userId:userIdentifier
                         dialog:userDialogId
                    transaction:tcapTransactionId
                         opCode:xopcode
                       invokeId:xinvokeId
                       linkedId:xlinkedId
                           last:xlast
                        options:xoptions];
        [self touch];
    }
}


- (void)MAP_ReturnResult_Resp:(UMGSMMAP_asn1 *)params
                       opCode:(UMLayerGSMMAP_OpCode *)xopcode
                     invokeId:(int64_t)xinvokeId
                     linkedId:(int64_t)xlinkedId
                         last:(BOOL)xlast
                      options:(NSDictionary *)xoptions
{
    @synchronized(self)
    {
        [mapUser MAP_ReturnResult_Resp:params
                                userId:userIdentifier
                                dialog:userDialogId
                           transaction:tcapTransactionId
                                opCode:xopcode
                              invokeId:xinvokeId
                              linkedId:xlinkedId
                                  last:xlast
                               options:xoptions];
        [self touch];
    }
}

- (void)MAP_ReturnError_Resp:(UMGSMMAP_asn1 *)params
                      opCode:(UMLayerGSMMAP_OpCode *)xopcode
                    invokeId:(int64_t)xinvokeId
                    linkedId:(int64_t)xlinkedId
                   errorCode:(int64_t)xerrorCode
                     options:(NSDictionary *)xoptions
{
    @synchronized(self)
    {
        [mapUser MAP_ReturnError_Resp:params
                               userId:userIdentifier
                               dialog:userDialogId
                          transaction:tcapTransactionId
                               opCode:xopcode
                             invokeId:xinvokeId
                             linkedId:xlinkedId
                            errorCode:xerrorCode
                              options:xoptions];
    }
}

- (void)MAP_Reject_Resp:(UMGSMMAP_asn1 *)params
                 opCode:(UMLayerGSMMAP_OpCode *)xopcode
               invokeId:(int64_t)xinvokeId
               linkedId:(int64_t)xlinkedId
              errorCode:(int64_t)xerrorCode
                options:(NSDictionary *)xoptions
{
    @synchronized(self)
    {
        [mapUser MAP_Reject_Resp:params
                          userId:userIdentifier
                          dialog:userDialogId
                     transaction:tcapTransactionId
                          opCode:xopcode
                        invokeId:xinvokeId
                        linkedId:xlinkedId
                       errorCode:xerrorCode
                         options:xoptions];
    }
}


- (void)MAP_ProcessComponents:(NSArray *)components
                      options:(NSDictionary *)xoptions
{
    @synchronized(self)
    {
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
                                 options:options];
                    break;
                case TCAP_ITU_COMPONENT_RETURN_RESULT_LAST:
                {
                    UMGSMMAP_asn1 *gasn1 = [[UMGSMMAP_asn1 alloc]initWithASN1Object:component.params context:self];
                    [self MAP_ReturnResult_Resp:gasn1
                                         opCode:op
                                       invokeId:component.invokeId
                                       linkedId:component.linkedId
                                           last:YES
                                        options:options];
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
                                        options:options];
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
                                       options:options];
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
                                  options:options];
                    break;
                }
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
                     options:(NSDictionary *)options
{
    [mapUser MAP_P_Abort_Ind:self.userIdentifier
              callingAddress:src
               calledAddress:dst
             dialoguePortion:NULL
               transactionId:self.tcapTransactionId
         remoteTransactionId:self.tcapRemoteTransactionId
                     options:options];
    @synchronized(self)
    {
        dialogIsClosed = YES;
        dialogResponseRequired = NO;
        openEstablished = NO;
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
    @synchronized(self)
    {
        dialogIsClosed = YES;
        dialogResponseRequired = NO;
        openEstablished = NO;
    }
}

- (void)timeOut
{
    @synchronized(self)
    {
        [mapUser MAP_P_Abort_Ind:self.userIdentifier
                  callingAddress:remoteAddress
                   calledAddress:localAddress
                 dialoguePortion:NULL
                   transactionId:self.tcapTransactionId
             remoteTransactionId:self.tcapRemoteTransactionId
                         options:options];
        dialogIsClosed = YES;
        dialogResponseRequired = NO;
        openEstablished = NO;
    }
}

@end

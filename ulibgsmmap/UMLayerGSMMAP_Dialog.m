//
//  UMLayerGSMMAP_Dialog.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMLayerGSMMAP_Dialog.h>
#import <ulibgsmmap/UMLayerGSMMAP.h>

@implementation UMLayerGSMMAP_Dialog

#pragma mark -
#pragma mark Properties
/*
@synthesize _userDialogId;
@synthesize _tcapTransactionId;
@synthesize _userIdentifier;
@synthesize _tcapLayer;
@synthesize _gsmmapLayer;
@synthesize _applicationContext;
@synthesize _applicationContext2;
@synthesize _localAddress;
@synthesize _remoteAddress;
@synthesize _dialogProtocolVersion;
@synthesize variant;
@synthesize _tcapRemoteTransactionId;
*/
#pragma mark -
#pragma mark Initialisation

-(NSString *)layerName
{
		return @"UMLayerGSMMAP_Dialog";
}

- (NSTimeInterval)timeoutInSeconds
{
    return _timeoutInSeconds;
}

- (void)setTimeoutInSeconds:(NSTimeInterval)to
{
    if(to <= 5.0)
    {
        NSLog(@"GSMMAP Dialog Timeout is below 5s. Setting it to 5s");
        to = 5.0;
    }
    else if(to >=120.0)
    {
        NSLog(@"GSMMAP Dialog Timeout is above 120s. Setting it to 120s");
        to = 120.0;
    }
    _timeoutInSeconds = to;
}

- (UMLayerGSMMAP_Dialog *)init
{
    self = [super init];
    if(self)
    {
        _nextInvokeId = 0;
        _pendingOutgoingComponents = [[UMSynchronizedArray alloc]init];
        _timeoutInSeconds = 120; /* if everything goes wrong and we dont get any PAbort or End or timeout, we kill it after 2 minutes, just in case */
        _startDate = [NSDate new];
        _lastActivity = [[UMAtomicDate alloc]init];
        _logLevel = UMLOG_MAJOR;
        _dialogLock = [[UMMutex alloc]initWithName:@"dialog-lock"];
    }
    return self;
}


- (int64_t)nextInvokeId
{
    ummutex_lock(_dialogLock);
    int64_t inv = _nextInvokeId;
    _nextInvokeId++;
    _nextInvokeId = _nextInvokeId % 0xFF;
    ummutex_unlock(_dialogLock);
    return inv;
}

- (int64_t)nextNegativeInvokeId
{
    ummutex_lock(_dialogLock);
    int64_t inv = _nextInvokeId;
    _nextInvokeId--;
    _nextInvokeId = _nextInvokeId % 0xFFFF;
    ummutex_unlock(_dialogLock);
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

- (void)tcapBeginIndication:(UMTCAP_UserDialogIdentifier *)userDialogId
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
    ummutex_lock(_dialogLock);
    ummutex_unlock(_dialogLock);

}

#pragma mark -
#pragma mark Various helper


- (UMASN1Object *)decodeASN1:(UMASN1Object *)params
               operationCode:(int64_t)opcode
               operationType:(UMTCAP_InternalOperation)operation
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
    NSTimeInterval duration =  [_lastActivity age];
    if(duration > self.timeoutInSeconds)
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
    ummutex_lock(_dialogLock);

    self.logLevel = xgsmmap.logLevel;
    self.logFeed = xgsmmap.logFeed;
    if(self.logLevel <= UMLOG_DEBUG)
    {
        NSMutableString *s = [[NSMutableString alloc]initWithFormat:@"Dialog[%@]: MAP_Open_Req_forUser\n",_userDialogId.description];

        [s appendFormat:@"\tcallingAddress: %@\n",src.stringValueE164];
        [s appendFormat:@"\tcalledAddress: %@\n",dst.stringValueE164];
        [s appendFormat:@"\tapplicationContext: %@\n",appContext.stringValue];
        [s appendFormat:@"\tuserIdentifier: %@\n",xuserIdentifier];
        [xgsmmap.logFeed debugText:s];
    }

    NSArray<NSString *>* as = xoptions[@"map-options"];
    if(as.count > 0)
    {
        for (NSString *s in as)
        {
            if([s isEqualToString:@"nid"])
            {
                _useNegativeId=YES;
                _nextInvokeId = -1;
            }
            if([s isEqualToString:@"bid"])
            {
                _useBigId=YES;
                if(_useNegativeId)
                {
                    _nextInvokeId = -256;
                }
                else
                {
                    _nextInvokeId = 256;
                }
            }
            if([s isEqualToString:@"vbid"])
            {
                if(_useNegativeId)
                {
                    _nextInvokeId = -256*256*256;
                }
                else
                {
                    _nextInvokeId = 256*256*256;
                }
            }
        }
    }
    [self touch];

    self.mapUser = user;
    self.tcapLayer = xtcap;
    self.gsmmapLayer = xgsmmap;
    self.variant = xvariant;
    self.localAddress = src;
    self.remoteAddress = dst;
    self.applicationContext = appContext;
    self.requestUserInfo = xuserInfo;
    self.userIdentifier = xuserIdentifier;
    self.outboundOptions = xoptions;

    if((appContext) || (xuserInfo))
    {
        self.dialogRequestRequired=YES;
        uint8_t ver[]  = { 0x07,0x80 };
        UMASN1BitString *v = [[UMASN1BitString alloc]init];
        v.asn1_data = [NSData dataWithBytes:ver  length:sizeof(ver)];
        self.dialogProtocolVersion = v;
    }

    UMTCAP_Transaction *t = [_tcapLayer getNewOutgoingTransactionForUserDialogId:_userDialogId user:self.gsmmapLayer];
    self.tcapTransactionId = t.localTransactionId;
    self.tcapOperationGlobal = NULL;
    if(xoptions[@"tcap-operation-global"])
    {
        if([xoptions[@"tcap-operation-global"] intValue]>0)
        {
            self.tcapOperationGlobal = xoptions[@"tcap-operation-global"];
        }
    }
    self.initiatedOutgoing = YES;
    self.openEstablished = NO;
    [t setOptions:xoptions];
    _pendingOutgoingComponents = [[UMSynchronizedArray alloc]init];
    _pendingIncomingComponents = [[UMSynchronizedArray alloc]init];
    ummutex_unlock(_dialogLock);
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
    ummutex_lock(_dialogLock);

    self.logLevel = xgsmmap.logLevel;
    self.logFeed = xgsmmap.logFeed;
    if(self.logLevel <= UMLOG_DEBUG)
    {
        NSMutableString *s = [[NSMutableString alloc]initWithFormat:@"Dialog[%@]: MAP_Open_Ind_forUser\n",self.userDialogId];
        [s appendFormat:@"\tcallingAddress: %@\n",src.stringValueE164];
        [s appendFormat:@"\tcalledAddress: %@\n",dst.stringValueE164];
        [s appendFormat:@"\ttransactionId: %@\n",localTransactionId];
        [s appendFormat:@"\tremoteTransactionId: %@\n",remoteTransactionId];
        [s appendFormat:@"\tuserIdentifier: %@\n",self.userIdentifier];
        [xgsmmap.logFeed debugText:s];
    }
    [self touch];

    NSMutableDictionary *yoptions = [xoptions mutableCopy];
    yoptions[@"gsmmap-timestamp"] = [NSDate new];
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
        if(self.applicationContext)
        {
            /* FIXME: verify here if we accept the dialog by application context here and potentially reject */
            _pendingResult = [[UMTCAP_asn1_Associate_result alloc]initWithValue:0];
            _pendingDiagnostic = [[UMTCAP_asn1_Associate_source_diagnostic alloc]init];
            _pendingDiagnostic.dialogue_service_user =[[UMASN1Integer alloc]initWithValue:0];
        }
    }
    self.tcapRemoteTransactionId = remoteTransactionId;
    self.tcapTransactionId = localTransactionId;
    if(self.applicationContext)
    {
        self.dialogResponseRequired = YES;
    }

    self.initiatedOutgoing = NO;
    self.openEstablished = YES;
    _pendingOutgoingComponents = [[UMSynchronizedArray alloc]init];
    _pendingIncomingComponents = [[UMSynchronizedArray alloc]init];

    if(self.userIdentifier==NULL)
    {
        UMGSMMAP_UserIdentifier *uid = [user getNewUserIdentifier];
        self.userIdentifier = uid;
        if(self.logLevel <= UMLOG_DEBUG)
        {
            NSString *s = [NSString stringWithFormat:@"newUserIdentifier: %@",uid];
            [self.logFeed debugText:s];
        }
    }
    else
    {
        if(self.logLevel <= UMLOG_DEBUG)
        {
            NSString *s = [NSString stringWithFormat:@"existingUserIdentifier: %@",self.userIdentifier];
            [self.logFeed debugText:s];
        }
    }
    if(self.logLevel <= UMLOG_DEBUG)
    {
        NSMutableString *s = [[NSMutableString alloc]initWithFormat:@"executeMAP_Open_Ind"];
        [self.logFeed debugText:s];
    }
    [user executeMAP_Open_Ind:self.userIdentifier
                     dialog:self.userDialogId
                transaction:localTransactionId
          remoteTransaction:remoteTransactionId
                        map:xgsmmap
                    variant:xvariant
             callingAddress:src
              calledAddress:dst
            dialoguePortion:xdialoguePortion
                    options:xoptions];
    ummutex_unlock(_dialogLock);
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
    ummutex_lock(_dialogLock);

    [self touch];
    self.logLevel = xgsmmap.logLevel;

    if(self.logLevel <= UMLOG_DEBUG)
    {
        NSMutableString *s = [[NSMutableString alloc]initWithFormat:@"Dialog[%@]: MAP_Open_Resp_forUser\n",self.userDialogId];
        [s appendFormat:@"\tlocalTransactionId: %@\n",localTransactionId];
        [s appendFormat:@"\tremoteTransactionId: %@\n",remoteTransactionId];
        [s appendFormat:@"\tuserIdentifier: %@\n",_userIdentifier];
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
    _pendingOutgoingComponents = [[UMSynchronizedArray alloc]init];
    _pendingIncomingComponents = [[UMSynchronizedArray alloc]init];

    UMGSMMAP_UserIdentifier *uid = [user getNewUserIdentifier];
    self.userIdentifier = uid;

    NSMutableDictionary *options = [xoptions mutableCopy];
    options[@"gsmmap-timestamp"] = [NSDate new];

    if(self.logLevel <= UMLOG_DEBUG)
    {
        NSMutableString *s = [[NSMutableString alloc]initWithFormat:@"queueMAP_Open_Resp"];
        [self.logFeed debugText:s];
    }

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
    ummutex_unlock(_dialogLock);
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
                   userInfo:_requestUserInfo];
}


- (void)MAP_Delimiter_Req_Prepare:(NSDictionary *)xoptions
                   callingAddress:(SccpAddress *)src
                    calledAddress:(SccpAddress *)dst
                           result:(UMTCAP_asn1_Associate_result *)result
                       diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic
                         userInfo:(UMTCAP_asn1_userInformation *)xuserInfo

{
    ummutex_lock(_dialogLock);
    if(src)
    {
        _localAddress = src;
    }
    if(dst)
    {
        _remoteAddress = dst;
    }
    _shouldSendContinue = YES;
    _pendingResult = result;
    _pendingDiagnostic = result_source_diagnostic;
    _pendingUserInfo = xuserInfo;
    ummutex_unlock(_dialogLock);
}

- (void)MAP_Delimiter_Req:(NSDictionary *)xoptions
           callingAddress:(SccpAddress *)src
            calledAddress:(SccpAddress *)dst
                   result:(UMTCAP_asn1_Associate_result *)result
               diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic
                 userInfo:(UMTCAP_asn1_userInformation *)xuserInfo
{
    BOOL useApplicationContext = YES;
    if(xoptions[@"clear-application-context"])
    {
        useApplicationContext = NO;
    }
    
    if(xoptions[@"replace-application-context"])
    {
        _responseApplicationContext = xoptions[@"replace-application-context"];
        _applicationContext = _responseApplicationContext;
        useApplicationContext = YES;
    }

    ummutex_lock(_dialogLock);

    if(xuserInfo == NULL)
    {
        xuserInfo=_pendingUserInfo;
        _pendingUserInfo = NULL;
    }
    if(result_source_diagnostic == NULL)
    {
        result_source_diagnostic = _pendingDiagnostic;
        _pendingDiagnostic = NULL;
    }
    if(result==NULL)
    {
        result = _pendingResult;
        _pendingResult = NULL;
    }
    if(src)
    {
        _localAddress = src;
    }
    if(dst)
    {
        _remoteAddress = dst;
    }

    if(self.logLevel <= UMLOG_DEBUG)
    {
        NSMutableString *s = [NSMutableString stringWithFormat:@"Dialog[%@]: MAP_Delimiter_Req:\n",self.userDialogId];
        [s appendFormat:@"    callingAddress: %@\n",_localAddress.stringValueE164];
        [s appendFormat:@"    calledAddress: %@\n",_remoteAddress.stringValueE164];
        [s appendFormat:@"    result: %@\n",[result.objectValue jsonString]];
        [s appendFormat:@"    diagnostic: %@\n",[result_source_diagnostic.objectValue jsonString]];
        [s appendFormat:@"    userInfo: %@\n",[xuserInfo.objectValue jsonString]];
        [self.logFeed debugText:s];
    }
    [self touch];
    if(self.openEstablished==NO)
    {
        if(_tcapTransactionId == NULL)
        {
            UMTCAP_Transaction *t = [_tcapLayer getNewOutgoingTransactionForUserDialogId:_userDialogId user:self.gsmmapLayer];
            [t setOptions:_outboundOptions];
            _tcapTransactionId = t.localTransactionId;
        }
    }
    else
    {
        if(_tcapTransactionId == NULL)
        {
            [_gsmmapLayer.logFeed minorErrorText:@"MAP_Continue_Req: continuing a non existing transation"];
            ummutex_unlock(_dialogLock);
            return;
        }
    }

    NSMutableArray *components = [_pendingOutgoingComponents mutableCopy];
    _pendingOutgoingComponents = [[UMSynchronizedArray alloc] init];

    UMTCAP_itu_asn1_dialoguePortion *itu_dialoguePortion = NULL;
    if(self.openEstablished==NO)
    {
        if((self.dialogRequestRequired) && (useApplicationContext==YES))
        {
            itu_dialoguePortion = [[UMTCAP_itu_asn1_dialoguePortion alloc]init];
            itu_dialoguePortion.dialogRequest = [[UMTCAP_asn1_AARQ_apdu alloc]init];
            itu_dialoguePortion.dialogRequest.protocolVersion = _dialogProtocolVersion;
            itu_dialoguePortion.dialogRequest.objectIdentifier = _applicationContext;
            itu_dialoguePortion.dialogRequest.user_information = xuserInfo;
        }
        if(_startWithContinue)
        {
            if(self.logLevel <= UMLOG_DEBUG)
            {
                NSMutableString *s = [[NSMutableString alloc]initWithFormat:@"calling tcapContinueRequest (start-with-continue option set)"];
                [self.logFeed debugText:s];
            }
            NSMutableDictionary *xoptions2 = [xoptions mutableCopy];
            xoptions2[@"new-transation"] = @(YES);


            [_tcapLayer tcapContinueRequest:_tcapTransactionId
                              userDialogId:_userDialogId
                                   variant:self.variant
                                      user:self
                            callingAddress:_localAddress
                             calledAddress:_remoteAddress
                           dialoguePortion:itu_dialoguePortion
                            components_ansi:NULL
                             components_itu:components
                                   options:xoptions2];
        }
        else
        {
            if(self.logLevel <= UMLOG_DEBUG)
            {
                NSMutableString *s = [[NSMutableString alloc]initWithFormat:@"calling tcapBeginRequest"];
                [self.logFeed debugText:s];
            }
            [_tcapLayer tcapBeginRequest:_tcapTransactionId
                           userDialogId:_userDialogId
                                variant:self.variant
                                   user:self
                         callingAddress:_localAddress
                          calledAddress:_remoteAddress
                        dialoguePortion:itu_dialoguePortion
                             components:components
                                options:xoptions];
        }
        self.openEstablished = YES;
        self.dialogRequestRequired = NO;
        self.dialogResponseRequired = NO;
    }
    else
    {
        if((self.dialogResponseRequired) && (useApplicationContext==YES))
        {
            itu_dialoguePortion = [[UMTCAP_itu_asn1_dialoguePortion alloc]init];
            itu_dialoguePortion.dialogResponse = [[UMTCAP_asn1_AARE_apdu alloc]init];
            itu_dialoguePortion.dialogResponse.protocolVersion = _dialogProtocolVersion;
            itu_dialoguePortion.dialogResponse.objectIdentifier = _applicationContext;
            itu_dialoguePortion.dialogResponse.user_information = xuserInfo;
            itu_dialoguePortion.dialogResponse.result = result;
            itu_dialoguePortion.dialogResponse.result_source_diagnostic = result_source_diagnostic;
        }
        if(self.logLevel <= UMLOG_DEBUG)
        {
            NSMutableString *s = [[NSMutableString alloc]initWithFormat:@"calling tcapContinueRequest"];
            [self.logFeed debugText:s];
        }
        [_tcapLayer tcapContinueRequest:_tcapTransactionId
                          userDialogId:_userDialogId
                               variant:self.variant
                                  user:self
                        callingAddress:_localAddress
                         calledAddress:_remoteAddress
                       dialoguePortion:itu_dialoguePortion
                       components_ansi:NULL
                        components_itu:components
                               options:xoptions];
        self.dialogRequestRequired = NO;
        self.dialogResponseRequired = NO;
    }
    _shouldSendContinue = NO;
    ummutex_unlock(_dialogLock);
}


-(void) MAP_Close_Req:(NSDictionary *)xoptions
               result:(UMTCAP_asn1_Associate_result *)result
           diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic
{
    ummutex_lock(_dialogLock);
    [self MAP_Close_Req:xoptions
         callingAddress:NULL
          calledAddress:NULL
                 result:result
             diagnostic:result_source_diagnostic];
    ummutex_unlock(_dialogLock);
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
{
    [self MAP_Close_Req:xoptions
         callingAddress:NULL
          calledAddress:NULL
                 result:NULL
             diagnostic:NULL];
}



-(void) MAP_Close_Req:(NSDictionary *)xoptions
       callingAddress:(SccpAddress *)src
        calledAddress:(SccpAddress *)dst
               result:(UMTCAP_asn1_Associate_result *)result
           diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic
             userInfo:(UMTCAP_asn1_userInformation *)userInfo
{
    self.dialogIsClosing = YES;
    if(src)
    {
        _localAddress = src;
    }
    if(dst)
    {
        _remoteAddress = dst;
    }
    if(self.logLevel <= UMLOG_DEBUG)
    {
        NSMutableString *s = [[NSMutableString alloc]initWithFormat:@"Dialog[%@]: MAP_Close_Req\n",self.userDialogId];
        [s appendFormat: @"\tcallingAddress: %@",_localAddress.stringValueE164];
        [s appendFormat: @"\tcalledAddress: %@",_remoteAddress.stringValueE164];
        [self.logFeed debugText:s];
    }

    /* FIXME: do we have to self confirm? */
    //[mapUser queueMAP_Close_Ind:self.userIdentifier options:xoptions];

    [self touch];
    if((self.dialogIsClosed==NO) && (self.openEstablished==YES) && (_tcapTransactionId!=NULL))
    {
        if(src==NULL)
        {
            src = _localAddress;
        }
        if(dst==NULL)
        {
            dst = _remoteAddress;
        }
        NSMutableArray *components  = [_pendingOutgoingComponents mutableCopy];
        _pendingOutgoingComponents   = [[UMSynchronizedArray alloc] init];

        UMTCAP_itu_asn1_dialoguePortion *itu_dialoguePortion = NULL;
        if(self.dialogResponseRequired)
        {
            itu_dialoguePortion = [[UMTCAP_itu_asn1_dialoguePortion alloc]init];
            itu_dialoguePortion.dialogResponse = [[UMTCAP_asn1_AARE_apdu alloc]init];
            itu_dialoguePortion.dialogResponse.protocolVersion = _dialogProtocolVersion;
            itu_dialoguePortion.dialogResponse.objectIdentifier = _applicationContext;
            itu_dialoguePortion.dialogResponse.user_information = userInfo;
            itu_dialoguePortion.dialogResponse.result = result;
            itu_dialoguePortion.dialogResponse.result_source_diagnostic = result_source_diagnostic;

        }
        if(self.logLevel <= UMLOG_DEBUG)
        {
            NSMutableString *s = [[NSMutableString alloc]initWithFormat:@" calling tcapEndRequest"];
            [self.logFeed debugText:s];
        }
        if(_tcapTransactionId)
        {
            /* if we no longer have a transaction ID, we're done already */
            [_tcapLayer tcapEndRequest:_tcapTransactionId
                         userDialogId:_userDialogId
                              variant:self.variant
                                 user:self
                       callingAddress:src
                        calledAddress:dst
                      dialoguePortion:itu_dialoguePortion
                           components:components
                              options:xoptions];
        }
    }
    self.dialogIsClosed = YES;
    self.dialogRequestRequired = NO;
    self.dialogResponseRequired = NO;
    self.openEstablished = NO;
    [self touch];
}


-(void) MAP_Close_Ind:(NSDictionary *)xoptions
{
    if(self.logLevel <= UMLOG_DEBUG)
    {
        NSMutableString *s = [[NSMutableString alloc]initWithFormat:@"Dialog[%@]: MAP_Close_Ind\n",self.userDialogId];
        [self.logFeed debugText:s];
    }

    [self touch];
    NSMutableDictionary *options = [xoptions mutableCopy];
    options[@"gsmmap-timestamp"] = [NSDate new];

    if(_mapUser == NULL)
    {
        NSLog(@"mapUser is NULL");
    }

    if(((self.openEstablished==YES) || (self.initiatedOutgoing))&& (_tcapTransactionId != NULL))
    {
#if 0
        [mapUser queueMAP_Close_Ind:userIdentifier options:options];
#else
        [_mapUser executeMAP_Close_Ind:_userIdentifier options:options];
#endif
        self.dialogIsClosed = YES;
        self.dialogResponseRequired = NO;
        self.openEstablished = NO;
        _pendingOutgoingComponents   = [[UMSynchronizedArray alloc] init];
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
    if(self.logLevel <= UMLOG_DEBUG)
    {
        NSMutableString *s = [[NSMutableString alloc]initWithFormat:@"Dialog[%@]: MAP_Delimiter_Ind\n",self.userDialogId];
        [s appendFormat:@"    callingAddress: %@\n",src.stringValueE164];
        [s appendFormat:@"    calledAddress: %@\n",dst.stringValueE164];
        [s appendFormat:@"    transactionId: %@\n",localTransactionId];
        [s appendFormat:@"    remoteTransactionId: %@\n",remoteTransactionId];
        [self.logFeed debugText:s];
    }

    [self touch];
    NSMutableDictionary *options = [xoptions mutableCopy];
    options[@"gsmmap-timestamp"] = [NSDate new];


    [_mapUser executeMAP_Delimiter_Ind:_userIdentifier
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

    if(self.logLevel <= UMLOG_DEBUG)
    {
        NSMutableString *s = [[NSMutableString alloc]initWithFormat:@"Dialog[%@]: MAP_Continue_Ind\n",self.userDialogId];
        [s appendFormat:@"    callingAddress: %@\n",src.stringValueE164];
        [s appendFormat:@"    calledAddress: %@\n",dst.stringValueE164];
        [s appendFormat:@"    transactionId: %@\n",localTransactionId];
        [s appendFormat:@"    remoteTransactionId: %@\n",remoteTransactionId];
        [self.logFeed debugText:s];
    }

    [self touch];

    NSMutableDictionary *options = [xoptions mutableCopy];
    options[@"gsmmap-timestamp"] = [NSDate new];

    /* update calling/called from the incoming continue of the transaction */
    self.remoteAddress = src;
    self.localAddress = dst;
    NSMutableDictionary *yoptions = [options mutableCopy];
    yoptions[@"sccp-calling-address"] = src;
    yoptions[@"sccp-called-address"] = dst;;
    xoptions = yoptions;

    [_mapUser executeMAP_Continue_Ind:_userIdentifier
                      callingAddress:src
                       calledAddress:dst
                     dialoguePortion:xdialoguePortion
                       transactionId:localTransactionId
                 remoteTransactionId:remoteTransactionId
                             options:xoptions];
}



-(void) MAP_U_Abort_Req:(NSDictionary *)xoptions
         callingAddress:(SccpAddress *)src
          calledAddress:(SccpAddress *)dst
                  cause:(int64_t)cause
                 result:(UMTCAP_asn1_Associate_result *)result
             diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic
               userInfo:(UMTCAP_asn1_userInformation *)userInfo
{
    if(self.logLevel <= UMLOG_DEBUG)
    {
        NSMutableString *s = [[NSMutableString alloc]initWithFormat:@"Dialog[%@]: MAP_U_Abort_Req\n",self.userDialogId];
        [s appendFormat:@"    callingAddress: %@\n",src.stringValueE164];
        [s appendFormat:@"    calledAddress: %@\n",dst.stringValueE164];
        [self.logFeed debugText:s];
    }

    [self touch];
    if(self.dialogIsClosed==YES)
    {
        return;
    }
    if(self.openEstablished==NO)
    {
        [_gsmmapLayer.logFeed minorErrorText:@"MAP_U_Abort_Req: aborting a never opened dialog"];
        return;
    }
    if(_tcapTransactionId == NULL)
    {
        [_gsmmapLayer.logFeed minorErrorText:@"MAP_U_Abort_Req: closing a non existing transation"];
        return;
    }
    if(src==NULL)
    {
        src = _localAddress;
    }
    if(dst==NULL)
    {
        dst = _remoteAddress;
    }
    NSMutableArray *components  = [_pendingOutgoingComponents mutableCopy];
    _pendingOutgoingComponents   = [[UMSynchronizedArray alloc] init];
    UMTCAP_itu_asn1_dialoguePortion *itu_dialoguePortion = NULL;
    if(self.logLevel <= UMLOG_DEBUG)
    {
        [self.logFeed debugText:@" calling tcapUAbortReq"];
    }

    [_tcapLayer tcapUAbortRequest:_tcapTransactionId
                    userDialogId:_userDialogId
                         variant:self.variant
                            user:self
                  callingAddress:src
                   calledAddress:dst
                           cause:cause
                 dialoguePortion:itu_dialoguePortion
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

    if(self.logLevel <= UMLOG_DEBUG)
    {
        NSMutableString *s = [[NSMutableString alloc]initWithFormat:@"Dialog[%@]: MAP_P_Abort_Ind\n",self.userDialogId];
        [s appendFormat:@"    callingAddress: %@\n",src.stringValueE164];
        [s appendFormat:@"    calledAddress: %@\n",dst.stringValueE164];
        [s appendFormat:@"    transactionId: %@\n",localTransactionId];
        [s appendFormat:@"    remoteTransactionId: %@\n",remoteTransactionId];
        [self.logFeed debugText:s];
    }

    NSMutableDictionary *options = [xoptions mutableCopy];
    options[@"gsmmap-timestamp"] = [NSDate new];
    if(self.logLevel <= UMLOG_DEBUG)
    {
        [self.logFeed debugText:@" calling queueMAP_P_Abort_Ind"];
    }

    [_mapUser executeMAP_P_Abort_Ind:self.userIdentifier
                     callingAddress:src
                      calledAddress:dst
                    dialoguePortion:xdialoguePortion
                      transactionId:localTransactionId
                remoteTransactionId:remoteTransactionId
                            options:options];
    self.dialogIsClosed = YES;
    self.dialogResponseRequired = NO;
    self.openEstablished = NO;
    [self touch];
}

-(void) MAP_U_Abort_Ind:(NSDictionary *)xoptions
         callingAddress:(SccpAddress *)src
          calledAddress:(SccpAddress *)dst
        dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
          transactionId:(NSString *)localTransactionId
    remoteTransactionId:(NSString *)remoteTransactionId
{
    if(self.logLevel <= UMLOG_DEBUG)
    {
        NSMutableString *s = [[NSMutableString alloc]initWithFormat:@"Dialog[%@]: MAP_U_Abort_Ind\n",self.userDialogId];
        [s appendFormat:@"    callingAddress: %@\n",src.stringValueE164];
        [s appendFormat:@"    calledAddress: %@\n",dst.stringValueE164];
        [s appendFormat:@"    transactionId: %@\n",localTransactionId];
        [s appendFormat:@"    remoteTransactionId: %@\n",remoteTransactionId];
        [self.logFeed debugText:s];
    }
    [self touch];

    NSMutableDictionary *options = [xoptions mutableCopy];
    options[@"gsmmap-timestamp"] = [NSDate new];
    if(self.logLevel <= UMLOG_DEBUG)
    {
        [self.logFeed debugText:@" calling queueMAP_U_Abort_Ind"];
    }

    self.remoteAddress = src;
    self.localAddress = dst;
    NSMutableDictionary *yoptions = [options mutableCopy];
    yoptions[@"sccp-calling-address"] = src;
    yoptions[@"sccp-called-address"] = dst;
    xoptions = yoptions;
    [_mapUser queueMAP_U_Abort_Ind:self.userIdentifier
              callingAddress:src
               calledAddress:dst
             dialoguePortion:xdialoguePortion
               transactionId:localTransactionId
         remoteTransactionId:remoteTransactionId
                     options:options];
    self.dialogIsClosed = YES;
    self.dialogRequestRequired = NO;
    self.dialogResponseRequired = NO;
    self.openEstablished = NO;
}

-(void) MAP_Notice_Ind:(NSDictionary *)rxoptions
     tcapTransactionId:(NSString *)localTransactionId
                reason:(SCCP_ReturnCause)returnCause
{
    if(self.logLevel <= UMLOG_DEBUG)
    {
        NSMutableString *s = [[NSMutableString alloc]initWithFormat:@"Dialog[%@]: MAP_Notice_Ind\n",self.userDialogId];
        [s appendFormat:@"    transactionId: %@\n",localTransactionId];
        [self.logFeed debugText:s];
    }
    [self touch];
    NSMutableDictionary *options = [rxoptions mutableCopy];
    options[@"gsmmap-timestamp"] = [NSDate new];
    [_mapUser executeMAP_Notice_Ind:_userIdentifier
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
- (void)MAP_AddEmptyComponent
{
    ummutex_lock(_dialogLock);
    UMASN1Sequence *component = [[UMASN1Sequence alloc]init];
    [_pendingOutgoingComponents addObject:component];
    ummutex_unlock(_dialogLock);
}

- (void) MAP_Invoke_Req:(UMASN1Object *)param
               invokeId:(int64_t)xinvokeId
               linkedId:(int64_t)linkedId
                 opCode:(UMLayerGSMMAP_OpCode *)opcode
                   last:(BOOL)last
                options:(NSDictionary *)options
{
    ummutex_lock(_dialogLock);
    [self touch];
    if(_tcapTransactionId == NULL)
    {
        [_gsmmapLayer.logFeed majorErrorText:@"MAP_Invoke: adding to a non existing transation"];
        return;
    }
    if(xinvokeId == AUTO_ASSIGN_INVOKE_ID)
    {
        if(_useNegativeId)
        {
            xinvokeId = [self nextNegativeInvokeId];
            if(xinvokeId==0)
            {
                xinvokeId = [self nextNegativeInvokeId];
            }
        }
        else
        {
            xinvokeId = [self nextInvokeId];
        }
    }
    else
    {
        [self setThisInvokeId:xinvokeId];
    }

    UMASN1Object *invoke = [_tcapLayer tcapInvoke:param
                                         variant:TCAP_VARIANT_DEFAULT
                                        invokeId:xinvokeId
                                        linkedId:linkedId
                                     useLinkedId: ((linkedId == TCAP_UNDEFINED_LINKED_ID) ? NO : YES)
                                     opCodeValue:opcode.operation
                          opCodeFamilyOrEncoding:opcode.familyOrEncoding
                                    opCodeGlobal:opcode.globalOperation
                                  opCodeNational:opcode.national
                                            last:last];
    [_pendingOutgoingComponents addObject:invoke];
    ummutex_unlock(_dialogLock);
}

- (void) MAP_ReturnResult_Req:(UMASN1Object *)param
                     invokeId:(int64_t)xinvokeId  /* if not used: AUTO_ASSIGN_INVOKE_ID */
                     linkedId:(int64_t)linkedId  /* if not used: TCAP_UNDEFINED_LINKED_ID */
                       opCode:(UMLayerGSMMAP_OpCode *)opcode
                         last:(BOOL)last
                      options:(NSDictionary *)options;
{
    ummutex_lock(_dialogLock);
    if(self.logLevel <= UMLOG_DEBUG)
    {
        [self.logFeed debugText:[NSString stringWithFormat:@"MAP_ReturnResult_Req:\n"
                                 @"param:%@\n"
                                 @"invokeId:%lld\n"
                                 @"linkedId:%lld\n"
                                 @"opcode:%@\n",
                                 [param.objectValue jsonString],
                                 (long long)xinvokeId,
                                 (long long)linkedId,
                                 opcode]];
    }

    [self touch];
    if(_tcapTransactionId == NULL)
    {

        UMTCAP_Transaction *t = [_tcapLayer getNewOutgoingTransactionForUserDialogId:_userDialogId user:self];
        [t setOptions:_outboundOptions];
        _tcapTransactionId = t.localTransactionId;
    }
    /* FIXME: is this correct here?? */
    if(xinvokeId == AUTO_ASSIGN_INVOKE_ID)
    {
        xinvokeId = [self nextInvokeId];
    }

    UMASN1Object *r;
    if(last)
    {
        r =  [_tcapLayer tcapResultLastRequest:param
                                      variant:TCAP_VARIANT_DEFAULT
                                     invokeId:xinvokeId
                                     linkedId:linkedId
                                  useLinkedId: ((linkedId == TCAP_UNDEFINED_LINKED_ID) ? NO : YES)
                                  opCodeValue:opcode.operation
                       opCodeFamilyOrEncoding:opcode.familyOrEncoding
                                 opCodeGlobal:opcode.globalOperation
                               opCodeNational:opcode.national];
    }
    else
    {
        r =  [_tcapLayer tcapResultNotLastRequest:param
                                         variant:TCAP_VARIANT_DEFAULT
                                        invokeId:xinvokeId
                                        linkedId:linkedId
                                     useLinkedId: ((linkedId == TCAP_UNDEFINED_LINKED_ID) ? NO : YES)
                                     opCodeValue:opcode.operation
                          opCodeFamilyOrEncoding:opcode.familyOrEncoding
                                    opCodeGlobal:opcode.globalOperation
                                  opCodeNational:opcode.national];
    }
    [_pendingOutgoingComponents addObject:r];
    ummutex_unlock(_dialogLock);
}

- (void)MAP_Error_Req:(UMASN1Object *)param
       callingAddress:(SccpAddress *)src
        calledAddress:(SccpAddress *)dst
      dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
            operation:(int64_t)operation
              options:(NSDictionary *)options
{
    ummutex_lock(_dialogLock);
    [self touch];
    [_gsmmapLayer.logFeed majorErrorText:@"Missing implementation: MAP_Error_Req"];
    ummutex_unlock(_dialogLock);
}


- (void)MAP_Reject_Req:(UMASN1Object *)param
        callingAddress:(SccpAddress *)src
         calledAddress:(SccpAddress *)dst
       dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
              invokeId:(int64_t)invokeId
               problem:(UMGSMMAP_asn1 *)problem
               options:(NSDictionary *)options
{
    ummutex_lock(_dialogLock);
    [self touch];
    [_gsmmapLayer.logFeed majorErrorText:@"Missing implementation: MAP_Reject_Req"];
    ummutex_unlock(_dialogLock);
}

- (void)MAP_ReturnError_Req:(UMASN1Object *)param
                   invokeId:(int64_t)xinvokeId  /* if not used: AUTO_ASSIGN_INVOKE_ID */
                   linkedId:(int64_t)xlinkedId  /* if not used: TCAP_UNDEFINED_LINKED_ID */
                     opCode:(UMLayerGSMMAP_OpCode *)opcode
                  errorCode:(int64_t)errorCode
                    options:(NSDictionary *)options
{
    ummutex_lock(_dialogLock);
    [self touch];
    if(_tcapTransactionId == NULL)
    {

        UMTCAP_Transaction *t = [_tcapLayer getNewOutgoingTransactionForUserDialogId:_userDialogId user:self];
        [t setOptions:_outboundOptions];
        _tcapTransactionId = t.localTransactionId;
    }
    /* FIXME: is this correct here?? */
    if(xinvokeId == AUTO_ASSIGN_INVOKE_ID)
    {
        xinvokeId = [self nextInvokeId];
    }

    UMASN1Object *r;
    r =  [_tcapLayer tcapUErrorRequest:param
                              variant:TCAP_VARIANT_DEFAULT
                             invokeId:xinvokeId
                            errorCode:errorCode
                       isPrivateError:NO];
    [_pendingOutgoingComponents addObject:r];
    ummutex_unlock(_dialogLock);
}

- (void)MAP_ReturnError_Ind:(UMGSMMAP_asn1 *)params
                     opCode:(UMLayerGSMMAP_OpCode *)opcode
                   invokeId:(int64_t)invokeId
                   linkedId:(int64_t)linkedId
                  errorCode:(int64_t)errorCode
                    options:(NSDictionary *)options
{
    ummutex_lock(_dialogLock);
    [_gsmmapLayer.logFeed majorErrorText:@"Missing implementation: MAP_ReturnError_Ind"];
    [self touch];
    ummutex_unlock(_dialogLock);
}

- (void)MAP_Reject_Ind:(UMGSMMAP_asn1 *)params
                opCode:(UMLayerGSMMAP_OpCode *)opcode
              invokeId:(int64_t)invokeId
              linkedId:(int64_t)linkedId
             errorCode:(int64_t)errorCode
               options:(NSDictionary *)options
{
    ummutex_lock(_dialogLock);
    [self touch];
    [_gsmmapLayer.logFeed majorErrorText:@"Missing implementation: MAP_Reject_Ind"];
    ummutex_unlock(_dialogLock);
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
    ummutex_lock(_dialogLock);
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
    if(_remoteAddress)
    {
        yoptions[@"sccp-remote"] = _remoteAddress;
    }
    if(_localAddress)
    {
        yoptions[@"sccp-local"] = _localAddress;
    }
    if(_tcapRemoteTransactionId)
    {
        yoptions[@"tcap-remote-transaction-id"] = _tcapRemoteTransactionId;
    }

    [_mapUser executeMAP_Invoke_Ind:params
                            userId:_userIdentifier
                            dialog:_userDialogId
                       transaction:_tcapTransactionId
                            opCode:xopcode
                          invokeId:xinvokeId
                          linkedId:xlinkedId
                              last:xlast
                           options:yoptions];
    ummutex_unlock(_dialogLock);
}


- (void)MAP_ReturnResult_Resp:(UMGSMMAP_asn1 *)params
                       opCode:(UMLayerGSMMAP_OpCode *)xopcode
                     invokeId:(int64_t)xinvokeId
                     linkedId:(int64_t)xlinkedId
                         last:(BOOL)xlast
                      options:(NSDictionary *)xoptions
{
    ummutex_lock(_dialogLock);
    [self touch];
    [_mapUser executeMAP_ReturnResult_Resp:params
                                   userId:_userIdentifier
                                   dialog:_userDialogId
                              transaction:_tcapTransactionId
                                   opCode:xopcode
                                 invokeId:xinvokeId
                                 linkedId:xlinkedId
                                     last:xlast
                                  options:xoptions];
    ummutex_unlock(_dialogLock);
}

- (void)MAP_ReturnError_Resp:(UMGSMMAP_asn1 *)params
                      opCode:(UMLayerGSMMAP_OpCode *)xopcode
                    invokeId:(int64_t)xinvokeId
                    linkedId:(int64_t)xlinkedId
                   errorCode:(int64_t)xerrorCode
                     options:(NSDictionary *)xoptions
{
    ummutex_lock(_dialogLock);
    [self touch];
    [_mapUser executeMAP_ReturnError_Resp:params
                                  userId:_userIdentifier
                                  dialog:_userDialogId
                             transaction:_tcapTransactionId
                                  opCode:xopcode
                                invokeId:xinvokeId
                                linkedId:xlinkedId
                               errorCode:xerrorCode
                                 options:xoptions];
    ummutex_unlock(_dialogLock);
}

- (void)MAP_Reject_Resp:(UMGSMMAP_asn1 *)params
                 opCode:(UMLayerGSMMAP_OpCode *)xopcode
               invokeId:(int64_t)xinvokeId
               linkedId:(int64_t)xlinkedId
              errorCode:(int64_t)xerrorCode
                options:(NSDictionary *)xoptions
{
    ummutex_lock(_dialogLock);
    [self touch];
    [_mapUser executeMAP_Reject_Resp:params
                      userId:_userIdentifier
                      dialog:_userDialogId
                 transaction:_tcapTransactionId
                      opCode:xopcode
                    invokeId:xinvokeId
                    linkedId:xlinkedId
                   errorCode:xerrorCode
                     options:xoptions];
    ummutex_unlock(_dialogLock);
}


- (void)MAP_ProcessComponents:(NSArray *)components
                      options:(NSDictionary *)xoptions
                      willEnd:(BOOL)willEnd
{
    ummutex_lock(_dialogLock);
    if(self.logLevel <= UMLOG_DEBUG)
    {
        [self.logFeed debugText:@"MAP_ProcessComponents"];
    }

    [self touch];
    if(willEnd)
    {
        _shouldSendContinue = NO;
        /* we have to set this before processing components as the callbacks by the components might call close req and if this is not set, we would send a tcap end out to a transaction already closed */
        self.dialogIsClosed = YES;
        if(self.logLevel <= UMLOG_DEBUG)
        {
            [self.logFeed debugText:@"MAP_ProcessComponents willEnd"];
        }
    }
    else
    {
        if(components.count == 0)
        {
            _shouldSendContinue = YES;
        }
    }
    for(UMTCAP_generic_asn1_componentPDU *component in components)
    {
        UMLayerGSMMAP_OpCode *op = [[UMLayerGSMMAP_OpCode alloc]init];
        op.operation = component.operationCode;
        op.familyOrEncoding = component.operationCodeFamilyOrEncoding;
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
            default:
            {
                NSLog(@"what is component number %ld?",(long)component.asn1_tag.tagNumber);
                break;
            }
        }
    }
    if((self.shouldSendContinue) && (willEnd==NO) && (self.dialogIsClosed==NO) && (self.dialogIsClosing==NO))
    {
       [self MAP_Delimiter_Req:xoptions
                        result:_pendingResult
                    diagnostic:_pendingDiagnostic];
        _pendingResult = NULL;
        _pendingDiagnostic = NULL;
        _shouldSendContinue = NO;
    }
    ummutex_unlock(_dialogLock);
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
    [_mapUser executeMAP_P_Abort_Ind:self.userIdentifier
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
    [_mapUser executeMAP_U_Abort_Ind:self.userIdentifier
                     callingAddress:src
                      calledAddress:dst
                    dialoguePortion:xdialoguePortion
                      transactionId:self.tcapTransactionId
                remoteTransactionId:self.tcapRemoteTransactionId
                            options:options];


    if(self.logLevel <= UMLOG_DEBUG)
    {
        NSString *s = [NSString stringWithFormat:@"GSMMAP-Dialog: tcapUAbortIndicationdialogPortion: %@ (%@)",xdialoguePortion,[xdialoguePortion className]];
        [self.logFeed debugText:s];
    }
    [self touch];
    self.dialogIsClosed = YES;
    self.dialogResponseRequired = NO;
    self.openEstablished = NO;
}

- (void)tcBeginIndication
{
    /* <#code#> */
}


- (void)tcCancelIndication
{
    /* <#code#> */
}

- (void)tcContinueIndication
{
    /* <#code#> */
}


- (void)tcEndIndication
{
    /* <#code#> */
}


- (void)tcInvokeIndication
{
    /* <#code#> */
}


- (void)tcNoticeIndication
{
    /* <#code#> */
}


- (void)tcPAbortIndication
{
    /* <#code#> */
}


- (void)tcRRejectIndication
{
    /* <#code#> */
}



- (void)tcResultLastIndication
{
    /* <#code#> */
}



- (void)tcResultNotLastIndication
{
    /* <#code#> */
}


- (void)tcUAbortIndication
{
    /* <#code#> */
}



- (void)tcUErrorIndication
{
    /* <#code#> */
}



- (void)tcURejectIndication
{
    /* <#code#> */
}



- (void)tcUniIndication
{
    /* <#code#> */
}



- (void)timeOut
{
    @try
    {
        //NSLog(@"gsmmap-timeout:%@ (last activity=%@, timeoutInSeconds: %8.2lfs)\n",self.userIdentifier,_lastActivity.description,_timeoutInSeconds);
        [_mapUser executeMAP_P_Abort_Ind:self.userIdentifier
                         callingAddress:_remoteAddress
                          calledAddress:_localAddress
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
        [_gsmmapLayer.logFeed majorErrorText:[NSString stringWithFormat:@"Exception %@",e]];
    }
}

- (void)dump:(NSFileHandle *)filehandler
{
    NSMutableString *s = [[NSMutableString alloc]init];
    [s appendFormat:@"    localTransactionId: %@\n",_tcapTransactionId];
    [s appendFormat:@"    remoteTransactionId: %@\n",_tcapRemoteTransactionId];
    [s appendFormat:@"    userDialogId: %@\n",_userDialogId];
    [s appendFormat:@"    userIdentifier: %@\n",_userIdentifier];
    NSDictionary *d = [_applicationContext objectValue];
    [s appendFormat:@"    applicationContext: %@\n",d[@"objectIdentifier"]];
    d = [_applicationContext2 objectValue];
    [s appendFormat:@"    applicationContext2: %@\n",d[@"objectIdentifier"]];
    [s appendFormat:@"    localAddress: %@\n",[_localAddress description]];
    [s appendFormat:@"    remoteAddress: %@\n",[_remoteAddress description]];
    [s appendFormat:@"    timeoutInSeconds: %8.2lfs\n",self.timeoutInSeconds];
    [s appendFormat:@"    startDate: %@\n",[_startDate description]];
    [s appendFormat:@"    lastActivity: %@\n",[_lastActivity description]];
    [s appendFormat:@"    tcapContinueSeen: %@\n",@(_tcapContinueSeen)];
    [filehandler writeData: [s dataUsingEncoding:NSUTF8StringEncoding]];
}


- (void)setOptions:(NSDictionary *)options
{
    NSArray <NSString *> *tcap_options = options[@"tcap-options"];
    if(tcap_options.count > 0)
    {
        for(NSString *option in tcap_options)
        {
            if([option hasSuffix:@"handshake"])
            {
                _useHandshake = YES;
            }
            else if([option isEqualToString:@"start-with-continue"])
            {
                _startWithContinue = YES;
            }
            else if([option isEqualToString:@"no-dtid-in-continue"])
            {
                _noDestinationTransationIdInContinue = YES;
            }
            else if([option isEqualToString:@"double-otid-in-continue"])
            {
                _doubleOriginationTransationIdInContinue = YES;
            }
        }
    }
}



@end

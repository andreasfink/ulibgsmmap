//
//  UMLayerGSMMAP_Dialog.h
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulib/ulib.h>
#import <ulibtcap/ulibtcap.h>
#import "UMLayerGSMMAP_OpCode.h"
#import "UMLayerGSMMAP_UserProtocol.h"
#import "UMGSMMAP_asn1.h"
#import "UMGSMMAP_DialogIdentifier.h"
#import "UMGSMMAP_UserIdentifier.h"

#define AUTO_ASSIGN_INVOKE_ID   INT16_MAX

@class UMLayerGSMMAP;
@class UMLayerTCAP;

@interface UMLayerGSMMAP_Dialog : UMObject<UMTCAP_UserProtocol>
{
    UMGSMMAP_DialogIdentifier *userDialogId;
    NSString *tcapTransactionId;
    NSString *tcapRemoteTransactionId;
    UMGSMMAP_UserIdentifier *userIdentifier;
    id<UMLayerGSMMAP_UserProtocol> mapUser;
    UMLayerTCAP *tcapLayer;
    UMLayerGSMMAP *gsmmapLayer;
    UMTCAP_asn1_objectIdentifier *applicationContext;
    UMTCAP_asn1_objectIdentifier *applicationContext2;
    UMTCAP_asn1_userInformation *_requestUserInfo;
    UMTCAP_asn1_userInformation *_responseUserInfo;
    UMTCAP_asn1_objectIdentifier *_responseApplicationContext;
    UMASN1BitString *dialogProtocolVersion;
    SccpAddress *localAddress;
    SccpAddress *remoteAddress;
    int64_t  _nextInvokeId;
    NSTimeInterval _timeoutInSeconds;
    NSDate *_startDate;
    UMAtomicDate *_lastActivity;
    NSDictionary *_outboundOptions;
    UMTCAP_Variant variant;
    UMSynchronizedArray *pendingOutgoingComponents;
    UMSynchronizedArray *pendingIncomingComponents;
    UMLogLevel _logLevel;
    BOOL    _initiatedOutgoing;
    BOOL    _openEstablished;
    BOOL    _returnResultLastSent;
    BOOL    _dialogRequestRequired;
    BOOL    _dialogResponseRequired;
    BOOL    _dialogIsClosed;
    BOOL    _dialogIsClosing;
    BOOL    _dialogShallClose;
    BOOL    _tcapContinueSeen;
    NSString *_tcapOperationGlobal;
    
    BOOL    _startWithContinue;
    BOOL    _noDestinationTransationIdInContinue;
    BOOL    _doubleOriginationTransationIdInContinue;
    
    BOOL                                    _shouldSendContinue;
    UMTCAP_asn1_Associate_result            *_pendingResult;
    UMTCAP_asn1_Associate_source_diagnostic *_pendingDiagnostic;
    UMTCAP_asn1_userInformation             *_pendingUserInfo;
}

#pragma mark -
#pragma mark Properties

@property(readwrite,strong) UMGSMMAP_DialogIdentifier *userDialogId;
@property(readwrite,strong) NSString *tcapTransactionId;
@property(readwrite,strong) NSString *tcapOperationGlobal;
@property(readwrite,strong) UMGSMMAP_UserIdentifier *userIdentifier;
@property(readwrite,strong) id<UMLayerGSMMAP_UserProtocol> mapUser;
@property(readwrite,strong) UMLayerTCAP *tcapLayer;
@property(readwrite,strong) UMLayerGSMMAP *gsmmapLayer;
@property(readwrite,strong) UMTCAP_asn1_objectIdentifier *applicationContext;
@property(readwrite,strong) UMTCAP_asn1_objectIdentifier *applicationContext2;
@property(readwrite,strong) UMTCAP_asn1_userInformation *requestUserInfo;
@property(readwrite,strong) UMTCAP_asn1_userInformation *responseUserInfo;
@property(readwrite,strong) UMTCAP_asn1_objectIdentifier *responseApplicationContext;
@property(readwrite,strong) NSDictionary *outboundOptions;

@property(readwrite,strong) UMASN1BitString *dialogProtocolVersion;
@property(readwrite,strong,atomic) SccpAddress *localAddress;
@property(readwrite,strong,atomic) SccpAddress *remoteAddress;
@property(readwrite,assign) UMTCAP_Variant variant;
@property(readwrite,assign,atomic) BOOL    initiatedOutgoing;
@property(readwrite,assign,atomic) BOOL    openEstablished;
@property(readwrite,assign,atomic) BOOL    returnResultLastSent;
@property(readwrite,assign,atomic) BOOL    dialogRequestRequired;
@property(readwrite,assign,atomic) BOOL    dialogResponseRequired;
@property(readwrite,assign,atomic) BOOL    dialogIsClosed;
@property(readwrite,assign,atomic) BOOL    dialogIsClosing;
@property(readwrite,assign,atomic) BOOL    dialogShallClose;
@property(readwrite,assign,atomic) UMLogLevel logLevel;
@property(readwrite,assign,atomic) BOOL tcapContinueSeen;
@property(readwrite,assign,atomic) BOOL startWithContinue;
@property(readwrite,assign,atomic) BOOL noDestinationTransationIdInContinue;
@property(readwrite,assign,atomic) BOOL doubleOriginationTransationIdInContinue;
@property(readwrite,assign,atomic) BOOL shouldSendContinue;

- (NSTimeInterval)timeoutInSeconds;
- (void)setTimeoutInSeconds:(NSTimeInterval)to;

@property(readwrite,strong)    NSString *tcapRemoteTransactionId;

#pragma mark -
#pragma mark Dialog Handling

-(void) MAP_Open_Req_forUser:(id<UMLayerGSMMAP_UserProtocol>)user
                        tcap:(UMLayerTCAP *)xtcap
                         map:(UMLayerGSMMAP *)xgsmmap
                     variant:(UMTCAP_Variant)xvariant
              callingAddress:(SccpAddress *)src
               calledAddress:(SccpAddress *)dst
          applicationContext:(UMTCAP_asn1_objectIdentifier *)appContext
                    userInfo:(UMTCAP_asn1_userInformation *)xuserInfo
              userIdentifier:(UMGSMMAP_UserIdentifier *)userIdentifier
                     options:(NSDictionary *)xoptions;

- (void) MAP_Open_Ind_forUser:(id<UMLayerGSMMAP_UserProtocol>)user
                         tcap:(UMLayerTCAP *)xtcap
                          map:(UMLayerGSMMAP *)xgsmmap
                      variant:(UMTCAP_Variant)xvariant
              callingAddress:(SccpAddress *)src
               calledAddress:(SccpAddress *)dst
              dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
                transactionId:(NSString *)localTransactionId
          remoteTransactionId:(NSString *)remotelTransactionId
                     options:(NSDictionary *)xoptions;

-(void) MAP_Delimiter_Req:(NSDictionary *)options;
-(void)MAP_Delimiter_Req:(NSDictionary *)xoptions
                  result:(UMTCAP_asn1_Associate_result *)result
              diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic;

-(void)MAP_Delimiter_Req:(NSDictionary *)xoptions
          callingAddress:(SccpAddress *)src
           calledAddress:(SccpAddress *)dst
                   result:(UMTCAP_asn1_Associate_result *)result
               diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic;

- (void)MAP_Delimiter_Req_Prepare:(NSDictionary *)xoptions
                   callingAddress:(SccpAddress *)src
                    calledAddress:(SccpAddress *)dst
                           result:(UMTCAP_asn1_Associate_result *)result
                       diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic
                         userInfo:(UMTCAP_asn1_userInformation *)xuserInfo;

- (void)MAP_Delimiter_Req:(NSDictionary *)xoptions
           callingAddress:(SccpAddress *)src
            calledAddress:(SccpAddress *)dst
                   result:(UMTCAP_asn1_Associate_result *)result
               diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic
                 userInfo:(UMTCAP_asn1_userInformation *)xuserInfo;

-(void) MAP_Close_Req:(NSDictionary *)options;
-(void) MAP_Close_Req:(NSDictionary *)xoptions
               result:(UMTCAP_asn1_Associate_result *)result
           diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic;
-(void) MAP_Close_Req:(NSDictionary *)xoptions
       callingAddress:(SccpAddress *)src
        calledAddress:(SccpAddress *)dst
               result:(UMTCAP_asn1_Associate_result *)result
           diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic;

-(void) MAP_Close_Req:(NSDictionary *)xoptions
       callingAddress:(SccpAddress *)src
        calledAddress:(SccpAddress *)dst
               result:(UMTCAP_asn1_Associate_result *)result
           diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic
             userInfo:(UMTCAP_asn1_userInformation *)userInfo;


- (void)MAP_Error_Req:(UMASN1Object *)param
       callingAddress:(SccpAddress *)src
        calledAddress:(SccpAddress *)dst
      dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
            operation:(int64_t)operation
              options:(NSDictionary *)options;

- (void)MAP_Reject_Req:(UMASN1Object *)param
        callingAddress:(SccpAddress *)src
         calledAddress:(SccpAddress *)dst
       dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
              invokeId:(int64_t)invokeId
               problem:(UMGSMMAP_asn1 *)problem
               options:(NSDictionary *)options;

-(void) MAP_U_Abort_Ind:(NSDictionary *)options
         callingAddress:(SccpAddress *)src
          calledAddress:(SccpAddress *)dst
        dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
          transactionId:(NSString *)localTransactionId
    remoteTransactionId:(NSString *)remoteTransactionId;

-(void) MAP_P_Abort_Ind:(NSDictionary *)options
         callingAddress:(SccpAddress *)src
          calledAddress:(SccpAddress *)dst
        dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
          transactionId:(NSString *)localTransactionId
    remoteTransactionId:(NSString *)remoteTransactionId;


-(void) MAP_U_Abort_Req:(NSDictionary *)xoptions
         callingAddress:(SccpAddress *)src
          calledAddress:(SccpAddress *)dst
                  cause:(int64_t)cause
                 result:(UMTCAP_asn1_Associate_result *)result
             diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic
               userInfo:(UMTCAP_asn1_userInformation *)userInfo;
#pragma mark -
#pragma mark Component Handling

- (void) MAP_Invoke_Req:(UMASN1Object *)param
               invokeId:(int64_t)invokeId  /* if not used: AUTO_ASSIGN_INVOKE_ID */
               linkedId:(int64_t)linkedId  /* if not used: TCAP_UNDEFINED_LINKED_ID */
                 opCode:(UMLayerGSMMAP_OpCode *)opcode
                   last:(BOOL)last
                options:(NSDictionary *)options;


- (void) MAP_ReturnResult_Req:(UMASN1Object *)param
                     invokeId:(int64_t)invokeId  /* if not used: AUTO_ASSIGN_INVOKE_ID */
                     linkedId:(int64_t)linkedId  /* if not used: TCAP_UNDEFINED_LINKED_ID */
                       opCode:(UMLayerGSMMAP_OpCode *)opcode
                         last:(BOOL)last
                      options:(NSDictionary *)options;


- (void)MAP_ReturnError_Req:(UMASN1Object *)param
                   invokeId:(int64_t)invokeId  /* if not used: AUTO_ASSIGN_INVOKE_ID */
                   linkedId:(int64_t)linkedId  /* if not used: TCAP_UNDEFINED_LINKED_ID */
                     opCode:(UMLayerGSMMAP_OpCode *)opcode
                  errorCode:(int64_t)errorCode
                    options:(NSDictionary *)options;


- (void)MAP_Invoke_Ind:(UMASN1Object *)params
                opCode:(UMLayerGSMMAP_OpCode *)opcode
              invokeId:(int64_t)invokeId
              linkedId:(int64_t)linkedId
                  last:(BOOL)last
               options:(NSDictionary *)options;

- (void)MAP_ReturnResult_Resp:(UMGSMMAP_asn1 *)params
                      opCode:(UMLayerGSMMAP_OpCode *)opcode
                    invokeId:(int64_t)invokeId
                    linkedId:(int64_t)linkedId
                        last:(BOOL)last
                     options:(NSDictionary *)options;

- (void)MAP_ReturnError_Ind:(UMGSMMAP_asn1 *)params
                     opCode:(UMLayerGSMMAP_OpCode *)opcode
                   invokeId:(int64_t)invokeId
                   linkedId:(int64_t)linkedId
                  errorCode:(int64_t)errorCode
                    options:(NSDictionary *)options;

- (void)MAP_Reject_Ind:(UMGSMMAP_asn1 *)params
                opCode:(UMLayerGSMMAP_OpCode *)opcode
              invokeId:(int64_t)invokeId
              linkedId:(int64_t)linkedId
             errorCode:(int64_t)errorCode
               options:(NSDictionary *)options;

-(void) MAP_Delimiter_Ind:(NSDictionary *)options
                   dialog:(UMGSMMAP_DialogIdentifier *)dialogId
           callingAddress:(SccpAddress *)src
            calledAddress:(SccpAddress *)dst
          dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
            transactionId:(NSString *)localTransactionId
      remoteTransactionId:(NSString *)remoteTransactionId;

-(void) MAP_Continue_Ind:(NSDictionary *)options
          callingAddress:(SccpAddress *)src
           calledAddress:(SccpAddress *)dst
         dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
           transactionId:(NSString *)localTransactionId
     remoteTransactionId:(NSString *)remoteTransactionId;

-(void) MAP_Close_Ind:(NSDictionary *)options;

-(void) MAP_Notice_Ind:(NSDictionary *)options
     tcapTransactionId:(NSString *)localTransactionId
                reason:(SCCP_ReturnCause)returnCause;

#pragma mark -
#pragma mark Helper Methods
- (void)MAP_ProcessComponents:(NSArray *)components
                      options:(NSDictionary *)xoptions
                      willEnd:(BOOL)willEnd;

#pragma mark -
#pragma mark Various Background Tasks

- (void)touch;
- (BOOL)isTimedOut;
- (void)timeOut;

- (void)dump:(NSFileHandle *)filehandler;

- (void)setOptions:(NSDictionary *)dict;

@end

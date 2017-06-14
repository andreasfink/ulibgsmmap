//
//  UMGSMMAP_Dialog.h
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

#define AUTO_ASSIGN_INVOKE_ID   INT16_MAX

@class UMLayerGSMMAP;
@class UMLayerTCAP;

@interface UMLayerGSMMAP_Dialog : UMObject<UMTCAP_UserProtocol>
{
    NSString *userDialogId;
    NSString *tcapTransactionId;
    NSString *tcapRemoteTransactionId;
    NSString *userIdentifier;
    id<UMLayerGSMMAP_UserProtocol> mapUser;
    UMLayerTCAP *tcapLayer;
    UMLayerGSMMAP *gsmmapLayer;
    UMTCAP_asn1_objectIdentifier *applicationContext;
    UMTCAP_asn1_objectIdentifier *applicationContext2;
    UMTCAP_asn1_userInformation *userInfo;
    UMASN1BitString *dialogProtocolVersion;
    SccpAddress *localAddress;
    SccpAddress *remoteAddress;
    NSDictionary *options;
    int64_t  _nextInvokeId;
    NSTimeInterval timeoutValue;
    NSDate *timeoutDate;
    NSDate *createdDate;
    UMTCAP_Variant variant;
    UMSynchronizedArray *pendingOutgoingComponents;
    UMSynchronizedArray *pendingIncomingComponents;

    BOOL    _initiatedOutgoing;
    BOOL    _openEstablished;
    BOOL    _returnResultLastSent;
    BOOL    _dialogRequestRequired;
    BOOL    _dialogResponseRequired;
    BOOL    _dialogIsClosed;
    BOOL    _dialogShallClose;
}

#pragma mark -
#pragma mark Properties

@property(readwrite,strong) NSString *userDialogId;
@property(readwrite,strong) NSString *tcapTransactionId;
@property(readwrite,strong) NSString *userIdentifier;
@property(readwrite,strong) id<UMLayerGSMMAP_UserProtocol> mapUser;
@property(readwrite,strong) UMLayerTCAP *tcapLayer;
@property(readwrite,strong) UMLayerGSMMAP *gsmmapLayer;
@property(readwrite,strong) UMTCAP_asn1_objectIdentifier *applicationContext;
@property(readwrite,strong) UMTCAP_asn1_objectIdentifier *applicationContext2;
@property(readwrite,strong) UMTCAP_asn1_userInformation *userInfo;
@property(readwrite,strong) UMASN1BitString *dialogProtocolVersion;
@property(readwrite,strong) SccpAddress *localAddress;
@property(readwrite,strong) SccpAddress *remoteAddress;
@property(readwrite,strong) NSDictionary *options;
@property(readwrite,assign) UMTCAP_Variant variant;
@property(readwrite,assign,atomic) BOOL    initiatedOutgoing;
@property(readwrite,assign,atomic) BOOL    openEstablished;
@property(readwrite,assign,atomic) BOOL    returnResultLastSent;
@property(readwrite,assign,atomic) BOOL    dialogRequestRequired;
@property(readwrite,assign,atomic) BOOL    dialogResponseRequired;
@property(readwrite,assign,atomic) BOOL    dialogIsClosed;
@property(readwrite,assign,atomic) BOOL    dialogShallClose;


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
              userIdentifier:(NSString *)userIdentifier
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

-(void) MAP_Close_Req:(NSDictionary *)options;
-(void) MAP_Close_Req:(NSDictionary *)xoptions
               result:(UMTCAP_asn1_Associate_result *)result
           diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic;

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


-(void) MAP_U_Abort_Req:(NSDictionary *)options;

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
                   dialog:(NSString *)dialogId
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
                      options:(NSDictionary *)xoptions;

#pragma mark -
#pragma mark Various Background Tasks

- (void)touch;
- (BOOL)isTimedOut;
- (void)timeOut;
@end

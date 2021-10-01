//
//  UMLayerGSMMAP.h
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulib/ulib.h>
#import <ulibgt/ulibgt.h>
#import <ulibgt/ulibgt.h>
#import <ulibsccp/ulibsccp.h>
#import <ulibtcap/ulibtcap.h>

#import "UMLayerGSMMAP_UserProtocol.h"
#import "UMLayerGSMMAP_ProviderProtocol.h"
#import "UMLayerGSMMAP_Dialog.h"
#import "UMLayerGSMMAPApplicationContextProtocol.h"
 
@class UMLayerGSMMAP_Dialog;

@interface UMLayerGSMMAP : UMLayer<UMTCAP_UserProtocol,UMLayerGSMMAP_ProviderProtocol>
{
    UMLayerTCAP         *_tcap;
    NSString            *_address;
    SccpSubSystemNumber *_ssn;

    UMSynchronizedArray             *_operations;
    id<UMLayerGSMMAP_UserProtocol>  _user;
    UMTimer                         *_houseKeepingTimer;
    UMSynchronizedDictionary        *_dialogs;
    BOOL                            _housekeeping_running;
    UMMutex                         *_dialogIdLock;
    UMAtomicDate                    *_houseKeepingTimerRun;
    NSTimeInterval                  _dialogTimeout;
}

@property(readwrite,strong)         UMLayerTCAP                     *tcap;
@property(readwrite,strong)         NSString                        *address;
@property(readwrite,strong)         SccpSubSystemNumber             *ssn;

@property(readwrite,strong)         id<UMLayerGSMMAP_UserProtocol>  user;
@property(readwrite,assign,atomic)  BOOL                            housekeeping_running;
@property(readwrite,strong)         UMAtomicDate                    *houseKeepingTimerRun;
@property(readwrite,assign,atomic)  NSTimeInterval                  dialogTimeout;


-(UMMTP3Variant) variant;

- (UMLayerGSMMAP *)initWithoutExecutionQueue:(NSString *)name;
- (void) setConfig:(NSDictionary *)cfg applicationContext:(id<UMLayerGSMMAPApplicationContextProtocol>)appContext;
- (void) startUp;
- (NSString *)status;
- (NSUInteger)dialogsCount;

- (UMASN1Object *)decodeASN1:(UMASN1Object *)params
               operationCode:(int64_t)opcode
               operationType:(UMTCAP_InternalOperation)operation
               operationName:(NSString **)operationName
                     context:(id)context;

- (UMLayerGSMMAP_Dialog *)getNewDialogForUser:(id<UMLayerGSMMAP_UserProtocol>)u withId:(UMGSMMAP_DialogIdentifier *)dialogId;
- (UMLayerGSMMAP_Dialog *)getNewDialogForUser:(id<UMLayerGSMMAP_UserProtocol>)u;

- (NSString *)decodeError:(int)err;
+ (NSString *)decodeError:(int)err;

/* Note: queueMAP_Open_Req_forUser does not exist on purpose as we need to return a dialog id */

-(UMGSMMAP_DialogIdentifier *) executeMAP_Open_Req_forUser:(id<UMLayerGSMMAP_UserProtocol>)xuser
                                                   variant:(UMTCAP_Variant)variant
                                            callingAddress:(SccpAddress *)src
                                             calledAddress:(SccpAddress *)dst
                                        applicationContext:(UMTCAP_asn1_objectIdentifier *)appContext
                                                  userInfo:(UMTCAP_asn1_userInformation *)xuserInfo
                                            userIdentifier:(UMGSMMAP_UserIdentifier *)xuserIdentifier
                                                   options:(NSDictionary *)options;

-(void) queueMAP_Delimiter_Req:(UMGSMMAP_DialogIdentifier *)dialogId
                callingAddress:(SccpAddress *)src
                 calledAddress:(SccpAddress *)dst
                       options:(NSDictionary *)options
                        result:(UMTCAP_asn1_Associate_result *)result
                    diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic;


-(void) executeMAP_Delimiter_Req:(UMGSMMAP_DialogIdentifier *)dialogId
                callingAddress:(SccpAddress *)src
                 calledAddress:(SccpAddress *)dst
                       options:(NSDictionary *)options
                        result:(UMTCAP_asn1_Associate_result *)result
                    diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic;

-(void) executeMAP_Delimiter_Req_Prepare:(UMGSMMAP_DialogIdentifier *)dialogId
                          callingAddress:(SccpAddress *)src
                           calledAddress:(SccpAddress *)dst
                                 options:(NSDictionary *)options
                                  result:(UMTCAP_asn1_Associate_result *)result
                              diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic;

- (void)queueMAP_Close_Req:(UMGSMMAP_DialogIdentifier *)dialogId
       callingAddress:(SccpAddress *)src
        calledAddress:(SccpAddress *)dst
              options:(NSDictionary *)options
               result:(UMTCAP_asn1_Associate_result *)result
           diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic;

- (void)executeMAP_Close_Req:(UMGSMMAP_DialogIdentifier *)dialogId
            callingAddress:(SccpAddress *)src
             calledAddress:(SccpAddress *)dst
                   options:(NSDictionary *)options
                    result:(UMTCAP_asn1_Associate_result *)result
                diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic;

- (void) queueMAP_Invoke_Req:(UMASN1Object *)param
                 dialog:(UMGSMMAP_DialogIdentifier *)dialogId
               invokeId:(int64_t)xinvokeId
               linkedId:(int64_t)linkedId
                 opCode:(UMLayerGSMMAP_OpCode *)opcode
                   last:(int64_t)last
                options:(NSDictionary *)options;

- (void) executeMAP_Invoke_Req:(UMASN1Object *)param
                      dialog:(UMGSMMAP_DialogIdentifier *)dialogId
                    invokeId:(int64_t)xinvokeId
                    linkedId:(int64_t)linkedId
                      opCode:(UMLayerGSMMAP_OpCode *)opcode
                        last:(int64_t)last
                     options:(NSDictionary *)options;

- (void) queueMAP_ReturnResult_Req:(UMASN1Object *)xparam
                              dialog:(UMGSMMAP_DialogIdentifier *)dialogId
                            invokeId:(int64_t)xinvokeId
                            linkedId:(int64_t)xlinkedId
                              opCode:(UMLayerGSMMAP_OpCode *)xopcode
                                last:(int64_t)xlast
                             options:(NSDictionary *)xoptions;

- (void) executeMAP_ReturnResult_Req:(UMASN1Object *)xparam
                       dialog:(UMGSMMAP_DialogIdentifier *)dialogId
                     invokeId:(int64_t)xinvokeId
                     linkedId:(int64_t)xlinkedId
                       opCode:(UMLayerGSMMAP_OpCode *)xopcode
                         last:(int64_t)xlast
                      options:(NSDictionary *)xoptions;

- (void)queueMAP_ReturnError_Req:(UMASN1Object *)param
                     dialog:(UMGSMMAP_DialogIdentifier *)dialogId
                   invokeId:(int64_t)xinvokeId  /* if not used: AUTO_ASSIGN_INVOKE_ID */
                   linkedId:(int64_t)xlinkedId  /* if not used: TCAP_UNDEFINED_LINKED_ID */
                     opCode:(UMLayerGSMMAP_OpCode *)opcode
                  errorCode:(int64_t)errorCode
                    options:(NSDictionary *)options;

- (void)executeMAP_ReturnError_Req:(UMASN1Object *)param
                            dialog:(UMGSMMAP_DialogIdentifier *)dialogId
                          invokeId:(int64_t)xinvokeId  /* if not used: AUTO_ASSIGN_INVOKE_ID */
                          linkedId:(int64_t)xlinkedId  /* if not used: TCAP_UNDEFINED_LINKED_ID */
                            opCode:(UMLayerGSMMAP_OpCode *)opcode
                         errorCode:(int64_t)errorCode
                           options:(NSDictionary *)options;


-(void) queueMAP_U_Abort_Req:(UMGSMMAP_DialogIdentifier *)dialogId
                     options:(NSDictionary *)options
                      result:(UMTCAP_asn1_Associate_result *)result
                  diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic
                    userInfo:(UMTCAP_asn1_userInformation *)userInfo
                       cause:(int64_t)cause;

-(void) executeMAP_U_Abort_Req:(UMGSMMAP_DialogIdentifier *)dialogId
                     options:(NSDictionary *)options
                      result:(UMTCAP_asn1_Associate_result *)result
                  diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic
                    userInfo:(UMTCAP_asn1_userInformation *)userInfo
                         cause:(int64_t)cause;


- (UMLayerGSMMAP_Dialog *)dialogById:(UMGSMMAP_DialogIdentifier *)did;
- (void)housekeeping;
- (UMGSMMAP_DialogIdentifier *)getNewUserDialogId;
- (NSDictionary *)apiStatus;


- (SccpAddress *)dialogLocalSccpAddress:(UMGSMMAP_DialogIdentifier *)dialogId;
- (SccpAddress *)dialogRemoteSccpAddress:(UMGSMMAP_DialogIdentifier *)dialogId;
- (void)setDialogLocalSccpAddress:(UMGSMMAP_DialogIdentifier *)dialogId sccpAddress:(SccpAddress *)addr;
- (void)setDialogRemoteSccpAddress:(UMGSMMAP_DialogIdentifier *)dialogId sccpAddress:(SccpAddress *)addr;
@end


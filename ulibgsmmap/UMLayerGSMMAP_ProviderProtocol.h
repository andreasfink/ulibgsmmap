//
//  UMLayerGSMMAP_ProviderProtocol.h
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
#import "UMGSMMAP_DialogIdentifier.h"
#import "UMGSMMAP_UserIdentifier.h"

@protocol UMLayerGSMMAP_UserProtocol;

@protocol UMLayerGSMMAP_ProviderProtocol <NSObject,UMLayerUserProtocol>

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

- (void)queueMAP_Close_Req:(UMGSMMAP_DialogIdentifier *)dialogId
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

- (void) queueMAP_ReturnResult_Req:(UMASN1Object *)xparam
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

-(void) queueMAP_U_Abort_Req:(UMGSMMAP_DialogIdentifier *)dialogId
                     options:(NSDictionary *)options
                      result:(UMTCAP_asn1_Associate_result *)result
                  diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic
                    userInfo:(UMTCAP_asn1_userInformation *)userInfo
                       cause:(int64_t)cause;



@end

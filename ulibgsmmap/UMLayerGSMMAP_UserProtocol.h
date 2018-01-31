//
//  UMLayerGSMMAP_UserProtocol
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulib/ulib.h>
#import "UMLayerGSMMAP_OpCode.h"

@class UMGSMMAP_DialogIdentifier;
@class UMGSMMAP_UserIdentifier;

#define GSMMAP_INVOKE_INDICATION_PARAMETERS \
    (UMASN1Object *)xparam\
    userId:(UMGSMMAP_UserIdentifier *)xuserIdentifier\
    dialog:(UMGSMMAP_DialogIdentifier *)xdialogId\
    transaction:(NSString *)xtcapTransactionId\
    opCode:(UMLayerGSMMAP_OpCode *)xopcode\
    invokeId:(int64_t)xinvokeId\
    linkedId:(int64_t)xlinkedId\
    last:(BOOL)xlast\
    options:(NSDictionary *)xoptions

#define GSMMAP_INVOKE_CALL_PARAMETERS \
                param \
         userId:userIdentifier \
         dialog:xdialogId \
    transaction:xtcapTransactionId \
         opCode:xopcode \
       invokeId:xinvokeId \
       linkedId:xlinkedId \
           last:xlast \
        options:xoptions


@protocol UMLayerGSMMAP_ProviderProtocol;
@protocol UMLayerGSMMAP_UserProtocol <NSObject,UMLayerUserProtocol>

#pragma mark -
#pragma mark identifier handling

- (UMGSMMAP_UserIdentifier *)getNewUserIdentifier;

#pragma mark -
#pragma mark handle incoming components

#define QUEUE_EXEC_SYMANTICS 1

#ifdef  QUEUE_EXEC_SYMANTICS

-(void) queueMAP_Invoke_Ind:GSMMAP_INVOKE_INDICATION_PARAMETERS;
-(void) executeMAP_Invoke_Ind:GSMMAP_INVOKE_INDICATION_PARAMETERS;

-(void) queueMAP_ReturnResult_Resp:(UMASN1Object *)param
                            userId:(UMGSMMAP_UserIdentifier *)userIdentifier
                            dialog:(UMGSMMAP_DialogIdentifier *)dialogId
                       transaction:(NSString *)tcapTransactionId
                            opCode:(UMLayerGSMMAP_OpCode *)xopcode
                          invokeId:(int64_t)xinvokeId
                          linkedId:(int64_t)xlinkedId
                              last:(BOOL)xlast
                           options:(NSDictionary *)xoptions;

-(void) executeMAP_ReturnResult_Resp:(UMASN1Object *)param
                              userId:(UMGSMMAP_UserIdentifier *)userIdentifier
                              dialog:(UMGSMMAP_DialogIdentifier *)dialogId
                         transaction:(NSString *)tcapTransactionId
                              opCode:(UMLayerGSMMAP_OpCode *)xopcode
                            invokeId:(int64_t)xinvokeId
                            linkedId:(int64_t)xlinkedId
                                last:(BOOL)xlast
                             options:(NSDictionary *)xoptions;


- (void) queueMAP_ReturnError_Resp:(UMASN1Object *)param
                            userId:(UMGSMMAP_UserIdentifier *)userIdentifier
                            dialog:(UMGSMMAP_DialogIdentifier *)dialogId
                       transaction:(NSString *)tcapTransactionId
                            opCode:(UMLayerGSMMAP_OpCode *)xopcode
                          invokeId:(int64_t)xinvokeId
                          linkedId:(int64_t)xlinkedId
                         errorCode:(int64_t)err
                           options:(NSDictionary *)xoptions;
- (void) executeMAP_ReturnError_Resp:(UMASN1Object *)param
                            userId:(UMGSMMAP_UserIdentifier *)userIdentifier
                            dialog:(UMGSMMAP_DialogIdentifier *)dialogId
                       transaction:(NSString *)tcapTransactionId
                            opCode:(UMLayerGSMMAP_OpCode *)xopcode
                          invokeId:(int64_t)xinvokeId
                          linkedId:(int64_t)xlinkedId
                         errorCode:(int64_t)err
                           options:(NSDictionary *)xoptions;

- (void) queueMAP_Reject_Resp:(UMASN1Object *)param
                       userId:(UMGSMMAP_UserIdentifier *)userIdentifier
                       dialog:(UMGSMMAP_DialogIdentifier *)dialogId
                  transaction:(NSString *)tcapTransactionId
                       opCode:(UMLayerGSMMAP_OpCode *)xopcode
                     invokeId:(int64_t)xinvokeId
                     linkedId:(int64_t)xlinkedId
                    errorCode:(int64_t)err
                      options:(NSDictionary *)xoptions;
- (void) executeMAP_Reject_Resp:(UMASN1Object *)param
                       userId:(UMGSMMAP_UserIdentifier *)userIdentifier
                       dialog:(UMGSMMAP_DialogIdentifier *)dialogId
                  transaction:(NSString *)tcapTransactionId
                       opCode:(UMLayerGSMMAP_OpCode *)xopcode
                     invokeId:(int64_t)xinvokeId
                     linkedId:(int64_t)xlinkedId
                    errorCode:(int64_t)err
                      options:(NSDictionary *)xoptions;

#pragma mark -
#pragma mark Session Handling

- (void) queueMAP_Open_Ind:(UMGSMMAP_UserIdentifier *)userIdentifier
                    dialog:(UMGSMMAP_DialogIdentifier *)dialogId
               transaction:(NSString *)tcapTransactionId
         remoteTransaction:(NSString *)tcapRemoteTransactionId
                       map:(id<UMLayerGSMMAP_ProviderProtocol>)map
                   variant:(UMTCAP_Variant)xvariant
            callingAddress:(SccpAddress *)src
             calledAddress:(SccpAddress *)dst
           dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
                   options:(NSDictionary *)options;
- (void) executeMAP_Open_Ind:(UMGSMMAP_UserIdentifier *)userIdentifier
                    dialog:(UMGSMMAP_DialogIdentifier *)dialogId
               transaction:(NSString *)tcapTransactionId
         remoteTransaction:(NSString *)tcapRemoteTransactionId
                       map:(id<UMLayerGSMMAP_ProviderProtocol>)map
                   variant:(UMTCAP_Variant)xvariant
            callingAddress:(SccpAddress *)src
             calledAddress:(SccpAddress *)dst
           dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
                   options:(NSDictionary *)options;

- (void)queueMAP_Open_Resp:(UMGSMMAP_UserIdentifier *)uidstr
                    dialog:(UMGSMMAP_DialogIdentifier *)dialogId
               transaction:(NSString *)tcapTransactionId
         remoteTransaction:(NSString *)tcapRemoteTransactionId
                       map:(id<UMLayerGSMMAP_ProviderProtocol>)map
                   variant:(UMTCAP_Variant)xvariant
            callingAddress:(SccpAddress *)src
             calledAddress:(SccpAddress *)dst
           dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
                   options:(NSDictionary *)xoptions;
- (void)executeMAP_Open_Resp:(UMGSMMAP_UserIdentifier *)uidstr
                    dialog:(UMGSMMAP_DialogIdentifier *)dialogId
               transaction:(NSString *)tcapTransactionId
         remoteTransaction:(NSString *)tcapRemoteTransactionId
                       map:(id<UMLayerGSMMAP_ProviderProtocol>)map
                   variant:(UMTCAP_Variant)xvariant
            callingAddress:(SccpAddress *)src
             calledAddress:(SccpAddress *)dst
           dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
                   options:(NSDictionary *)xoptions;

-(void)queueMAP_Delimiter_Ind:(UMGSMMAP_UserIdentifier *)userIdentifier
                       dialog:(UMGSMMAP_DialogIdentifier *)dialogId
               callingAddress:(SccpAddress *)src
                calledAddress:(SccpAddress *)dst
              dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
                transactionId:(NSString *)localTransactionId
          remoteTransactionId:(NSString *)remoteTransactionId
                      options:(NSDictionary *)options;

-(void)queueMAP_Continue_Ind:(UMGSMMAP_UserIdentifier *)userIdentifier
              callingAddress:(SccpAddress *)src
               calledAddress:(SccpAddress *)dst
             dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
               transactionId:(NSString *)localTransactionId
         remoteTransactionId:(NSString *)remoteTransactionId
                     options:(NSDictionary *)options;

-(void)queueMAP_Unidirectional_Ind:(NSDictionary *)options
                    callingAddress:(SccpAddress *)src
                     calledAddress:(SccpAddress *)dst
                   dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
                     transactionId:(NSString *)localTransactionId
               remoteTransactionId:(NSString *)remoteTransactionId;


-(void) queueMAP_Close_Ind:(UMGSMMAP_UserIdentifier *)userIdentifier
                   options:(NSDictionary *)options;

-(void)queueMAP_U_Abort_Ind:(UMGSMMAP_UserIdentifier *)userIdentifier
             callingAddress:(SccpAddress *)src
              calledAddress:(SccpAddress *)dst
            dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
              transactionId:(NSString *)localTransactionId
        remoteTransactionId:(NSString *)remoteTransactionId
                    options:(NSDictionary *)options;
-(void)executeMAP_U_Abort_Ind:(UMGSMMAP_UserIdentifier *)userIdentifier
             callingAddress:(SccpAddress *)src
              calledAddress:(SccpAddress *)dst
            dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
              transactionId:(NSString *)localTransactionId
        remoteTransactionId:(NSString *)remoteTransactionId
                    options:(NSDictionary *)options;

-(void) queueMAP_P_Abort_Ind:(UMGSMMAP_UserIdentifier *)userIdentifier
              callingAddress:(SccpAddress *)src
               calledAddress:(SccpAddress *)dst
             dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
               transactionId:(NSString *)localTransactionId
         remoteTransactionId:(NSString *)remoteTransactionId
                     options:(NSDictionary *)options;
-(void) executeMAP_P_Abort_Ind:(UMGSMMAP_UserIdentifier *)userIdentifier
              callingAddress:(SccpAddress *)src
               calledAddress:(SccpAddress *)dst
             dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
               transactionId:(NSString *)localTransactionId
         remoteTransactionId:(NSString *)remoteTransactionId
                     options:(NSDictionary *)options;

-(void) queueMAP_Notice_Ind:(UMGSMMAP_UserIdentifier *)userIdentifier
          tcapTransactionId:(NSString *)localTransactionId
                     reason:(SCCP_ReturnCause)reason
                    options:(NSDictionary *)options;
-(void) executeMAP_Notice_Ind:(UMGSMMAP_UserIdentifier *)userIdentifier
          tcapTransactionId:(NSString *)localTransactionId
                     reason:(SCCP_ReturnCause)reason
                    options:(NSDictionary *)options;

#pragma mark-
#pragma mark optional methods
@optional
-(void) queueMAP_InsertSubscriberData:GSMMAP_INVOKE_INDICATION_PARAMETERS;
-(void) queueMAP_CancelLocation:GSMMAP_INVOKE_INDICATION_PARAMETERS;
-(void) queueMAP_UnstructuredSS_Request:GSMMAP_INVOKE_INDICATION_PARAMETERS;
-(void) queueMAP_UnstructuredSS_Notify:GSMMAP_INVOKE_INDICATION_PARAMETERS;

#else

-(void) MAP_Invoke_Ind:GSMMAP_INVOKE_INDICATION_PARAMETERS;

-(void) MAP_ReturnResult_Resp:(UMASN1Object *)param
                       userId:(UMGSMMAP_UserIdentifier *)userIdentifier
                       dialog:(UMGSMMAP_DialogIdentifier *)dialogId
                  transaction:(NSString *)tcapTransactionId
                       opCode:(UMLayerGSMMAP_OpCode *)xopcode
                     invokeId:(int64_t)xinvokeId
                     linkedId:(int64_t)xlinkedId
                         last:(BOOL)xlast
                      options:(NSDictionary *)xoptions;


- (void) MAP_ReturnError_Resp:(UMASN1Object *)param
                       userId:(UMGSMMAP_UserIdentifier *)userIdentifier
                       dialog:(UMGSMMAP_DialogIdentifier *)dialogId
                  transaction:(NSString *)tcapTransactionId
                       opCode:(UMLayerGSMMAP_OpCode *)xopcode
                     invokeId:(int64_t)xinvokeId
                     linkedId:(int64_t)xlinkedId
                    errorCode:(int64_t)err
                      options:(NSDictionary *)xoptions;

- (void) MAP_Reject_Resp:(UMASN1Object *)param
                  userId:(UMGSMMAP_UserIdentifier *)userIdentifier
                  dialog:(UMGSMMAP_DialogIdentifier *)dialogId
             transaction:(NSString *)tcapTransactionId
                  opCode:(UMLayerGSMMAP_OpCode *)xopcode
                invokeId:(int64_t)xinvokeId
                linkedId:(int64_t)xlinkedId
               errorCode:(int64_t)err
                 options:(NSDictionary *)xoptions;

#pragma mark -
#pragma mark Session Handling

- (void) MAP_Open_Ind:(UMGSMMAP_UserIdentifier *)userIdentifier
               dialog:(UMGSMMAP_DialogIdentifier *)dialogId
          transaction:(NSString *)tcapTransactionId
    remoteTransaction:(NSString *)tcapRemoteTransactionId
                  map:(id<UMLayerGSMMAP_ProviderProtocol>)map
              variant:(UMTCAP_Variant)xvariant
       callingAddress:(SccpAddress *)src
        calledAddress:(SccpAddress *)dst
      dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
              options:(NSDictionary *)options;

- (void) MAP_Open_Resp:(UMGSMMAP_UserIdentifier *)uidstr
                dialog:(UMGSMMAP_DialogIdentifier *)dialogId
           transaction:(NSString *)tcapTransactionId
     remoteTransaction:(NSString *)tcapRemoteTransactionId
                   map:(id<UMLayerGSMMAP_ProviderProtocol>)map
               variant:(UMTCAP_Variant)xvariant
        callingAddress:(SccpAddress *)src
         calledAddress:(SccpAddress *)dst
       dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
               options:(NSDictionary *)xoptions;

-(void)MAP_Delimiter_Ind:(UMGSMMAP_UserIdentifier *)userIdentifier
                  dialog:(UMGSMMAP_DialogIdentifier *)dialogId
          callingAddress:(SccpAddress *)src
           calledAddress:(SccpAddress *)dst
         dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
           transactionId:(NSString *)localTransactionId
     remoteTransactionId:(NSString *)remoteTransactionId
                 options:(NSDictionary *)options;

-(void)MAP_Continue_Ind:(UMGSMMAP_UserIdentifier *)userIdentifier
         callingAddress:(SccpAddress *)src
          calledAddress:(SccpAddress *)dst
        dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
          transactionId:(NSString *)localTransactionId
    remoteTransactionId:(NSString *)remoteTransactionId
                options:(NSDictionary *)options;

-(void)MAP_Unidirectional_Ind:(NSDictionary *)options
               callingAddress:(SccpAddress *)src
                calledAddress:(SccpAddress *)dst
              dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
                transactionId:(NSString *)localTransactionId
          remoteTransactionId:(NSString *)remoteTransactionId;


-(void) MAP_Close_Ind:(UMGSMMAP_UserIdentifier *)userIdentifier
              options:(NSDictionary *)options;

-(void) MAP_U_Abort_Req:(UMGSMMAP_UserIdentifier *)userIdentifier
                options:(NSDictionary *)options;

-(void)MAP_U_Abort_Ind:(UMGSMMAP_UserIdentifier *)userIdentifier
        callingAddress:(SccpAddress *)src
         calledAddress:(SccpAddress *)dst
       dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
         transactionId:(NSString *)localTransactionId
   remoteTransactionId:(NSString *)remoteTransactionId
               options:(NSDictionary *)options;

-(void) MAP_P_Abort_Ind:(UMGSMMAP_UserIdentifier *)userIdentifier
         callingAddress:(SccpAddress *)src
          calledAddress:(SccpAddress *)dst
        dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
          transactionId:(NSString *)localTransactionId
    remoteTransactionId:(NSString *)remoteTransactionId
                options:(NSDictionary *)options;

-(void) MAP_Notice_Ind:(UMGSMMAP_UserIdentifier *)userIdentifier
     tcapTransactionId:(NSString *)localTransactionId
                reason:(SCCP_ReturnCause)reason
               options:(NSDictionary *)options;

#pragma mark-
#pragma mark optional methods
@optional
-(void) MAP_InsertSubscriberData:GSMMAP_INVOKE_INDICATION_PARAMETERS;
-(void) MAP_CancelLocation:GSMMAP_INVOKE_INDICATION_PARAMETERS;
-(void) MAP_UnstructuredSS_Request:GSMMAP_INVOKE_INDICATION_PARAMETERS;
-(void) MAP_UnstructuredSS_Notify:GSMMAP_INVOKE_INDICATION_PARAMETERS;


#endif


#pragma mark -
#pragma mark helper methods
- (UMSynchronizedSortedDictionary *)decodeSmsObject:(NSData *)pdu
                                            context:(id)context;

@end

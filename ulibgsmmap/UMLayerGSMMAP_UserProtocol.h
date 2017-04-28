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


#define GSMMAP_INVOKE_INDICATION_PARAMETERS \
    (UMASN1Object *)xparam\
    userId:(NSString *)xuserIdentifier\
    dialog:(NSString *)xdialogId\
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

- (NSString *)getNewUserIdentifier;

#pragma mark -
#pragma mark handle incoming components

-(void) MAP_Invoke_Ind:GSMMAP_INVOKE_INDICATION_PARAMETERS;

-(void) MAP_ReturnResult_Resp:(UMASN1Object *)param
                       userId:(NSString *)userIdentifier
                       dialog:(NSString *)dialogId
                  transaction:(NSString *)tcapTransactionId
                       opCode:(UMLayerGSMMAP_OpCode *)xopcode
                     invokeId:(int64_t)xinvokeId
                     linkedId:(int64_t)xlinkedId
                         last:(BOOL)xlast
                      options:(NSDictionary *)xoptions;


- (void) MAP_ReturnError_Resp:(UMASN1Object *)param
                       userId:(NSString *)userIdentifier
                       dialog:(NSString *)dialogId
                  transaction:(NSString *)tcapTransactionId
                       opCode:(UMLayerGSMMAP_OpCode *)xopcode
                     invokeId:(int64_t)xinvokeId
                     linkedId:(int64_t)xlinkedId
                    errorCode:(int64_t)err
                      options:(NSDictionary *)xoptions;

- (void) MAP_Reject_Resp:(UMASN1Object *)param
                  userId:(NSString *)userIdentifier
                  dialog:(NSString *)dialogId
             transaction:(NSString *)tcapTransactionId
                  opCode:(UMLayerGSMMAP_OpCode *)xopcode
                invokeId:(int64_t)xinvokeId
                linkedId:(int64_t)xlinkedId
               errorCode:(int64_t)err
                 options:(NSDictionary *)xoptions;

#pragma mark -
#pragma mark Session Handling

- (void) MAP_Open_Ind:(NSString *)userIdentifier
               dialog:(NSString *)dialogId
          transaction:(NSString *)tcapTransactionId
    remoteTransaction:(NSString *)tcapRemoteTransactionId
                  map:(id<UMLayerGSMMAP_ProviderProtocol>)map
              variant:(UMTCAP_Variant)xvariant
       callingAddress:(SccpAddress *)src
        calledAddress:(SccpAddress *)dst
      dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
              options:(NSDictionary *)options;

- (void) MAP_Open_Resp:(NSString *)uidstr
                dialog:(NSString *)dialogId
           transaction:(NSString *)tcapTransactionId
     remoteTransaction:(NSString *)tcapRemoteTransactionId
                   map:(id<UMLayerGSMMAP_ProviderProtocol>)map
               variant:(UMTCAP_Variant)xvariant
        callingAddress:(SccpAddress *)src
         calledAddress:(SccpAddress *)dst
       dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
               options:(NSDictionary *)xoptions;

-(void)MAP_Delimiter_Ind:(NSString *)userIdentifier
                  dialog:(NSString *)dialogId
          callingAddress:(SccpAddress *)src
           calledAddress:(SccpAddress *)dst
         dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
           transactionId:(NSString *)localTransactionId
     remoteTransactionId:(NSString *)remoteTransactionId
                 options:(NSDictionary *)options;

-(void)MAP_Continue_Ind:(NSString *)userIdentifier
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


-(void) MAP_Close_Ind:(NSString *)userIdentifier
              options:(NSDictionary *)options;

-(void) MAP_U_Abort_Req:(NSString *)userIdentifier
                options:(NSDictionary *)options;

-(void)MAP_U_Abort_Ind:(NSString *)userIdentifier
        callingAddress:(SccpAddress *)src
         calledAddress:(SccpAddress *)dst
       dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
         transactionId:(NSString *)localTransactionId
   remoteTransactionId:(NSString *)remoteTransactionId
               options:(NSDictionary *)options;

-(void) MAP_P_Abort_Ind:(NSString *)userIdentifier
         callingAddress:(SccpAddress *)src
          calledAddress:(SccpAddress *)dst
        dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
          transactionId:(NSString *)localTransactionId
    remoteTransactionId:(NSString *)remoteTransactionId
                options:(NSDictionary *)options;

-(void) MAP_Notice_Ind:(NSString *)userIdentifier
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

#pragma mark -
#pragma mark helper methods
- (UMSynchronizedSortedDictionary *)decodeSmsObject:(NSData *)pdu
                                            context:(id)context;

@end

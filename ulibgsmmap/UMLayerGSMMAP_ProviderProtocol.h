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

@protocol UMLayerGSMMAP_UserProtocol;

@protocol UMLayerGSMMAP_ProviderProtocol <NSObject,UMLayerUserProtocol>



-(NSString *) MAP_Open_Req_forUser:(id<UMLayerGSMMAP_UserProtocol>)user
                           variant:(UMTCAP_Variant)variant
                    callingAddress:(SccpAddress *)src
                     calledAddress:(SccpAddress *)dst
                applicationContext:(UMTCAP_asn1_objectIdentifier *)appContext
                          userInfo:(UMTCAP_asn1_userInformation *)xuserInfo
                    userIdentifier:(NSString *)xuserIdentifier
                           options:(NSDictionary *)options;

-(void) MAP_Delimiter_Req:(NSString *)dialogId
                  options:(NSDictionary *)options;

- (void)MAP_Close_Req:(NSString *)dialogId
              options:(NSDictionary *)options;

-(void) MAP_U_Abort_Req:(NSString *)dialogId
                options:(NSDictionary *)options;

- (void) MAP_Invoke_Req:(UMASN1Object *)param
                 dialog:(NSString *)dialogId
               invokeId:(int64_t)xinvokeId
               linkedId:(int64_t)xlinkedId
                 opCode:(UMLayerGSMMAP_OpCode *)xopcode
                   last:(int64_t)last
                options:(NSDictionary *)options;

@end

//
//  UMLayerGSMMAP_ProviderProtocol.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
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

-(NSString *) MAP_Open_Req_forUser:(id<UMLayerGSMMAP_UserProtocol>)user
                           variant:(UMTCAP_Variant)variant
                    callingAddress:(SccpAddress *)src
                     calledAddress:(SccpAddress *)dst
                   dialoguePortion:(UMTCAP_asn1_dialoguePortion *)xdialoguePortion
                    userIdentifier:(NSString *)xuserIdentifier
                           options:(NSDictionary *)options;

-(void) MAP_Delimiter_Req:(NSString *)dialogId
                  options:(NSDictionary *)options;

- (void)MAP_Close_Req:(NSString *)dialogId
              options:(NSDictionary *)options;

- (void) MAP_Invoke:(UMASN1Object *)param
             dialog:(NSString *)dialogId
           invokeId:(int64_t)xinvokeId
           linkedId:(int64_t)xlinkedId
             opCode:(UMLayerGSMMAP_OpCode *)xopcode
               last:(int64_t)last
            options:(NSDictionary *)options;

-(void) MAP_U_Abort_Req:(NSString *)dialogId
                options:(NSDictionary *)options;

#if 0


-(void) MAP_Delimiter_Req:(NSString *)dialogId;

- (void) MAP_Open:(UMASN1Object *)param
             user:(id<UMLayerGSMMAP_UserProtocol>)user
           dialog:(NSString *)dialogId
          variant:(UMTCAP_Variant)xvariant
         invokeId:(int64_t)xinvokeId
         linkedId:(int64_t)linkedId
      opCodeValue:(int64_t)xoperation
     opCodeFamily:(int64_t)xof
   opCodeNational:(int64_t)opnat
             last:(int64_t)last;

- (void) MAP_Invoke:(UMASN1Object *)param
             dialog:(NSString *)dialogId
            variant:(UMTCAP_Variant)xvariant
           invokeId:(int64_t)xinvokeId
           linkedId:(int64_t)linkedId
        opCodeValue:(int64_t)xoperation
       opCodeFamily:(int64_t)xof
     opCodeNational:(int64_t)opnat
               last:(int64_t)last;

- (void) MAP_ReturnResult:(UMASN1Object *)param
                   dialog:(NSString *)dialogId
                  variant:(UMTCAP_Variant)xvariant
                 invokeId:(int64_t)xinvokeId
                 linkedId:(int64_t)linkedId
              opCodeValue:(int64_t)xoperation
             opCodeFamily:(int64_t)xof
           opCodeNational:(int64_t)opnat
                     last:(int64_t)last;


#endif

@end

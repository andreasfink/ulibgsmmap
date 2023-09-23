//
//  UMGSMMAP_PDP_Context.h
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

#import <ulibgsmmap/UMGSMMAP_ContextId.h>
#import <ulibgsmmap/UMGSMMAP_PDP_Type.h>
#import <ulibgsmmap/UMGSMMAP_PDP_Address.h>
#import <ulibgsmmap/UMGSMMAP_QoS_Subscribed.h>
#import <ulibgsmmap/UMGSMMAP_APN.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>

@interface UMGSMMAP_PDP_Context : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_ContextId *pdp_ContextId;
	UMGSMMAP_PDP_Type *pdp_Type;
	UMGSMMAP_PDP_Address *pdp_Address;
	UMGSMMAP_QoS_Subscribed *qos_Subscribed;
	BOOL vplmnAddressAllowed;
	UMGSMMAP_APN *apn;
	UMGSMMAP_ExtensionContainer *extensionContainer;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_ContextId *pdp_ContextId;
@property(readwrite,strong)	UMGSMMAP_PDP_Type *pdp_Type;
@property(readwrite,strong)	UMGSMMAP_PDP_Address *pdp_Address;
@property(readwrite,strong)	UMGSMMAP_QoS_Subscribed *qos_Subscribed;
@property(readwrite,assign)	BOOL vplmnAddressAllowed;
@property(readwrite,strong)	UMGSMMAP_APN *apn;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;


- (void)processBeforeEncode;
- (UMGSMMAP_PDP_Context *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

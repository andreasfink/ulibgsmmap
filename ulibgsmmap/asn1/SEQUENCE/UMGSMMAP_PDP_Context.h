//
//  UMGSMMAP_PDP_Context.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_ContextId.h"
#import "UMGSMMAP_PDP_Type.h"
#import "UMGSMMAP_PDP_Address.h"
#import "UMGSMMAP_QoS_Subscribed.h"
#import "UMGSMMAP_APN.h"
#import "UMGSMMAP_ExtensionContainer.h"

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
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

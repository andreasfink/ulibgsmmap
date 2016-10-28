//
//  UMGSMMAP_T_BcsmCamelTDPData.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_T_BcsmTriggerDetectionPoint.h"
#import "UMGSMMAP_ServiceKey.h"
#import "UMGSMMAP_ISDN_AddressString.h"
#import "UMGSMMAP_DefaultCallHandling.h"
#import "UMGSMMAP_ExtensionContainer.h"

@interface UMGSMMAP_T_BcsmCamelTDPData : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_T_BcsmTriggerDetectionPoint *t_BcsmTriggerDetectionPoint;
	UMGSMMAP_ServiceKey *serviceKey;
	UMGSMMAP_ISDN_AddressString *gsmSCF_Address;
	UMGSMMAP_DefaultCallHandling *defaultCallHandling;
	UMGSMMAP_ExtensionContainer *extensionContainer;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_T_BcsmTriggerDetectionPoint *t_BcsmTriggerDetectionPoint;
@property(readwrite,strong)	UMGSMMAP_ServiceKey *serviceKey;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *gsmSCF_Address;
@property(readwrite,strong)	UMGSMMAP_DefaultCallHandling *defaultCallHandling;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;


- (void)processBeforeEncode;
- (UMGSMMAP_T_BcsmCamelTDPData *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

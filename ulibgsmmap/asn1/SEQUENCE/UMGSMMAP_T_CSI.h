//
//  UMGSMMAP_T_CSI.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_T_BcsmCamelTDPDataList.h"
#import "UMGSMMAP_ExtensionContainer.h"
#import "UMGSMMAP_CamelCapabilityHandling.h"

@interface UMGSMMAP_T_CSI : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_T_BcsmCamelTDPDataList *t_BcsmCamelTDPDataList;
	UMGSMMAP_ExtensionContainer *extensionContainer;
	UMGSMMAP_CamelCapabilityHandling *camelCapabilityHandling;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_T_BcsmCamelTDPDataList *t_BcsmCamelTDPDataList;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,strong)	UMGSMMAP_CamelCapabilityHandling *camelCapabilityHandling;


- (void)processBeforeEncode;
- (UMGSMMAP_T_CSI *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

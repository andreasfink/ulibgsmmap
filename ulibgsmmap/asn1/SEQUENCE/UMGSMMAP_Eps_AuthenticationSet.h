//
//  UMGSMMAP_Eps_AuthenticationSet.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_ExtensionContainer.h"

@interface UMGSMMAP_Eps_AuthenticationSet : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMASN1OctetString *rand;
	UMASN1OctetString *xres;
	UMASN1OctetString *autn;
	UMASN1OctetString *kasme;
	UMGSMMAP_ExtensionContainer *extensionContainer;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMASN1OctetString *rand;
@property(readwrite,strong)	UMASN1OctetString *xres;
@property(readwrite,strong)	UMASN1OctetString *autn;
@property(readwrite,strong)	UMASN1OctetString *kasme;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;


- (void)processBeforeEncode;
- (UMGSMMAP_Eps_AuthenticationSet *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

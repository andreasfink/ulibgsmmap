//
//  UMGSMMAP_VLR_Capability.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_SupportedCamelPhases.h"
#import "UMGSMMAP_ExtensionContainer.h"

@interface UMGSMMAP_VLR_Capability : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_SupportedCamelPhases *supportedCamelPhases;
	UMGSMMAP_ExtensionContainer *extensionContainer;
	BOOL solsaSupportIndicator;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_SupportedCamelPhases *supportedCamelPhases;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,assign)	BOOL solsaSupportIndicator;


- (void)processBeforeEncode;
- (UMGSMMAP_VLR_Capability *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;
- (UMGSMMAP_VLR_Capability *)initWithString:(NSString *)s;
@end

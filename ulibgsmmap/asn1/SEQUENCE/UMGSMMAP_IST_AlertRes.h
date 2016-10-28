//
//  UMGSMMAP_IST_AlertRes.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_ExtensionContainer.h"

@interface UMGSMMAP_IST_AlertRes : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMASN1Integer *istAlertTimer;
	BOOL istInformationWithdraw;
	UMASN1Boolean *callTerminationIndicator;
	UMGSMMAP_ExtensionContainer *extensionContainer;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMASN1Integer *istAlertTimer;
@property(readwrite,assign)	BOOL istInformationWithdraw;
@property(readwrite,strong)	UMASN1Boolean *callTerminationIndicator;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;


- (void)processBeforeEncode;
- (UMGSMMAP_IST_AlertRes *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

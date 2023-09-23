//
//  UMGSMMAP_UnknownSubscriberParam.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>
#import <ulibgsmmap/UMGSMMAP_UnknownSubscriberDiagnostic.h>

@interface UMGSMMAP_UnknownSubscriberParam : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_ExtensionContainer *extensionContainer;
	UMGSMMAP_UnknownSubscriberDiagnostic *unknownSubscriberDiagnostic;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,strong)	UMGSMMAP_UnknownSubscriberDiagnostic *unknownSubscriberDiagnostic;


- (void)processBeforeEncode;
- (UMGSMMAP_UnknownSubscriberParam *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

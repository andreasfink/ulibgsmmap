//
//  UMGSMMAP_SendAuthenticationInfoRes.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

#import <ulibgsmmap/UMGSMMAP_AuthenticationSetList.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>
#import <ulibgsmmap/UMGSMMAP_Eps_AuthenticationSetList.h>

@interface UMGSMMAP_SendAuthenticationInfoRes : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_AuthenticationSetList *authenticationSetList;
	UMGSMMAP_ExtensionContainer *extensionContainer;
	UMGSMMAP_Eps_AuthenticationSetList *eps_AuthenticationSetList;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_AuthenticationSetList *authenticationSetList;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,strong)	UMGSMMAP_Eps_AuthenticationSetList *eps_AuthenticationSetList;


- (void)processBeforeEncode;
- (UMGSMMAP_SendAuthenticationInfoRes *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

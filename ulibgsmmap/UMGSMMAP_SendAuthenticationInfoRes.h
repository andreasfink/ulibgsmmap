//
//  UMGSMMAP_SendAuthenticationInfoRes.h
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_AuthenticationSetList.h"
#import "UMGSMMAP_ExtensionContainer.h"
#import "UMGSMMAP_Eps_AuthenticationSetList.h"

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
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end
 

//
//  UMGSMMAP_ExtensionContainer.h
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

#import "UMGSMMAP_PrivateExtensionList.h"
#import "UMGSMMAP_PCS_Extensions.h"

@interface UMGSMMAP_ExtensionContainer : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_PrivateExtensionList *privateExtensionList;
	UMGSMMAP_PCS_Extensions *pcs_Extensions;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_PrivateExtensionList *privateExtensionList;
@property(readwrite,strong)	UMGSMMAP_PCS_Extensions *pcs_Extensions;


- (void)processBeforeEncode;
- (UMGSMMAP_ExtensionContainer *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

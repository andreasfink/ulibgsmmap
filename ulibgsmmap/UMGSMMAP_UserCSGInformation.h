//
//  UMGSMMAP_UserCSGInformation.h
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

#import "UMGSMMAP_CSG_Id.h"
#import "UMGSMMAP_ExtensionContainer.h"

@interface UMGSMMAP_UserCSGInformation : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_CSG_Id *csg_Id;
	UMGSMMAP_ExtensionContainer *extensionContainer;
	UMASN1OctetString *accessMode;
	UMASN1OctetString *cmi;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_CSG_Id *csg_Id;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,strong)	UMASN1OctetString *accessMode;
@property(readwrite,strong)	UMASN1OctetString *cmi;


- (void)processBeforeEncode;
- (UMGSMMAP_UserCSGInformation *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

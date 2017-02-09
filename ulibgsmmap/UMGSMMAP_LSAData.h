//
//  UMGSMMAP_LSAData.h
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

#import "UMGSMMAP_LSAIdentity.h"
#import "UMGSMMAP_LSAAttributes.h"
#import "UMGSMMAP_ExtensionContainer.h"

@interface UMGSMMAP_LSAData : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_LSAIdentity *lsaIdentity;
	UMGSMMAP_LSAAttributes *lsaAttributes;
	BOOL lsaActiveModeIndicator;
	UMGSMMAP_ExtensionContainer *extensionContainer;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_LSAIdentity *lsaIdentity;
@property(readwrite,strong)	UMGSMMAP_LSAAttributes *lsaAttributes;
@property(readwrite,assign)	BOOL lsaActiveModeIndicator;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;


- (void)processBeforeEncode;
- (UMGSMMAP_LSAData *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

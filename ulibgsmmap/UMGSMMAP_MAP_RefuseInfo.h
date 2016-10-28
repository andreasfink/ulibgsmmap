//
//  UMGSMMAP_MAP_RefuseInfo.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibasn1/ulibasn1.h>
#import <ulibtcap/ulibtcap.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_Reason.h"
#import "UMGSMMAP_ExtensionContainer.h"


@interface UMGSMMAP_MAP_RefuseInfo : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_Reason *reason;
    UMGSMMAP_ExtensionContainer *extensionContainer;
    UMTCAP_asn1_objectIdentifier *alternativeApplicationContext;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_Reason *reason;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,strong) UMTCAP_asn1_objectIdentifier *alternativeApplicationContext;

- (void)processBeforeEncode;
- (UMGSMMAP_MAP_RefuseInfo *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

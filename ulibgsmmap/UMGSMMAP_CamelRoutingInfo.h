//
//  UMGSMMAP_CamelRoutingInfo.h
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

#import "UMGSMMAP_ForwardingData.h"
#import "UMGSMMAP_GmscCamelSubscriptionInfo.h"
#import "UMGSMMAP_ExtensionContainer.h"

@interface UMGSMMAP_CamelRoutingInfo : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_ForwardingData *forwardingData;
	UMGSMMAP_GmscCamelSubscriptionInfo *gmscCamelSubscriptionInfo;
	UMGSMMAP_ExtensionContainer *extensionContainer;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_ForwardingData *forwardingData;
@property(readwrite,strong)	UMGSMMAP_GmscCamelSubscriptionInfo *gmscCamelSubscriptionInfo;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;


- (void)processBeforeEncode;
- (UMGSMMAP_CamelRoutingInfo *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

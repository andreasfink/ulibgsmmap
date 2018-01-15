//
//  UMGSMMAP_ForwardingData.h
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

#import "UMGSMMAP_ISDN_AddressString.h"
#import "UMGSMMAP_ISDN_SubaddressString.h"
#import "UMGSMMAP_ForwardingOptions.h"
#import "UMGSMMAP_ExtensionContainer.h"

@interface UMGSMMAP_ForwardingData : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_ISDN_AddressString *forwardedToNumber;
	UMGSMMAP_ISDN_SubaddressString *forwardedToSubaddress;
	UMGSMMAP_ForwardingOptions *forwardingOptions;
	UMGSMMAP_ExtensionContainer *extensionContainer;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *forwardedToNumber;
@property(readwrite,strong)	UMGSMMAP_ISDN_SubaddressString *forwardedToSubaddress;
@property(readwrite,strong)	UMGSMMAP_ForwardingOptions *forwardingOptions;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;


- (void)processBeforeEncode;
- (UMGSMMAP_ForwardingData *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

//
//  UMGSMMAP_O_CSI.h
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

#import <ulibgsmmap/UMGSMMAP_O_BcsmCamelTDPDataList.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>
#import <ulibgsmmap/UMGSMMAP_CamelCapabilityHandling.h>

@interface UMGSMMAP_O_CSI : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_O_BcsmCamelTDPDataList *o_BcsmCamelTDPDataList;
	UMGSMMAP_ExtensionContainer *extensionContainer;
	UMGSMMAP_CamelCapabilityHandling *camelCapabilityHandling;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_O_BcsmCamelTDPDataList *o_BcsmCamelTDPDataList;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,strong)	UMGSMMAP_CamelCapabilityHandling *camelCapabilityHandling;


- (void)processBeforeEncode;
- (UMGSMMAP_O_CSI *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

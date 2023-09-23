//
//  UMGSMMAP_VlrCamelSubscriptionInfo.h
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

#import <ulibgsmmap/UMGSMMAP_O_CSI.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>
#import <ulibgsmmap/UMGSMMAP_SS_CSI.h>
#import <ulibgsmmap/UMGSMMAP_O_BcsmCamelTDPCriteriaList.h>

@interface UMGSMMAP_VlrCamelSubscriptionInfo : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_O_CSI *o_CSI;
	UMGSMMAP_ExtensionContainer *extensionContainer;
	UMGSMMAP_SS_CSI *ss_CSI;
	UMGSMMAP_O_BcsmCamelTDPCriteriaList *o_BcsmCamelTDP_CriteriaList;
	BOOL tif_CSI;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_O_CSI *o_CSI;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,strong)	UMGSMMAP_SS_CSI *ss_CSI;
@property(readwrite,strong)	UMGSMMAP_O_BcsmCamelTDPCriteriaList *o_BcsmCamelTDP_CriteriaList;
@property(readwrite,assign)	BOOL tif_CSI;


- (void)processBeforeEncode;
- (UMGSMMAP_VlrCamelSubscriptionInfo *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

- (UMGSMMAP_VlrCamelSubscriptionInfo *)initWithString:(NSString *)str;

@end

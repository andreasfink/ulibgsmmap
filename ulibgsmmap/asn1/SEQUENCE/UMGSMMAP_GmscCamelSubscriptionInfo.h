//
//  UMGSMMAP_GmscCamelSubscriptionInfo.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

#import <ulibgsmmap/UMGSMMAP_T_CSI.h>
#import <ulibgsmmap/UMGSMMAP_O_CSI.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>
#import <ulibgsmmap/UMGSMMAP_O_BcsmCamelTDPCriteriaList.h>

@interface UMGSMMAP_GmscCamelSubscriptionInfo : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_T_CSI *t_CSI;
	UMGSMMAP_O_CSI *o_CSI;
	UMGSMMAP_ExtensionContainer *extensionContainer;
	UMGSMMAP_O_BcsmCamelTDPCriteriaList *o_BcsmCamelTDP_CriteriaList;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_T_CSI *t_CSI;
@property(readwrite,strong)	UMGSMMAP_O_CSI *o_CSI;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,strong)	UMGSMMAP_O_BcsmCamelTDPCriteriaList *o_BcsmCamelTDP_CriteriaList;


- (void)processBeforeEncode;
- (UMGSMMAP_GmscCamelSubscriptionInfo *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

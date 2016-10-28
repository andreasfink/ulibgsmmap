//
//  UMGSMMAP_VlrCamelSubscriptionInfo.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_O_CSI.h"
#import "UMGSMMAP_ExtensionContainer.h"
#import "UMGSMMAP_SS_CSI.h"
#import "UMGSMMAP_O_BcsmCamelTDPCriteriaList.h"

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
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

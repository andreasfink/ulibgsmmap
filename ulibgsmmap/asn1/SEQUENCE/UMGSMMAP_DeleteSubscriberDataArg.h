//
//  UMGSMMAP_DeleteSubscriberDataArg.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_IMSI.h"
#import "UMGSMMAP_BasicServiceList.h"
#import "UMGSMMAP_SS_List.h"
#import "UMGSMMAP_ZoneCode.h"
#import "UMGSMMAP_ExtensionContainer.h"
#import "UMGSMMAP_GPRSSubscriptionDataWithdraw.h"
#import "UMGSMMAP_LSAInformationWithdraw.h"

@interface UMGSMMAP_DeleteSubscriberDataArg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_IMSI *imsi;
	UMGSMMAP_BasicServiceList *basicServiceList;
	UMGSMMAP_SS_List *ss_List;
	BOOL roamingRestrictionDueToUnsupportedFeature;
	UMGSMMAP_ZoneCode *regionalSubscriptionIdentifier;
	BOOL vbsGroupIndication;
	BOOL vgcsGroupIndication;
	BOOL camelSubscriptionInfoWithdraw;
	UMGSMMAP_ExtensionContainer *extensionContainer;
	UMGSMMAP_GPRSSubscriptionDataWithdraw *gprsSubscriptionDataWithdraw;
	BOOL roamingRestrictedInSgsnDueToUnsuppportedFeature;
	UMGSMMAP_LSAInformationWithdraw *lsaInformationWithdraw;
	BOOL gmlc_ListWithdraw;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_IMSI *imsi;
@property(readwrite,strong)	UMGSMMAP_BasicServiceList *basicServiceList;
@property(readwrite,strong)	UMGSMMAP_SS_List *ss_List;
@property(readwrite,assign)	BOOL roamingRestrictionDueToUnsupportedFeature;
@property(readwrite,strong)	UMGSMMAP_ZoneCode *regionalSubscriptionIdentifier;
@property(readwrite,assign)	BOOL vbsGroupIndication;
@property(readwrite,assign)	BOOL vgcsGroupIndication;
@property(readwrite,assign)	BOOL camelSubscriptionInfoWithdraw;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,strong)	UMGSMMAP_GPRSSubscriptionDataWithdraw *gprsSubscriptionDataWithdraw;
@property(readwrite,assign)	BOOL roamingRestrictedInSgsnDueToUnsuppportedFeature;
@property(readwrite,strong)	UMGSMMAP_LSAInformationWithdraw *lsaInformationWithdraw;
@property(readwrite,assign)	BOOL gmlc_ListWithdraw;


- (void)processBeforeEncode;
- (UMGSMMAP_DeleteSubscriberDataArg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

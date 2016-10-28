//
//  UMGSMMAP_InsertSubscriberDataArg.h
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

#import "UMGSMMAP_IMSI.h"
#import "UMGSMMAP_ISDN_AddressString.h"
#import "UMGSMMAP_Category.h"
#import "UMGSMMAP_SubscriberStatus.h"
#import "UMGSMMAP_BearerServiceList.h"
#import "UMGSMMAP_TeleserviceList.h"
#import "UMGSMMAP_Ext_SS_InfoList.h"
#import "UMGSMMAP_ODB_Data.h"
#import "UMGSMMAP_ZoneCodeList.h"
#import "UMGSMMAP_VBSDataList.h"
#import "UMGSMMAP_VGCSDataList.h"
#import "UMGSMMAP_VlrCamelSubscriptionInfo.h"
#import "UMGSMMAP_ExtensionContainer.h"
#import "UMGSMMAP_NAEA_PreferredCI.h"
#import "UMGSMMAP_GPRSSubscriptionData.h"
#import "UMGSMMAP_NetworkAccessMode.h"
#import "UMGSMMAP_LSAInformation.h"
#import "UMGSMMAP_LCSInformation.h"

@interface UMGSMMAP_InsertSubscriberDataArg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_IMSI *imsi;
	UMGSMMAP_ISDN_AddressString *msisdn;
	UMGSMMAP_Category *category;
	UMGSMMAP_SubscriberStatus *subscriberStatus;
	UMGSMMAP_BearerServiceList *bearerServiceList;
	UMGSMMAP_TeleserviceList *teleserviceList;
	UMGSMMAP_Ext_SS_InfoList *provisionedSS;
	UMGSMMAP_ODB_Data *odb_Data;
	BOOL roamingRestrictionDueToUnsupportedFeature;
	UMGSMMAP_ZoneCodeList *regionalSubscriptionData;
	UMGSMMAP_VBSDataList *vbsSubscriptionData;
	UMGSMMAP_VGCSDataList *vgcsSubscriptionData;
	UMGSMMAP_VlrCamelSubscriptionInfo *vlrCamelSubscriptionInfo;
	UMGSMMAP_ExtensionContainer *extensionContainer;
	UMGSMMAP_NAEA_PreferredCI *naea_PreferredCI;
	UMGSMMAP_GPRSSubscriptionData *gprsSubscriptionData;
	BOOL roamingRestrictedInSgsnDueToUnsupportedFeature;
	UMGSMMAP_NetworkAccessMode *networkAccessMode;
	UMGSMMAP_LSAInformation *lsaInformation;
	BOOL lmu_Indicator;
	UMGSMMAP_LCSInformation *lcsInformation;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_IMSI *imsi;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *msisdn;
@property(readwrite,strong)	UMGSMMAP_Category *category;
@property(readwrite,strong)	UMGSMMAP_SubscriberStatus *subscriberStatus;
@property(readwrite,strong)	UMGSMMAP_BearerServiceList *bearerServiceList;
@property(readwrite,strong)	UMGSMMAP_TeleserviceList *teleserviceList;
@property(readwrite,strong)	UMGSMMAP_Ext_SS_InfoList *provisionedSS;
@property(readwrite,strong)	UMGSMMAP_ODB_Data *odb_Data;
@property(readwrite,assign)	BOOL roamingRestrictionDueToUnsupportedFeature;
@property(readwrite,strong)	UMGSMMAP_ZoneCodeList *regionalSubscriptionData;
@property(readwrite,strong)	UMGSMMAP_VBSDataList *vbsSubscriptionData;
@property(readwrite,strong)	UMGSMMAP_VGCSDataList *vgcsSubscriptionData;
@property(readwrite,strong)	UMGSMMAP_VlrCamelSubscriptionInfo *vlrCamelSubscriptionInfo;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,strong)	UMGSMMAP_NAEA_PreferredCI *naea_PreferredCI;
@property(readwrite,strong)	UMGSMMAP_GPRSSubscriptionData *gprsSubscriptionData;
@property(readwrite,assign)	BOOL roamingRestrictedInSgsnDueToUnsupportedFeature;
@property(readwrite,strong)	UMGSMMAP_NetworkAccessMode *networkAccessMode;
@property(readwrite,strong)	UMGSMMAP_LSAInformation *lsaInformation;
@property(readwrite,assign)	BOOL lmu_Indicator;
@property(readwrite,strong)	UMGSMMAP_LCSInformation *lcsInformation;


- (void)processBeforeEncode;
- (UMGSMMAP_InsertSubscriberDataArg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

//
//  UMGSMMAP_InsertSubscriberDataArg.h
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

#import <ulibgsmmap/UMGSMMAP_IMSI.h>
#import <ulibgsmmap/UMGSMMAP_ISDN_AddressString.h>
#import <ulibgsmmap/UMGSMMAP_Category.h>
#import <ulibgsmmap/UMGSMMAP_SubscriberStatus.h>
#import <ulibgsmmap/UMGSMMAP_BearerServiceList.h>
#import <ulibgsmmap/UMGSMMAP_TeleserviceList.h>
#import <ulibgsmmap/UMGSMMAP_Ext_SS_InfoList.h>
#import <ulibgsmmap/UMGSMMAP_ODB_Data.h>
#import <ulibgsmmap/UMGSMMAP_ZoneCodeList.h>
#import <ulibgsmmap/UMGSMMAP_VBSDataList.h>
#import <ulibgsmmap/UMGSMMAP_VGCSDataList.h>
#import <ulibgsmmap/UMGSMMAP_VlrCamelSubscriptionInfo.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>
#import <ulibgsmmap/UMGSMMAP_NAEA_PreferredCI.h>
#import <ulibgsmmap/UMGSMMAP_GPRSSubscriptionData.h>
#import <ulibgsmmap/UMGSMMAP_NetworkAccessMode.h>
#import <ulibgsmmap/UMGSMMAP_LSAInformation.h>
#import <ulibgsmmap/UMGSMMAP_LCSInformation.h>
#import <ulibgsmmap/UMGSMMAP_AccessRestrictionData.h>

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
    /* from release 14 */
    UMGSMMAP_AccessRestrictionData *_accessRestrictionData;
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
@property(readwrite,strong) UMGSMMAP_AccessRestrictionData *accessRestrictionData;

- (void)processBeforeEncode;
- (UMGSMMAP_InsertSubscriberDataArg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

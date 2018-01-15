//
//  UMGSMMAP_SubscriberData.h
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

@interface UMGSMMAP_SubscriberData : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
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
}
@property(readwrite,strong)    NSString *operationName;

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


- (void)processBeforeEncode;
- (UMGSMMAP_SubscriberData *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

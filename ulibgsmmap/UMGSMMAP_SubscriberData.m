//
//  UMGSMMAP_SubscriberData.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_SubscriberData.h>

@implementation UMGSMMAP_SubscriberData


@synthesize	operationName;
@synthesize	msisdn;
@synthesize	category;
@synthesize	subscriberStatus;
@synthesize	bearerServiceList;
@synthesize	teleserviceList;
@synthesize	provisionedSS;
@synthesize	odb_Data;
@synthesize	roamingRestrictionDueToUnsupportedFeature;
@synthesize	regionalSubscriptionData;
@synthesize	vbsSubscriptionData;
@synthesize	vgcsSubscriptionData;
@synthesize	vlrCamelSubscriptionInfo;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(msisdn)
	{
		msisdn.asn1_tag.tagNumber = 1;
		msisdn.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:msisdn];
	}
	if(category)
	{
		category.asn1_tag.tagNumber = 2;
		category.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:category];
	}
	if(subscriberStatus)
	{
		subscriberStatus.asn1_tag.tagNumber = 3;
		subscriberStatus.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:subscriberStatus];
	}
	if(bearerServiceList)
	{
		bearerServiceList.asn1_tag.tagNumber = 4;
		bearerServiceList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:bearerServiceList];
	}
	if(teleserviceList)
	{
		teleserviceList.asn1_tag.tagNumber = 6;
		teleserviceList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:teleserviceList];
	}
	if(provisionedSS)
	{
		provisionedSS.asn1_tag.tagNumber = 7;
		provisionedSS.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:provisionedSS];
	}
	if(odb_Data)
	{
		odb_Data.asn1_tag.tagNumber = 8;
		odb_Data.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:odb_Data];
	}
	if(roamingRestrictionDueToUnsupportedFeature)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 9;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:n];
	}
	if(regionalSubscriptionData)
	{
		regionalSubscriptionData.asn1_tag.tagNumber = 10;
		regionalSubscriptionData.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:regionalSubscriptionData];
	}
	if(vbsSubscriptionData)
	{
		vbsSubscriptionData.asn1_tag.tagNumber = 11;
		vbsSubscriptionData.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:vbsSubscriptionData];
	}
	if(vgcsSubscriptionData)
	{
		vgcsSubscriptionData.asn1_tag.tagNumber = 12;
		vgcsSubscriptionData.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:vgcsSubscriptionData];
	}
	if(vlrCamelSubscriptionInfo)
	{
		vlrCamelSubscriptionInfo.asn1_tag.tagNumber = 13;
		vlrCamelSubscriptionInfo.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:vlrCamelSubscriptionInfo];
	}
}


- (UMGSMMAP_SubscriberData *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		msisdn = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		category = [[UMGSMMAP_Category alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		subscriberStatus = [[UMGSMMAP_SubscriberStatus alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		bearerServiceList = [[UMGSMMAP_BearerServiceList alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 6) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		teleserviceList = [[UMGSMMAP_TeleserviceList alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 7) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		provisionedSS = [[UMGSMMAP_Ext_SS_InfoList alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 8) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		odb_Data = [[UMGSMMAP_ODB_Data alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 9) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		roamingRestrictionDueToUnsupportedFeature = YES;
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 10) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		regionalSubscriptionData = [[UMGSMMAP_ZoneCodeList alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 11) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		vbsSubscriptionData = [[UMGSMMAP_VBSDataList alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 12) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		vgcsSubscriptionData = [[UMGSMMAP_VGCSDataList alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 13) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		vlrCamelSubscriptionInfo = [[UMGSMMAP_VlrCamelSubscriptionInfo alloc]initWithASN1Object:o context:context];
		//o = [self getObjectAtPosition:p++];
	}
	return self;
}

- (NSString *) objectName
{
	return @"SubscriberData";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(msisdn)
	{
		dict[@"msisdn"] = msisdn.objectValue;
	}
	if(category)
	{
		dict[@"category"] = category.objectValue;
	}
	if(subscriberStatus)
	{
		dict[@"subscriberStatus"] = subscriberStatus.objectValue;
	}
	if(bearerServiceList)
	{
		dict[@"bearerServiceList"] = bearerServiceList.objectValue;
	}
	if(teleserviceList)
	{
		dict[@"teleserviceList"] = teleserviceList.objectValue;
	}
	if(provisionedSS)
	{
		dict[@"provisionedSS"] = provisionedSS.objectValue;
	}
	if(odb_Data)
	{
		dict[@"odb-Data"] = odb_Data.objectValue;
	}
	if(roamingRestrictionDueToUnsupportedFeature)
	{
		dict[@"roamingRestrictionDueToUnsupportedFeature"] = @(YES);
	}
	if(regionalSubscriptionData)
	{
		dict[@"regionalSubscriptionData"] = regionalSubscriptionData.objectValue;
	}
	if(vbsSubscriptionData)
	{
		dict[@"vbsSubscriptionData"] = vbsSubscriptionData.objectValue;
	}
	if(vgcsSubscriptionData)
	{
		dict[@"vgcsSubscriptionData"] = vgcsSubscriptionData.objectValue;
	}
	if(vlrCamelSubscriptionInfo)
	{
		dict[@"vlrCamelSubscriptionInfo"] = vlrCamelSubscriptionInfo.objectValue;
	}
	return dict;
}

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}


@end


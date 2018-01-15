//
//  UMGSMMAP_InsertSubscriberDataArg.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_InsertSubscriberDataArg.h"

@implementation UMGSMMAP_InsertSubscriberDataArg


@synthesize	operationName;
@synthesize	imsi;
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
@synthesize	extensionContainer;
@synthesize	naea_PreferredCI;
@synthesize	gprsSubscriptionData;
@synthesize	roamingRestrictedInSgsnDueToUnsupportedFeature;
@synthesize	networkAccessMode;
@synthesize	lsaInformation;
@synthesize	lmu_Indicator;
@synthesize	lcsInformation;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(imsi)
	{
		imsi.asn1_tag.tagNumber = 0;
		imsi.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:imsi];
	}
	if(msisdn)
	{
		msisdn.asn1_tag.tagNumber = 1;
		msisdn.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:msisdn];
	}
	if(category)
	{
		category.asn1_tag.tagNumber = 2;
		category.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:category];
	}
	if(subscriberStatus)
	{
		subscriberStatus.asn1_tag.tagNumber = 3;
		subscriberStatus.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:subscriberStatus];
	}
	if(bearerServiceList)
	{
		bearerServiceList.asn1_tag.tagNumber = 4;
		bearerServiceList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:bearerServiceList];
	}
	if(teleserviceList)
	{
		teleserviceList.asn1_tag.tagNumber = 6;
		teleserviceList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:teleserviceList];
	}
	if(provisionedSS)
	{
		provisionedSS.asn1_tag.tagNumber = 7;
		provisionedSS.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:provisionedSS];
	}
	if(odb_Data)
	{
		odb_Data.asn1_tag.tagNumber = 8;
		odb_Data.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:odb_Data];
	}
	if(roamingRestrictionDueToUnsupportedFeature)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 9;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(regionalSubscriptionData)
	{
		regionalSubscriptionData.asn1_tag.tagNumber = 10;
		regionalSubscriptionData.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:regionalSubscriptionData];
	}
	if(vbsSubscriptionData)
	{
		vbsSubscriptionData.asn1_tag.tagNumber = 11;
		vbsSubscriptionData.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:vbsSubscriptionData];
	}
	if(vgcsSubscriptionData)
	{
		vgcsSubscriptionData.asn1_tag.tagNumber = 12;
		vgcsSubscriptionData.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:vgcsSubscriptionData];
	}
	if(vlrCamelSubscriptionInfo)
	{
		vlrCamelSubscriptionInfo.asn1_tag.tagNumber = 13;
		vlrCamelSubscriptionInfo.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:vlrCamelSubscriptionInfo];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 14;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
	if(naea_PreferredCI)
	{
		naea_PreferredCI.asn1_tag.tagNumber = 15;
		naea_PreferredCI.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:naea_PreferredCI];
	}
	if(gprsSubscriptionData)
	{
		gprsSubscriptionData.asn1_tag.tagNumber = 16;
		gprsSubscriptionData.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:gprsSubscriptionData];
	}
	if(roamingRestrictedInSgsnDueToUnsupportedFeature)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 23;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(networkAccessMode)
	{
		networkAccessMode.asn1_tag.tagNumber = 24;
		networkAccessMode.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:networkAccessMode];
	}
	if(lsaInformation)
	{
		lsaInformation.asn1_tag.tagNumber = 25;
		lsaInformation.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:lsaInformation];
	}
	if(lmu_Indicator)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 21;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(lcsInformation)
	{
		lcsInformation.asn1_tag.tagNumber = 22;
		lcsInformation.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:lcsInformation];
	}
}


- (UMGSMMAP_InsertSubscriberDataArg *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		imsi = [[UMGSMMAP_IMSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
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
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 14) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if((o) && (o.asn1_tag.tagNumber == 15) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			naea_PreferredCI = [[UMGSMMAP_NAEA_PreferredCI alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 16) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			gprsSubscriptionData = [[UMGSMMAP_GPRSSubscriptionData alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 23) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			roamingRestrictedInSgsnDueToUnsupportedFeature = YES;
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 24) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			networkAccessMode = [[UMGSMMAP_NetworkAccessMode alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 25) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			lsaInformation = [[UMGSMMAP_LSAInformation alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 21) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			lmu_Indicator = YES;
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 22) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			lcsInformation = [[UMGSMMAP_LCSInformation alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
        else
        {
            o = [self getObjectAtPosition:p++];
        }
	}
	return self;
}

- (NSString *) objectName
{
	return @"InsertSubscriberDataArg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(imsi)
	{
		dict[@"imsi"] = imsi.objectValue;
	}
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
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(naea_PreferredCI)
	{
		dict[@"naea-PreferredCI"] = naea_PreferredCI.objectValue;
	}
	if(gprsSubscriptionData)
	{
		dict[@"gprsSubscriptionData"] = gprsSubscriptionData.objectValue;
	}
	if(roamingRestrictedInSgsnDueToUnsupportedFeature)
	{
		dict[@"roamingRestrictedInSgsnDueToUnsupportedFeature"] = @(YES);
	}
	if(networkAccessMode)
	{
		dict[@"networkAccessMode"] = networkAccessMode.objectValue;
	}
	if(lsaInformation)
	{
		dict[@"lsaInformation"] = lsaInformation.objectValue;
	}
	if(lmu_Indicator)
	{
		dict[@"lmu-Indicator"] = @(YES);
	}
	if(lcsInformation)
	{
		dict[@"lcsInformation"] = lcsInformation.objectValue;
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


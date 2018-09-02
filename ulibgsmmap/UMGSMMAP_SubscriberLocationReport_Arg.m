//
//  UMGSMMAP_SubscriberLocationReport_Arg.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_SubscriberLocationReport_Arg.h"

@implementation UMGSMMAP_SubscriberLocationReport_Arg


@synthesize	operationName;
@synthesize	lcs_Event;
@synthesize	lcs_ClientID;
@synthesize	lcsLocationInfo;
@synthesize	msisdn;
@synthesize	imsi;
@synthesize	imei;
@synthesize	na_ESRD;
@synthesize	na_ESRK;
@synthesize	locationEstimate;
@synthesize	ageOfLocationEstimate;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(lcs_Event)
	{
		[_asn1_list addObject:lcs_Event];
	}
	if(lcs_ClientID)
	{
		[_asn1_list addObject:lcs_ClientID];
	}
	if(lcsLocationInfo)
	{
		[_asn1_list addObject:lcsLocationInfo];
	}
	if(msisdn)
	{
		msisdn.asn1_tag.tagNumber = 0;
		msisdn.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:msisdn];
	}
	if(imsi)
	{
		imsi.asn1_tag.tagNumber = 1;
		imsi.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:imsi];
	}
	if(imei)
	{
		imei.asn1_tag.tagNumber = 2;
		imei.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:imei];
	}
	if(na_ESRD)
	{
		na_ESRD.asn1_tag.tagNumber = 3;
		na_ESRD.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:na_ESRD];
	}
	if(na_ESRK)
	{
		na_ESRK.asn1_tag.tagNumber = 4;
		na_ESRK.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:na_ESRK];
	}
	if(locationEstimate)
	{
		locationEstimate.asn1_tag.tagNumber = 5;
		locationEstimate.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:locationEstimate];
	}
	if(ageOfLocationEstimate)
	{
		ageOfLocationEstimate.asn1_tag.tagNumber = 6;
		ageOfLocationEstimate.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:ageOfLocationEstimate];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 7;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_SubscriberLocationReport_Arg *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		lcs_Event = [[UMGSMMAP_LCS_Event alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		lcs_ClientID = [[UMGSMMAP_LCS_ClientID alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		lcsLocationInfo = [[UMGSMMAP_LCSLocationInfo alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		msisdn = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		imsi = [[UMGSMMAP_IMSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		imei = [[UMGSMMAP_IMEI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		na_ESRD = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		na_ESRK = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		locationEstimate = [[UMGSMMAP_Ext_GeographicalInformation alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 6) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ageOfLocationEstimate = [[UMGSMMAP_AgeOfLocationInformation alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 7) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
        /* ... */
        o = [self getObjectAtPosition:p++];
    }
	return self;
}

- (NSString *) objectName
{
	return @"SubscriberLocationReport-Arg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(lcs_Event)
	{
		dict[@"lcs-Event"] = lcs_Event.objectValue;
	}
	if(lcs_ClientID)
	{
		dict[@"lcs-ClientID"] = lcs_ClientID.objectValue;
	}
	if(lcsLocationInfo)
	{
		dict[@"lcsLocationInfo"] = lcsLocationInfo.objectValue;
	}
	if(msisdn)
	{
		dict[@"msisdn"] = msisdn.objectValue;
	}
	if(imsi)
	{
		dict[@"imsi"] = imsi.objectValue;
	}
	if(imei)
	{
		dict[@"imei"] = imei.objectValue;
	}
	if(na_ESRD)
	{
		dict[@"na-ESRD"] = na_ESRD.objectValue;
	}
	if(na_ESRK)
	{
		dict[@"na-ESRK"] = na_ESRK.objectValue;
	}
	if(locationEstimate)
	{
		dict[@"locationEstimate"] = locationEstimate.objectValue;
	}
	if(ageOfLocationEstimate)
	{
		dict[@"ageOfLocationEstimate"] = ageOfLocationEstimate.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
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


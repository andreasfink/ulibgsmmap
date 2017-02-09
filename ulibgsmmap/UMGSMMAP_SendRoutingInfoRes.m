//
//  UMGSMMAP_SendRoutingInfoRes.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_SendRoutingInfoRes.h"

@implementation UMGSMMAP_SendRoutingInfoRes


@synthesize	operationName;
@synthesize	imsi;
@synthesize	extendedRoutingInfo;
@synthesize	cug_CheckInfo;
@synthesize	cugSubscriptionFlag;
@synthesize	subscriberInfo;
@synthesize	ss_List;
@synthesize	basicService;
@synthesize	forwardingInterrogationRequired;
@synthesize	vmsc_Address;
@synthesize	extensionContainer;
@synthesize	naea_PreferredCI;
@synthesize	ccbs_Indicators;
@synthesize	msisdn;
@synthesize	numberPortabilityStatus;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	asn1_tag.isConstructed=YES;
	asn1_list = [[NSMutableArray alloc]init];
	if(imsi)
	{
		imsi.asn1_tag.tagNumber = 9;
		imsi.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:imsi];
	}
	if(extendedRoutingInfo)
	{
		[asn1_list addObject:extendedRoutingInfo];
	}
	if(cug_CheckInfo)
	{
		cug_CheckInfo.asn1_tag.tagNumber = 3;
		cug_CheckInfo.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:cug_CheckInfo];
	}
	if(cugSubscriptionFlag)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 6;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(subscriberInfo)
	{
		subscriberInfo.asn1_tag.tagNumber = 7;
		subscriberInfo.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:subscriberInfo];
	}
	if(ss_List)
	{
		ss_List.asn1_tag.tagNumber = 1;
		ss_List.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ss_List];
	}
	if(basicService)
	{
		basicService.asn1_tag.tagNumber = 5;
		basicService.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:basicService];
	}
	if(forwardingInterrogationRequired)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 4;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(vmsc_Address)
	{
		vmsc_Address.asn1_tag.tagNumber = 2;
		vmsc_Address.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:vmsc_Address];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 0;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
	if(naea_PreferredCI)
	{
		naea_PreferredCI.asn1_tag.tagNumber = 10;
		naea_PreferredCI.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:naea_PreferredCI];
	}
	if(ccbs_Indicators)
	{
		ccbs_Indicators.asn1_tag.tagNumber = 11;
		ccbs_Indicators.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ccbs_Indicators];
	}
	if(msisdn)
	{
		msisdn.asn1_tag.tagNumber = 12;
		msisdn.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:msisdn];
	}
	if(numberPortabilityStatus)
	{
		numberPortabilityStatus.asn1_tag.tagNumber = 13;
		numberPortabilityStatus.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:numberPortabilityStatus];
	}
}


- (UMGSMMAP_SendRoutingInfoRes *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 9) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		imsi = [[UMGSMMAP_IMSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && ([UMGSMMAP_ExtendedRoutingInfo tagMatches:o.asn1_tag.tagNumber]) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
	{
		extendedRoutingInfo = [[UMGSMMAP_ExtendedRoutingInfo alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		cug_CheckInfo = [[UMGSMMAP_CUG_CheckInfo alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 6) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		cugSubscriptionFlag = YES;
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 7) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		subscriberInfo = [[UMGSMMAP_SubscriberInfo alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ss_List = [[UMGSMMAP_SS_List alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		basicService = [[UMGSMMAP_Ext_BasicServiceCode alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		forwardingInterrogationRequired = YES;
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		vmsc_Address = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if((o) && (o.asn1_tag.tagNumber == 10) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			naea_PreferredCI = [[UMGSMMAP_NAEA_PreferredCI alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 11) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			ccbs_Indicators = [[UMGSMMAP_CCBS_Indicators alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 12) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			msisdn = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 13) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			numberPortabilityStatus = [[UMGSMMAP_NumberPortabilityStatus alloc]initWithASN1Object:o context:context];
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
	return @"SendRoutingInfoRes";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(imsi)
	{
		dict[@"imsi"] = imsi.objectValue;
	}
	if(extendedRoutingInfo)
	{
		dict[@"extendedRoutingInfo"] = extendedRoutingInfo.objectValue;
	}
	if(cug_CheckInfo)
	{
		dict[@"cug-CheckInfo"] = cug_CheckInfo.objectValue;
	}
	if(cugSubscriptionFlag)
	{
		dict[@"cugSubscriptionFlag"] = @(YES);
	}
	if(subscriberInfo)
	{
		dict[@"subscriberInfo"] = subscriberInfo.objectValue;
	}
	if(ss_List)
	{
		dict[@"ss-List"] = ss_List.objectValue;
	}
	if(basicService)
	{
		dict[@"basicService"] = basicService.objectValue;
	}
	if(forwardingInterrogationRequired)
	{
		dict[@"forwardingInterrogationRequired"] = @(YES);
	}
	if(vmsc_Address)
	{
		dict[@"vmsc-Address"] = vmsc_Address.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(naea_PreferredCI)
	{
		dict[@"naea-PreferredCI"] = naea_PreferredCI.objectValue;
	}
	if(ccbs_Indicators)
	{
		dict[@"ccbs-Indicators"] = ccbs_Indicators.objectValue;
	}
	if(msisdn)
	{
		dict[@"msisdn"] = msisdn.objectValue;
	}
	if(numberPortabilityStatus)
	{
		dict[@"numberPortabilityStatus"] = numberPortabilityStatus.objectValue;
	}
	return dict;
}

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}


@end


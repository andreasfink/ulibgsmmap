//
//  UMGSMMAP_RequestedSubscriptionInfo.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_RequestedSubscriptionInfo.h"

@implementation UMGSMMAP_RequestedSubscriptionInfo


@synthesize	operationName;
@synthesize	requestedSS_Info;
@synthesize	odb;
@synthesize	requestedCAMEL_SubscriptionInfo;
@synthesize	supportedVLR_CAMEL_Phases;
@synthesize	supportedSGSN_CAMEL_Phases;
@synthesize	extensionContainer;
@synthesize	additionalRequestedCAMEL_SubscriptionInfo;
@synthesize	msisdn_BS_List;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	asn1_tag.isConstructed=YES;
	asn1_list = [[NSMutableArray alloc]init];
	if(requestedSS_Info)
	{
		requestedSS_Info.asn1_tag.tagNumber = 1;
		requestedSS_Info.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:requestedSS_Info];
	}
	if(odb)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 2;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(requestedCAMEL_SubscriptionInfo)
	{
		requestedCAMEL_SubscriptionInfo.asn1_tag.tagNumber = 3;
		requestedCAMEL_SubscriptionInfo.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:requestedCAMEL_SubscriptionInfo];
	}
	if(supportedVLR_CAMEL_Phases)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 4;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(supportedSGSN_CAMEL_Phases)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 5;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 6;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
	if(additionalRequestedCAMEL_SubscriptionInfo)
	{
		additionalRequestedCAMEL_SubscriptionInfo.asn1_tag.tagNumber = 7;
		additionalRequestedCAMEL_SubscriptionInfo.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:additionalRequestedCAMEL_SubscriptionInfo];
	}
	if(msisdn_BS_List)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 8;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
}


- (UMGSMMAP_RequestedSubscriptionInfo *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		requestedSS_Info = [[UMGSMMAP_SS_ForBS_Code alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		odb = YES;
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		requestedCAMEL_SubscriptionInfo = [[UMGSMMAP_RequestedCAMEL_SubscriptionInfo alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		supportedVLR_CAMEL_Phases = YES;
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		supportedSGSN_CAMEL_Phases = YES;
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 6) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if((o) && (o.asn1_tag.tagNumber == 7) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			additionalRequestedCAMEL_SubscriptionInfo = [[UMGSMMAP_AdditionalRequestedCAMEL_SubscriptionInfo alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 8) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			msisdn_BS_List = YES;
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
	return @"RequestedSubscriptionInfo";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(requestedSS_Info)
	{
		dict[@"requestedSS-Info"] = requestedSS_Info.objectValue;
	}
	if(odb)
	{
		dict[@"odb"] = @(YES);
	}
	if(requestedCAMEL_SubscriptionInfo)
	{
		dict[@"requestedCAMEL-SubscriptionInfo"] = requestedCAMEL_SubscriptionInfo.objectValue;
	}
	if(supportedVLR_CAMEL_Phases)
	{
		dict[@"supportedVLR-CAMEL-Phases"] = @(YES);
	}
	if(supportedSGSN_CAMEL_Phases)
	{
		dict[@"supportedSGSN-CAMEL-Phases"] = @(YES);
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(additionalRequestedCAMEL_SubscriptionInfo)
	{
		dict[@"additionalRequestedCAMEL-SubscriptionInfo"] = additionalRequestedCAMEL_SubscriptionInfo.objectValue;
	}
	if(msisdn_BS_List)
	{
		dict[@"msisdn-BS-List"] = @(YES);
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


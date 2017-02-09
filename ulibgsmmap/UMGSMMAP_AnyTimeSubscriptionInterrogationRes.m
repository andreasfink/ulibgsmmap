//
//  UMGSMMAP_AnyTimeSubscriptionInterrogationRes.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_AnyTimeSubscriptionInterrogationRes.h"

@implementation UMGSMMAP_AnyTimeSubscriptionInterrogationRes


@synthesize	operationName;
@synthesize	callForwardingData;
@synthesize	callBarringData;
@synthesize	odb_Info;
@synthesize	camel_SubscriptionInfo;
@synthesize	supportedVLR_CAMEL_Phases;
@synthesize	supportedSGSN_CAMEL_Phases;
@synthesize	extensionContainer;
@synthesize	offeredCamel4CSIsInVLR;
@synthesize	offeredCamel4CSIsInSGSN;
@synthesize	msisdn_BS_List;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	asn1_tag.isConstructed=YES;
	asn1_list = [[NSMutableArray alloc]init];
	if(callForwardingData)
	{
		callForwardingData.asn1_tag.tagNumber = 1;
		callForwardingData.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:callForwardingData];
	}
	if(callBarringData)
	{
		callBarringData.asn1_tag.tagNumber = 2;
		callBarringData.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:callBarringData];
	}
	if(odb_Info)
	{
		odb_Info.asn1_tag.tagNumber = 3;
		odb_Info.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:odb_Info];
	}
	if(camel_SubscriptionInfo)
	{
		camel_SubscriptionInfo.asn1_tag.tagNumber = 4;
		camel_SubscriptionInfo.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:camel_SubscriptionInfo];
	}
	if(supportedVLR_CAMEL_Phases)
	{
		supportedVLR_CAMEL_Phases.asn1_tag.tagNumber = 5;
		supportedVLR_CAMEL_Phases.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:supportedVLR_CAMEL_Phases];
	}
	if(supportedSGSN_CAMEL_Phases)
	{
		supportedSGSN_CAMEL_Phases.asn1_tag.tagNumber = 6;
		supportedSGSN_CAMEL_Phases.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:supportedSGSN_CAMEL_Phases];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 7;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
	if(offeredCamel4CSIsInVLR)
	{
		offeredCamel4CSIsInVLR.asn1_tag.tagNumber = 8;
		offeredCamel4CSIsInVLR.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:offeredCamel4CSIsInVLR];
	}
	if(offeredCamel4CSIsInSGSN)
	{
		offeredCamel4CSIsInSGSN.asn1_tag.tagNumber = 9;
		offeredCamel4CSIsInSGSN.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:offeredCamel4CSIsInSGSN];
	}
	if(msisdn_BS_List)
	{
		msisdn_BS_List.asn1_tag.tagNumber = 10;
		msisdn_BS_List.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:msisdn_BS_List];
	}
}


- (UMGSMMAP_AnyTimeSubscriptionInterrogationRes *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		callForwardingData = [[UMGSMMAP_CallForwardingData alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		callBarringData = [[UMGSMMAP_CallBarringData alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		odb_Info = [[UMGSMMAP_ODB_Info alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		camel_SubscriptionInfo = [[UMGSMMAP_CAMEL_SubscriptionInfo alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		supportedVLR_CAMEL_Phases = [[UMGSMMAP_SupportedCamelPhases alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 6) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		supportedSGSN_CAMEL_Phases = [[UMGSMMAP_SupportedCamelPhases alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 7) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if((o) && (o.asn1_tag.tagNumber == 8) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			offeredCamel4CSIsInVLR = [[UMGSMMAP_OfferedCamel4CSIs alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 9) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			offeredCamel4CSIsInSGSN = [[UMGSMMAP_OfferedCamel4CSIs alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 10) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			msisdn_BS_List = [[UMGSMMAP_MSISDN_BS_List alloc]initWithASN1Object:o context:context];
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
	return @"AnyTimeSubscriptionInterrogationRes";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(callForwardingData)
	{
		dict[@"callForwardingData"] = callForwardingData.objectValue;
	}
	if(callBarringData)
	{
		dict[@"callBarringData"] = callBarringData.objectValue;
	}
	if(odb_Info)
	{
		dict[@"odb-Info"] = odb_Info.objectValue;
	}
	if(camel_SubscriptionInfo)
	{
		dict[@"camel-SubscriptionInfo"] = camel_SubscriptionInfo.objectValue;
	}
	if(supportedVLR_CAMEL_Phases)
	{
		dict[@"supportedVLR-CAMEL-Phases"] = supportedVLR_CAMEL_Phases.objectValue;
	}
	if(supportedSGSN_CAMEL_Phases)
	{
		dict[@"supportedSGSN-CAMEL-Phases"] = supportedSGSN_CAMEL_Phases.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(offeredCamel4CSIsInVLR)
	{
		dict[@"offeredCamel4CSIsInVLR"] = offeredCamel4CSIsInVLR.objectValue;
	}
	if(offeredCamel4CSIsInSGSN)
	{
		dict[@"offeredCamel4CSIsInSGSN"] = offeredCamel4CSIsInSGSN.objectValue;
	}
	if(msisdn_BS_List)
	{
		dict[@"msisdn-BS-List"] = msisdn_BS_List.objectValue;
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


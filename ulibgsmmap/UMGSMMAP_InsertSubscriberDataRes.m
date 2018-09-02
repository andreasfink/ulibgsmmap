//
//  UMGSMMAP_InsertSubscriberDataRes.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_InsertSubscriberDataRes.h"

@implementation UMGSMMAP_InsertSubscriberDataRes


@synthesize	operationName;
@synthesize	teleserviceList;
@synthesize	bearerServiceList;
@synthesize	ss_List;
@synthesize	odb_GeneralData;
@synthesize	regionalSubscriptionResponse;
@synthesize	supportedCamelPhases;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(teleserviceList)
	{
		teleserviceList.asn1_tag.tagNumber = 1;
		teleserviceList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:teleserviceList];
	}
	if(bearerServiceList)
	{
		bearerServiceList.asn1_tag.tagNumber = 2;
		bearerServiceList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:bearerServiceList];
	}
	if(ss_List)
	{
		ss_List.asn1_tag.tagNumber = 3;
		ss_List.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:ss_List];
	}
	if(odb_GeneralData)
	{
		odb_GeneralData.asn1_tag.tagNumber = 4;
		odb_GeneralData.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:odb_GeneralData];
	}
	if(regionalSubscriptionResponse)
	{
		regionalSubscriptionResponse.asn1_tag.tagNumber = 5;
		regionalSubscriptionResponse.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:regionalSubscriptionResponse];
	}
	if(supportedCamelPhases)
	{
		supportedCamelPhases.asn1_tag.tagNumber = 6;
		supportedCamelPhases.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:supportedCamelPhases];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 7;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_InsertSubscriberDataRes *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		teleserviceList = [[UMGSMMAP_TeleserviceList alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		bearerServiceList = [[UMGSMMAP_BearerServiceList alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ss_List = [[UMGSMMAP_SS_List alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		odb_GeneralData = [[UMGSMMAP_ODB_GeneralData alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		regionalSubscriptionResponse = [[UMGSMMAP_RegionalSubscriptionResponse alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 6) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		supportedCamelPhases = [[UMGSMMAP_SupportedCamelPhases alloc]initWithASN1Object:o context:context];
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
	return @"InsertSubscriberDataRes";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(teleserviceList)
	{
		dict[@"teleserviceList"] = teleserviceList.objectValue;
	}
	if(bearerServiceList)
	{
		dict[@"bearerServiceList"] = bearerServiceList.objectValue;
	}
	if(ss_List)
	{
		dict[@"ss-List"] = ss_List.objectValue;
	}
	if(odb_GeneralData)
	{
		dict[@"odb-GeneralData"] = odb_GeneralData.objectValue;
	}
	if(regionalSubscriptionResponse)
	{
		dict[@"regionalSubscriptionResponse"] = regionalSubscriptionResponse.objectValue;
	}
	if(supportedCamelPhases)
	{
		dict[@"supportedCamelPhases"] = supportedCamelPhases.objectValue;
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


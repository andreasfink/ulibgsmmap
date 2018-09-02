//
//  UMGSMMAP_GPRS_CamelTDPData.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_GPRS_CamelTDPData.h"

@implementation UMGSMMAP_GPRS_CamelTDPData


@synthesize	operationName;
@synthesize	gprs_TriggerDetectionPoint;
@synthesize	serviceKey;
@synthesize	gsmSCF_Address;
@synthesize	defaultSessionHandling;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	_asn1_tag.isConstructed=YES;
	_asn1_list = [[NSMutableArray alloc]init];
	if(gprs_TriggerDetectionPoint)
	{
		gprs_TriggerDetectionPoint.asn1_tag.tagNumber = 0;
		gprs_TriggerDetectionPoint.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:gprs_TriggerDetectionPoint];
	}
	if(serviceKey)
	{
		serviceKey.asn1_tag.tagNumber = 1;
		serviceKey.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:serviceKey];
	}
	if(gsmSCF_Address)
	{
		gsmSCF_Address.asn1_tag.tagNumber = 2;
		gsmSCF_Address.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:gsmSCF_Address];
	}
	if(defaultSessionHandling)
	{
		defaultSessionHandling.asn1_tag.tagNumber = 3;
		defaultSessionHandling.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:defaultSessionHandling];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 4;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_GPRS_CamelTDPData *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		gprs_TriggerDetectionPoint = [[UMGSMMAP_GPRS_TriggerDetectionPoint alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		serviceKey = [[UMGSMMAP_ServiceKey alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		gsmSCF_Address = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		defaultSessionHandling = [[UMGSMMAP_DefaultGPRS_Handling alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
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
	return @"GPRS-CamelTDPData";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(gprs_TriggerDetectionPoint)
	{
		dict[@"gprs-TriggerDetectionPoint"] = gprs_TriggerDetectionPoint.objectValue;
	}
	if(serviceKey)
	{
		dict[@"serviceKey"] = serviceKey.objectValue;
	}
	if(gsmSCF_Address)
	{
		dict[@"gsmSCF-Address"] = gsmSCF_Address.objectValue;
	}
	if(defaultSessionHandling)
	{
		dict[@"defaultSessionHandling"] = defaultSessionHandling.objectValue;
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


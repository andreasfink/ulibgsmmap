//
//  UMGSMMAP_SMS_CAMEL_TDP_Data.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_SMS_CAMEL_TDP_Data.h"

@implementation UMGSMMAP_SMS_CAMEL_TDP_Data


@synthesize	operationName;
@synthesize	sms_TriggerDetectionPoint;
@synthesize	serviceKey;
@synthesize	gsmSCF_Address;
@synthesize	defaultSMS_Handling;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	asn1_tag.isConstructed=YES;
	asn1_list = [[NSMutableArray alloc]init];
	if(sms_TriggerDetectionPoint)
	{
		sms_TriggerDetectionPoint.asn1_tag.tagNumber = 0;
		sms_TriggerDetectionPoint.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:sms_TriggerDetectionPoint];
	}
	if(serviceKey)
	{
		serviceKey.asn1_tag.tagNumber = 1;
		serviceKey.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:serviceKey];
	}
	if(gsmSCF_Address)
	{
		gsmSCF_Address.asn1_tag.tagNumber = 2;
		gsmSCF_Address.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:gsmSCF_Address];
	}
	if(defaultSMS_Handling)
	{
		defaultSMS_Handling.asn1_tag.tagNumber = 3;
		defaultSMS_Handling.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:defaultSMS_Handling];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 4;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_SMS_CAMEL_TDP_Data *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		sms_TriggerDetectionPoint = [[UMGSMMAP_SMS_TriggerDetectionPoint alloc]initWithASN1Object:o context:context];
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
		defaultSMS_Handling = [[UMGSMMAP_DefaultSMS_Handling alloc]initWithASN1Object:o context:context];
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
	return @"SMS-CAMEL-TDP-Data";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(sms_TriggerDetectionPoint)
	{
		dict[@"sms-TriggerDetectionPoint"] = sms_TriggerDetectionPoint.objectValue;
	}
	if(serviceKey)
	{
		dict[@"serviceKey"] = serviceKey.objectValue;
	}
	if(gsmSCF_Address)
	{
		dict[@"gsmSCF-Address"] = gsmSCF_Address.objectValue;
	}
	if(defaultSMS_Handling)
	{
		dict[@"defaultSMS-Handling"] = defaultSMS_Handling.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
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


//
//  UMGSMMAP_SMS_CSI.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_SMS_CSI.h"

@implementation UMGSMMAP_SMS_CSI


@synthesize	operationName;
@synthesize	sms_CAMEL_TDP_DataList;
@synthesize	camelCapabilityHandling;
@synthesize	extensionContainer;
@synthesize	notificationToCSE;
@synthesize	csi_Active;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	asn1_tag.isConstructed=YES;
	asn1_list = [[NSMutableArray alloc]init];
	if(sms_CAMEL_TDP_DataList)
	{
		sms_CAMEL_TDP_DataList.asn1_tag.tagNumber = 0;
		sms_CAMEL_TDP_DataList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:sms_CAMEL_TDP_DataList];
	}
	if(camelCapabilityHandling)
	{
		camelCapabilityHandling.asn1_tag.tagNumber = 1;
		camelCapabilityHandling.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:camelCapabilityHandling];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 2;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
	if(notificationToCSE)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 3;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(csi_Active)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 4;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
}


- (UMGSMMAP_SMS_CSI *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		sms_CAMEL_TDP_DataList = [[UMGSMMAP_SMS_CAMEL_TDP_DataList alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		camelCapabilityHandling = [[UMGSMMAP_CamelCapabilityHandling alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		notificationToCSE = YES;
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		csi_Active = YES;
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
	return @"SMS-CSI";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(sms_CAMEL_TDP_DataList)
	{
		dict[@"sms-CAMEL-TDP-DataList"] = sms_CAMEL_TDP_DataList.objectValue;
	}
	if(camelCapabilityHandling)
	{
		dict[@"camelCapabilityHandling"] = camelCapabilityHandling.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(notificationToCSE)
	{
		dict[@"notificationToCSE"] = @(YES);
	}
	if(csi_Active)
	{
		dict[@"csi-Active"] = @(YES);
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


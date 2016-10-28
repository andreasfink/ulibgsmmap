//
//  UMGSMMAP_O_BcsmCamelTDPData.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_O_BcsmCamelTDPData.h"

@implementation UMGSMMAP_O_BcsmCamelTDPData


@synthesize	operationName;
@synthesize	o_BcsmTriggerDetectionPoint;
@synthesize	serviceKey;
@synthesize	gsmSCF_Address;
@synthesize	defaultCallHandling;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(o_BcsmTriggerDetectionPoint)
	{
		[asn1_list addObject:o_BcsmTriggerDetectionPoint];
	}
	if(serviceKey)
	{
		[asn1_list addObject:serviceKey];
	}
	if(gsmSCF_Address)
	{
		gsmSCF_Address.asn1_tag.tagNumber = 0;
		gsmSCF_Address.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:gsmSCF_Address];
	}
	if(defaultCallHandling)
	{
		defaultCallHandling.asn1_tag.tagNumber = 1;
		defaultCallHandling.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:defaultCallHandling];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 2;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_O_BcsmCamelTDPData *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		o_BcsmTriggerDetectionPoint = [[UMGSMMAP_O_BcsmTriggerDetectionPoint alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		serviceKey = [[UMGSMMAP_ServiceKey alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		gsmSCF_Address = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		defaultCallHandling = [[UMGSMMAP_DefaultCallHandling alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
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
	return @"O-BcsmCamelTDPData";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(o_BcsmTriggerDetectionPoint)
	{
		dict[@"o-BcsmTriggerDetectionPoint"] = o_BcsmTriggerDetectionPoint.objectValue;
	}
	if(serviceKey)
	{
		dict[@"serviceKey"] = serviceKey.objectValue;
	}
	if(gsmSCF_Address)
	{
		dict[@"gsmSCF-Address"] = gsmSCF_Address.objectValue;
	}
	if(defaultCallHandling)
	{
		dict[@"defaultCallHandling"] = defaultCallHandling.objectValue;
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


//
//  UMGSMMAP_PDP_Context.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_PDP_Context.h"

@implementation UMGSMMAP_PDP_Context


@synthesize	operationName;
@synthesize	pdp_ContextId;
@synthesize	pdp_Type;
@synthesize	pdp_Address;
@synthesize	qos_Subscribed;
@synthesize	vplmnAddressAllowed;
@synthesize	apn;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(pdp_ContextId)
	{
		[_asn1_list addObject:pdp_ContextId];
	}
	if(pdp_Type)
	{
		pdp_Type.asn1_tag.tagNumber = 16;
		pdp_Type.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:pdp_Type];
	}
	if(pdp_Address)
	{
		pdp_Address.asn1_tag.tagNumber = 17;
		pdp_Address.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:pdp_Address];
	}
	if(qos_Subscribed)
	{
		qos_Subscribed.asn1_tag.tagNumber = 18;
		qos_Subscribed.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:qos_Subscribed];
	}
	if(vplmnAddressAllowed)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 19;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:n];
	}
	if(apn)
	{
		apn.asn1_tag.tagNumber = 20;
		apn.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:apn];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 21;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_PDP_Context *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		pdp_ContextId = [[UMGSMMAP_ContextId alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 16) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		pdp_Type = [[UMGSMMAP_PDP_Type alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 17) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		pdp_Address = [[UMGSMMAP_PDP_Address alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 18) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		qos_Subscribed = [[UMGSMMAP_QoS_Subscribed alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 19) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		vplmnAddressAllowed = YES;
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 20) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		apn = [[UMGSMMAP_APN alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 21) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
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
	return @"PDP-Context";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(pdp_ContextId)
	{
		dict[@"pdp-ContextId"] = pdp_ContextId.objectValue;
	}
	if(pdp_Type)
	{
		dict[@"pdp-Type"] = pdp_Type.objectValue;
	}
	if(pdp_Address)
	{
		dict[@"pdp-Address"] = pdp_Address.objectValue;
	}
	if(qos_Subscribed)
	{
		dict[@"qos-Subscribed"] = qos_Subscribed.objectValue;
	}
	if(vplmnAddressAllowed)
	{
		dict[@"vplmnAddressAllowed"] = @(YES);
	}
	if(apn)
	{
		dict[@"apn"] = apn.objectValue;
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


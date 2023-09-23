//
//  UMGSMMAP_ProvideSIWFSNumberArg.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_ProvideSIWFSNumberArg.h>

@implementation UMGSMMAP_ProvideSIWFSNumberArg


@synthesize	operationName;
@synthesize	gsm_BearerCapability;
@synthesize	isdn_BearerCapability;
@synthesize	call_Direction;
@synthesize	b_Subscriber_Address;
@synthesize	chosenChannel;
@synthesize	lowerLayerCompatibility;
@synthesize	highLayerCompatibility;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(gsm_BearerCapability)
	{
		gsm_BearerCapability.asn1_tag.tagNumber = 0;
		gsm_BearerCapability.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:gsm_BearerCapability];
	}
	if(isdn_BearerCapability)
	{
		isdn_BearerCapability.asn1_tag.tagNumber = 1;
		isdn_BearerCapability.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:isdn_BearerCapability];
	}
	if(call_Direction)
	{
		call_Direction.asn1_tag.tagNumber = 2;
		call_Direction.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:call_Direction];
	}
	if(b_Subscriber_Address)
	{
		b_Subscriber_Address.asn1_tag.tagNumber = 3;
		b_Subscriber_Address.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:b_Subscriber_Address];
	}
	if(chosenChannel)
	{
		chosenChannel.asn1_tag.tagNumber = 4;
		chosenChannel.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:chosenChannel];
	}
	if(lowerLayerCompatibility)
	{
		lowerLayerCompatibility.asn1_tag.tagNumber = 5;
		lowerLayerCompatibility.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:lowerLayerCompatibility];
	}
	if(highLayerCompatibility)
	{
		highLayerCompatibility.asn1_tag.tagNumber = 6;
		highLayerCompatibility.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:highLayerCompatibility];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 7;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_ProvideSIWFSNumberArg *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_ProvideSIWFSNumberArg"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		gsm_BearerCapability = [[UMGSMMAP_ExternalSignalInfo alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		isdn_BearerCapability = [[UMGSMMAP_ExternalSignalInfo alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		call_Direction = [[UMGSMMAP_CallDirection alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		b_Subscriber_Address = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		chosenChannel = [[UMGSMMAP_ExternalSignalInfo alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		lowerLayerCompatibility = [[UMGSMMAP_ExternalSignalInfo alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 6) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		highLayerCompatibility = [[UMGSMMAP_ExternalSignalInfo alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 7) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
	}
	return self;
}

- (NSString *) objectName
{
	return @"ProvideSIWFSNumberArg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(gsm_BearerCapability)
	{
		dict[@"gsm-BearerCapability"] = gsm_BearerCapability.objectValue;
	}
	if(isdn_BearerCapability)
	{
		dict[@"isdn-BearerCapability"] = isdn_BearerCapability.objectValue;
	}
	if(call_Direction)
	{
		dict[@"call-Direction"] = call_Direction.objectValue;
	}
	if(b_Subscriber_Address)
	{
		dict[@"b-Subscriber-Address"] = b_Subscriber_Address.objectValue;
	}
	if(chosenChannel)
	{
		dict[@"chosenChannel"] = chosenChannel.objectValue;
	}
	if(lowerLayerCompatibility)
	{
		dict[@"lowerLayerCompatibility"] = lowerLayerCompatibility.objectValue;
	}
	if(highLayerCompatibility)
	{
		dict[@"highLayerCompatibility"] = highLayerCompatibility.objectValue;
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


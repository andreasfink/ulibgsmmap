//
//  UMGSMMAP_T_BcsmCamelTDPData.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_T_BcsmCamelTDPData.h>

@implementation UMGSMMAP_T_BcsmCamelTDPData


@synthesize	operationName;
@synthesize	t_BcsmTriggerDetectionPoint;
@synthesize	serviceKey;
@synthesize	gsmSCF_Address;
@synthesize	defaultCallHandling;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(t_BcsmTriggerDetectionPoint)
	{
		[asn1_list addObject:t_BcsmTriggerDetectionPoint];
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


- (UMGSMMAP_T_BcsmCamelTDPData *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_T_BcsmCamelTDPData"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		t_BcsmTriggerDetectionPoint = [[UMGSMMAP_T_BcsmTriggerDetectionPoint alloc]initWithASN1Object:o context:context];
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
	}
	return self;
}

- (NSString *) objectName
{
	return @"T-BcsmCamelTDPData";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(t_BcsmTriggerDetectionPoint)
	{
		dict[@"t-BcsmTriggerDetectionPoint"] = t_BcsmTriggerDetectionPoint.objectValue;
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


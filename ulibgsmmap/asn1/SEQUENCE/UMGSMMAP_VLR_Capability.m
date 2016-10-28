//
//  UMGSMMAP_VLR_Capability.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_VLR_Capability.h"

@implementation UMGSMMAP_VLR_Capability


@synthesize	operationName;
@synthesize	supportedCamelPhases;
@synthesize	extensionContainer;
@synthesize	solsaSupportIndicator;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(supportedCamelPhases)
	{
		supportedCamelPhases.asn1_tag.tagNumber = 0;
		supportedCamelPhases.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:supportedCamelPhases];
	}
	if(extensionContainer)
	{
		[asn1_list addObject:extensionContainer];
	}
	if(solsaSupportIndicator)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 2;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
}


- (UMGSMMAP_VLR_Capability *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_VLR_Capability"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		supportedCamelPhases = [[UMGSMMAP_SupportedCamelPhases alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			solsaSupportIndicator = YES;
			o = [self getObjectAtPosition:p++];
		}
	}
	return self;
}

- (NSString *) objectName
{
	return @"VLR-Capability";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(supportedCamelPhases)
	{
		dict[@"supportedCamelPhases"] = supportedCamelPhases.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(solsaSupportIndicator)
	{
		dict[@"solsaSupportIndicator"] = @(YES);
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


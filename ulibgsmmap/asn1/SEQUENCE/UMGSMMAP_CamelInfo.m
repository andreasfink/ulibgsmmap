//
//  UMGSMMAP_CamelInfo.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_CamelInfo.h"

@implementation UMGSMMAP_CamelInfo


@synthesize	operationName;
@synthesize	supportedCamelPhases;
@synthesize	suppress_T_CSI;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(supportedCamelPhases)
	{
		[asn1_list addObject:supportedCamelPhases];
	}
	if(suppress_T_CSI)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = -1;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(extensionContainer)
	{
		[asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_CamelInfo *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_CamelInfo"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		supportedCamelPhases = [[UMGSMMAP_SupportedCamelPhases alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		suppress_T_CSI = YES;
		o = [self getObjectAtPosition:p++];
	}
	if(o)
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
	return @"CamelInfo";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(supportedCamelPhases)
	{
		dict[@"supportedCamelPhases"] = supportedCamelPhases.objectValue;
	}
	if(suppress_T_CSI)
	{
		dict[@"suppress-T-CSI"] = @(YES);
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


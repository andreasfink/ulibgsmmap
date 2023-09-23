//
//  UMGSMMAP_CUG_Feature.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_CUG_Feature.h>

@implementation UMGSMMAP_CUG_Feature


@synthesize	operationName;
@synthesize	basicService;
@synthesize	preferentialCUG_Indicator;
@synthesize	interCUG_Restrictions;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(basicService)
	{
		[asn1_list addObject:basicService];
	}
	if(preferentialCUG_Indicator)
	{
		[asn1_list addObject:preferentialCUG_Indicator];
	}
	if(interCUG_Restrictions)
	{
		[asn1_list addObject:interCUG_Restrictions];
	}
	if(extensionContainer)
	{
		[asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_CUG_Feature *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_CUG_Feature"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		basicService = [[UMGSMMAP_Ext_BasicServiceCode alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		preferentialCUG_Indicator = [[UMGSMMAP_CUG_Index alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		interCUG_Restrictions = [[UMGSMMAP_InterCUG_Restrictions alloc]initWithASN1Object:o context:context];
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
	return @"CUG-Feature";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(basicService)
	{
		dict[@"basicService"] = basicService.objectValue;
	}
	if(preferentialCUG_Indicator)
	{
		dict[@"preferentialCUG-Indicator"] = preferentialCUG_Indicator.objectValue;
	}
	if(interCUG_Restrictions)
	{
		dict[@"interCUG-Restrictions"] = interCUG_Restrictions.objectValue;
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


//
//  UMGSMMAP_CUG_Info.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_CUG_Info.h>

@implementation UMGSMMAP_CUG_Info


@synthesize	operationName;
@synthesize	cug_SubscriptionList;
@synthesize	cug_FeatureList;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(cug_SubscriptionList)
	{
		[asn1_list addObject:cug_SubscriptionList];
	}
	if(cug_FeatureList)
	{
		[asn1_list addObject:cug_FeatureList];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 0;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_CUG_Info *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_CUG_Info"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		cug_SubscriptionList = [[UMGSMMAP_CUG_SubscriptionList alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		cug_FeatureList = [[UMGSMMAP_CUG_FeatureList alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
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
	return @"CUG-Info";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(cug_SubscriptionList)
	{
		dict[@"cug-SubscriptionList"] = cug_SubscriptionList.objectValue;
	}
	if(cug_FeatureList)
	{
		dict[@"cug-FeatureList"] = cug_FeatureList.objectValue;
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


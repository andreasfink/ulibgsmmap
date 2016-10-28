//
//  UMGSMMAP_CUG_Subscription.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_CUG_Subscription.h"

@implementation UMGSMMAP_CUG_Subscription


@synthesize	operationName;
@synthesize	cug_Index;
@synthesize	cug_Interlock;
@synthesize	intraCUG_Options;
@synthesize	basicServiceGroupList;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(cug_Index)
	{
		[asn1_list addObject:cug_Index];
	}
	if(cug_Interlock)
	{
		[asn1_list addObject:cug_Interlock];
	}
	if(intraCUG_Options)
	{
		[asn1_list addObject:intraCUG_Options];
	}
	if(basicServiceGroupList)
	{
		[asn1_list addObject:basicServiceGroupList];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 0;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_CUG_Subscription *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_CUG_Subscription"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		cug_Index = [[UMGSMMAP_CUG_Index alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		cug_Interlock = [[UMGSMMAP_CUG_Interlock alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		intraCUG_Options = [[UMGSMMAP_IntraCUG_Options alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		basicServiceGroupList = [[UMGSMMAP_Ext_BasicServiceGroupList alloc]initWithASN1Object:o context:context];
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
	return @"CUG-Subscription";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(cug_Index)
	{
		dict[@"cug-Index"] = cug_Index.objectValue;
	}
	if(cug_Interlock)
	{
		dict[@"cug-Interlock"] = cug_Interlock.objectValue;
	}
	if(intraCUG_Options)
	{
		dict[@"intraCUG-Options"] = intraCUG_Options.objectValue;
	}
	if(basicServiceGroupList)
	{
		dict[@"basicServiceGroupList"] = basicServiceGroupList.objectValue;
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


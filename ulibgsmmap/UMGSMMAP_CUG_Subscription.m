//
//  UMGSMMAP_CUG_Subscription.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_CUG_Subscription.h>

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
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(cug_Index)
	{
		[_asn1_list addObject:cug_Index];
	}
	if(cug_Interlock)
	{
		[_asn1_list addObject:cug_Interlock];
	}
	if(intraCUG_Options)
	{
		[_asn1_list addObject:intraCUG_Options];
	}
	if(basicServiceGroupList)
	{
		[_asn1_list addObject:basicServiceGroupList];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 0;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_CUG_Subscription *) processAfterDecodeWithContext:(id)context
{
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
        /* ... */
        o = [self getObjectAtPosition:p++];
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
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}


@end


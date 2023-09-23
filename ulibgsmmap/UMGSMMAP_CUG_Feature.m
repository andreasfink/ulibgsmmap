//
//  UMGSMMAP_CUG_Feature.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
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
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(basicService)
	{
		[_asn1_list addObject:basicService];
	}
	if(preferentialCUG_Indicator)
	{
		[_asn1_list addObject:preferentialCUG_Indicator];
	}
	if(interCUG_Restrictions)
	{
		[_asn1_list addObject:interCUG_Restrictions];
	}
	if(extensionContainer)
	{
		[_asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_CUG_Feature *) processAfterDecodeWithContext:(id)context
{
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
        /* ... */
        o = [self getObjectAtPosition:p++];
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
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}


@end


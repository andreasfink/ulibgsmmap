//
//  UMGSMMAP_MAP_RefuseInfo.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_MAP_RefuseInfo.h"

@implementation UMGSMMAP_MAP_RefuseInfo


@synthesize	operationName;
@synthesize	reason;
@synthesize	extensionContainer;
@synthesize alternativeApplicationContext;

- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(reason)
	{
		[asn1_list addObject:reason];
	}
	if(extensionContainer)
	{
		[asn1_list addObject:extensionContainer];
	}
    if(alternativeApplicationContext)
    {
        [asn1_list addObject:alternativeApplicationContext];
    }
}


- (UMGSMMAP_MAP_RefuseInfo *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		reason = [[UMGSMMAP_Reason alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if(o)
		{
			extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else
		{
		    o = [self getObjectAtPosition:p++];
		}
	}
	return self;
}

- (NSString *) objectName
{
	return @"MAP-RefuseInfo";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(reason)
	{
		dict[@"reason"] = reason.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
    if(alternativeApplicationContext)
    {
        dict[@"alternativeApplicationContext"] = alternativeApplicationContext.objectValue;
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


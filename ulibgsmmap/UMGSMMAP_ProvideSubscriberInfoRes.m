//
//  UMGSMMAP_ProvideSubscriberInfoRes.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_ProvideSubscriberInfoRes.h"

@implementation UMGSMMAP_ProvideSubscriberInfoRes


@synthesize	operationName;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(_subscriberInfo)
	{
		[_asn1_list addObject:_subscriberInfo];
	}
	if(_extensionContainer)
	{
		[_asn1_list addObject:_extensionContainer];
	}
}


- (UMGSMMAP_ProvideSubscriberInfoRes *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		_subscriberInfo = [[UMGSMMAP_SubscriberInfo alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		_extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
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
	return @"ProvideSubscriberInfoRes";
}

- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(_subscriberInfo)
	{
		dict[@"subscriberInfo"] = _subscriberInfo.objectValue;
	}
	if(_extensionContainer)
	{
		dict[@"extensionContainer"] = _extensionContainer.objectValue;
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


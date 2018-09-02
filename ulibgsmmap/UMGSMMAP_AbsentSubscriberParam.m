//
//  UMGSMMAP_AbsentSubscriberParam.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_AbsentSubscriberParam.h"

@implementation UMGSMMAP_AbsentSubscriberParam


@synthesize	operationName;
@synthesize	extensionContainer;
@synthesize	absentSubscriberReason;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(extensionContainer)
	{
		[_asn1_list addObject:extensionContainer];
	}
	if(absentSubscriberReason)
	{
		absentSubscriberReason.asn1_tag.tagNumber = 0;
		absentSubscriberReason.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:absentSubscriberReason];
	}
}


- (UMGSMMAP_AbsentSubscriberParam *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			absentSubscriberReason = [[UMGSMMAP_AbsentSubscriberReason alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
	}
	return self;
}

- (NSString *) objectName
{
	return @"AbsentSubscriberParam";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(absentSubscriberReason)
	{
		dict[@"absentSubscriberReason"] = absentSubscriberReason.objectValue;
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


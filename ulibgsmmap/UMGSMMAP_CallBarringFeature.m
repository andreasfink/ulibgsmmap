//
//  UMGSMMAP_CallBarringFeature.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_CallBarringFeature.h"

@implementation UMGSMMAP_CallBarringFeature


@synthesize	operationName;
@synthesize	basicService;
@synthesize	ss_Status;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(basicService)
	{
		[asn1_list addObject:basicService];
	}
	if(ss_Status)
	{
		ss_Status.asn1_tag.tagNumber = 4;
		ss_Status.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ss_Status];
	}
}


- (UMGSMMAP_CallBarringFeature *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		basicService = [[UMGSMMAP_BasicServiceCode alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ss_Status = [[UMGSMMAP_SS_Status alloc]initWithASN1Object:o context:context];
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
	return @"CallBarringFeature";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(basicService)
	{
		dict[@"basicService"] = basicService.objectValue;
	}
	if(ss_Status)
	{
		dict[@"ss-Status"] = ss_Status.objectValue;
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


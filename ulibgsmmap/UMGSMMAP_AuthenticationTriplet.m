//
//  UMGSMMAP_AuthenticationTriplet.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_AuthenticationTriplet.h"

@implementation UMGSMMAP_AuthenticationTriplet


@synthesize	operationName;
@synthesize	rand;
@synthesize	sres;
@synthesize	kc;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(rand)
	{
		[asn1_list addObject:rand];
	}
	if(sres)
	{
		[asn1_list addObject:sres];
	}
	if(kc)
	{
		[asn1_list addObject:kc];
	}
}


- (UMGSMMAP_AuthenticationTriplet *) processAfterDecodeWithContext:(id)context
{
    [super processAfterDecodeWithContext:context];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		rand = [[UMGSMMAP_RAND alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		sres = [[UMGSMMAP_SRES alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		kc = [[UMGSMMAP_Kc alloc]initWithASN1Object:o context:context];
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
	return @"AuthenticationTriplet";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(rand)
	{
		dict[@"rand"] = rand.objectValue;
	}
	if(sres)
	{
		dict[@"sres"] = sres.objectValue;
	}
	if(kc)
	{
		dict[@"kc"] = kc.objectValue;
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


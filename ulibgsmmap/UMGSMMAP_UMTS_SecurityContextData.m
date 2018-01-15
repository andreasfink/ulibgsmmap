//
//  UMGSMMAP_UMTS_SecurityContextData.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_UMTS_SecurityContextData.h"

@implementation UMGSMMAP_UMTS_SecurityContextData


@synthesize	operationName;
@synthesize	ck;
@synthesize	ik;
@synthesize	ksi;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(ck)
	{
		[asn1_list addObject:ck];
	}
	if(ik)
	{
		[asn1_list addObject:ik];
	}
	if(ksi)
	{
		[asn1_list addObject:ksi];
	}
}


- (UMGSMMAP_UMTS_SecurityContextData *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		ck = [[UMGSMMAP_CK alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		ik = [[UMGSMMAP_IK alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		ksi = [[UMGSMMAP_KSI alloc]initWithASN1Object:o context:context];
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
	return @"UMTS_SecurityContextData";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(ck)
	{
		dict[@"ck"] = ck.objectValue;
	}
	if(ik)
	{
		dict[@"ik"] = ik.objectValue;
	}
	if(ksi)
	{
		dict[@"ksi"] = ksi.objectValue;
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


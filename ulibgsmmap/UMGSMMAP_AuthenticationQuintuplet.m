//
//  UMGSMMAP_AuthenticationQuintuplet.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_AuthenticationQuintuplet.h>

@implementation UMGSMMAP_AuthenticationQuintuplet


@synthesize	operationName;
@synthesize	rand;
@synthesize	xres;
@synthesize	ck;
@synthesize	ik;
@synthesize	autn;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(rand)
	{
		[_asn1_list addObject:rand];
	}
	if(xres)
	{
		[_asn1_list addObject:xres];
	}
	if(ck)
	{
		[_asn1_list addObject:ck];
	}
	if(ik)
	{
		[_asn1_list addObject:ik];
	}
	if(autn)
	{
		[_asn1_list addObject:autn];
	}
}


- (UMGSMMAP_AuthenticationQuintuplet *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		rand = [[UMGSMMAP_RAND alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		xres = [[UMGSMMAP_XRES alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
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
		autn = [[UMGSMMAP_AUTN alloc]initWithASN1Object:o context:context];
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
	return @"AuthenticationQuintuplet";
}
    
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(rand)
	{
		dict[@"rand"] = rand.objectValue;
	}
	if(xres)
	{
		dict[@"xres"] = xres.objectValue;
	}
	if(ck)
	{
		dict[@"ck"] = ck.objectValue;
	}
	if(ik)
	{
		dict[@"ik"] = ik.objectValue;
	}
	if(autn)
	{
		dict[@"autn"] = autn.objectValue;
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


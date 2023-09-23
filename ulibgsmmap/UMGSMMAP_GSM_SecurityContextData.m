//
//  UMGSMMAP_GSM_SecurityContextData.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_GSM_SecurityContextData.h>

@implementation UMGSMMAP_GSM_SecurityContextData


@synthesize	operationName;
@synthesize	kc;
@synthesize	cksn;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(kc)
	{
		[_asn1_list addObject:kc];
	}
	if(cksn)
	{
		[_asn1_list addObject:cksn];
	}
}


- (UMGSMMAP_GSM_SecurityContextData *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		kc = [[UMGSMMAP_Kc alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		cksn = [[UMGSMMAP_CKSN alloc]initWithASN1Object:o context:context];
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
	return @"GSM-SecurityContextData";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(kc)
	{
		dict[@"kc"] = kc.objectValue;
	}
	if(cksn)
	{
		dict[@"cksn"] = cksn.objectValue;
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


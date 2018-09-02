//
//  UMGSMMAP_Ss_ForBS.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_Ss_ForBS.h"

@implementation UMGSMMAP_Ss_ForBS


@synthesize	operationName;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(_ss_Code)
	{
		[_asn1_list addObject:_ss_Code];
	}
	if(_basicService)
	{
		[_asn1_list addObject:_basicService];
	}
}


- (UMGSMMAP_Ss_ForBS *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		_ss_Code = [[UMGSMMAP_SS_Code alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		_basicService = [[UMGSMMAP_BasicServiceCode alloc]initWithASN1Object:o context:context];
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
	return @"Ss-ForBS";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(_ss_Code)
	{
		dict[@"ss-Code"] = _ss_Code.objectValue;
	}
	if(_basicService)
	{
		dict[@"basicService"] = _basicService.objectValue;
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


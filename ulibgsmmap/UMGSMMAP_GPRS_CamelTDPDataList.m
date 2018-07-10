//
//  UMGSMMAP_GPRS_CamelTDPDataList.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_GPRS_CamelTDPDataList.h"

@implementation UMGSMMAP_GPRS_CamelTDPDataList

@synthesize operationName;

- (void) processBeforeEncode
{
	[super processBeforeEncode];
	asn1_tag.isConstructed=YES;
	asn1_list = [[NSMutableArray alloc]init];
	for(id entry in _sequenceEntries)
	{
		[asn1_list addObject:entry];
	}
}


- (UMGSMMAP_GPRS_CamelTDPDataList *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	_sequenceEntries = [[NSMutableArray alloc]init];
	while(o)
	{
        UMGSMMAP_GPRS_CamelTDPData  *e = [[UMGSMMAP_GPRS_CamelTDPData alloc]initWithASN1Object:o context:context];
		[_sequenceEntries addObject:e];
		o = [self getObjectAtPosition:p++];
	}
	return self;
}

- (NSString *) objectName
{
	return @"GPRS-CamelTDPDataList";
}


- (id) objectValue
{
    UMSynchronizedArray *arr = [[UMSynchronizedArray alloc]init];
    for(UMGSMMAP_GPRS_CamelTDPData *e in _sequenceEntries)
    {
        [arr addObject:e.objectValue];
    }
    return arr;
}


- (void)addEntry:(UMGSMMAP_GPRS_CamelTDPData  *)e
{
    if(_sequenceEntries==NULL)
    {
        _sequenceEntries = [[NSMutableArray alloc]init];
    }
    [_sequenceEntries addObject:e];
}


- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
	return self;
}
@end

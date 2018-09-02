//
//  UMGSMMAP_TPDU_TypeCriterion.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_TPDU_TypeCriterion.h"
#import "UMGSMMAP_MT_SMS_TPDU_Type.h"

@implementation UMGSMMAP_TPDU_TypeCriterion

@synthesize operationName;

- (void) processBeforeEncode
{
	[super processBeforeEncode];
	_asn1_tag.isConstructed=YES;
	_asn1_list = [[NSMutableArray alloc]init];
    for(id entry in _sequenceEntries)
	{
		[_asn1_list addObject:entry];
	}
}


- (UMGSMMAP_TPDU_TypeCriterion *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	_sequenceEntries = [[NSMutableArray alloc]init];
	while(o)
	{
        UMGSMMAP_MT_SMS_TPDU_Type *e = [[UMGSMMAP_MT_SMS_TPDU_Type alloc]initWithASN1Object:o context:NULL];
		[_sequenceEntries addObject:e];
		o = [self getObjectAtPosition:p++];
	}
	return self;
}

- (NSString *) objectName
{
	return @"TPDU-TypeCriterion";
}

- (id) objectValue
{
    UMSynchronizedArray *arr = [[UMSynchronizedArray alloc]init];
    for(UMGSMMAP_MT_SMS_TPDU_Type *e in _sequenceEntries)
    {
        [arr addObject:e.objectValue];
    }
    return arr;
}

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
	return self;
}

- (void)addEntry:(UMGSMMAP_MT_SMS_TPDU_Type *)la
{
    if(_sequenceEntries==NULL)
    {
        _sequenceEntries = [[NSMutableArray alloc]init];
    }
    [_sequenceEntries addObject:la];
}

@end

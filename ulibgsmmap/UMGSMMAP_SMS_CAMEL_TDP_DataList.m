//
//  UMGSMMAP_SMS_CAMEL_TDP_DataList.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_SMS_CAMEL_TDP_DataList.h>

@implementation UMGSMMAP_SMS_CAMEL_TDP_DataList

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


- (UMGSMMAP_SMS_CAMEL_TDP_DataList *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	_sequenceEntries = [[NSMutableArray alloc]init];
	while(o)
	{
        UMGSMMAP_SMS_CAMEL_TDP_Data *e = [[UMGSMMAP_SMS_CAMEL_TDP_Data alloc]initWithASN1Object:o context:context];
		[_sequenceEntries addObject:e];
		o = [self getObjectAtPosition:p++];
	}
	return self;
}

- (NSString *) objectName
{
	return @"SMS-CAMEL-TDP-DataList";
}

- (id) objectValue
{
    UMSynchronizedArray *arr = [[UMSynchronizedArray alloc]init];
    for(UMGSMMAP_SMS_CAMEL_TDP_Data *e in _sequenceEntries)
    {
        [arr addObject:e.objectValue];
    }
    return arr;
}

- (void)addEntry:(UMGSMMAP_SMS_CAMEL_TDP_Data *)e
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

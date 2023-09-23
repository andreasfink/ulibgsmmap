//
//  UMGSMMAP_TeleserviceList.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_TeleserviceList.h>
#import <ulibgsmmap/UMGSMMAP_Ext_TeleserviceCode.h>

@implementation UMGSMMAP_TeleserviceList

@synthesize operationName;

- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	for(id entry in _sequenceEntries)
	{
		[_asn1_list addObject:entry];
	}
}


- (UMGSMMAP_TeleserviceList *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	_sequenceEntries = [[NSMutableArray alloc]init];
	while(o)
	{
        UMGSMMAP_Ext_TeleserviceCode  *e = [[UMGSMMAP_Ext_TeleserviceCode alloc]initWithASN1Object:o context:context];
		[_sequenceEntries addObject:e];
		o = [self getObjectAtPosition:p++];
	}
	return self;
}

- (NSString *) objectName
{
	return @"TeleserviceList";
}

- (id) objectValue
{
    UMSynchronizedArray *arr = [[UMSynchronizedArray alloc]init];
    for(UMGSMMAP_Ext_TeleserviceCode *e in _sequenceEntries)
    {
        [arr addObject:e.objectValue];
    }
    return arr;
}


- (void)addEntry:(UMGSMMAP_Ext_TeleserviceCode  *)e
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


- (void)addServices:(UMGSMMAP_TeleserviceList *)list
{
    for(id o in list.sequenceEntries)
    {
        [_sequenceEntries addObject:o];
    }
}


- (UMGSMMAP_TeleserviceList *)initWithString:(NSString *)str
{
    self = [super init];
    if(self)
    {
        NSArray *codes = [str componentsSeparatedByString:@","];
        _sequenceEntries = [[NSMutableArray alloc]init];
        for(NSString *code in codes)
        {
            UMGSMMAP_Ext_TeleserviceCode *bc = [[UMGSMMAP_Ext_TeleserviceCode alloc]initWithString:code];
            [_sequenceEntries addObject:bc];
        }
    }
    return self;
}


@end

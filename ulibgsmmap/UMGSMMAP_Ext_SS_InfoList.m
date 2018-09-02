//
//  UMGSMMAP_Ext_SS_InfoList.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_Ext_SS_InfoList.h"
#import "UMGSMMAP_Ext_SS_Info.h"
@implementation UMGSMMAP_Ext_SS_InfoList

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


- (UMGSMMAP_Ext_SS_InfoList *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	_sequenceEntries = [[NSMutableArray alloc]init];
	while(o)
	{
        UMGSMMAP_Ext_SS_Info *ei = [[UMGSMMAP_Ext_SS_Info alloc]initWithASN1Object:o context:context];
		[_sequenceEntries addObject:ei];
		o = [self getObjectAtPosition:p++];
	}
	return self;
}

- (NSString *) objectName
{
	return @"Ext-SS-InfoList";
}

- (id) objectValue
{
    NSMutableArray *a = [[NSMutableArray alloc]init];
    for(UMGSMMAP_Ext_SS_Info *entry in _sequenceEntries)
    {
        [a addObject:entry.objectValue];
    }
    return a;
}


- (void)addEntry:(UMGSMMAP_Ext_SS_Info *)e
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

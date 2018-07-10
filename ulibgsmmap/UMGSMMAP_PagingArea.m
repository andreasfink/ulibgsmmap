//
//  UMGSMMAP_PaginArea.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 07.12.16.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//


#import "UMGSMMAP_PagingArea.h"
#import "UMGSMMAP_LocationArea.h"

@implementation UMGSMMAP_PagingArea

@synthesize operationName;

- (void) processBeforeEncode
{
    [super processBeforeEncode];
    [asn1_tag setTagIsConstructed];
    asn1_list = [[NSMutableArray alloc]init];
    for(id entry in _sequenceEntries)
    {
        [asn1_list addObject:entry];
    }
}

- (UMGSMMAP_PagingArea *) processAfterDecodeWithContext:(id)context
{
    int p=0;
    UMASN1Object *o = [self getObjectAtPosition:p++];
    _sequenceEntries = [[NSMutableArray alloc]init];
    while(o)
    {
        UMGSMMAP_LocationArea *la = [[UMGSMMAP_LocationArea alloc]initWithASN1Object:o context:context];
        [_sequenceEntries addObject:la];
        o = [self getObjectAtPosition:p++];
    }
    return self;
}

- (NSString *) objectName
{
    return @"PagingArea";
}

- (id) objectValue
{
    UMSynchronizedArray *arr = [[UMSynchronizedArray alloc]init];
    for(UMGSMMAP_LocationArea *e in _sequenceEntries)
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


- (void)addEntry:(UMGSMMAP_LocationArea *)la
{
    if(_sequenceEntries==NULL)
    {
        _sequenceEntries = [[NSMutableArray alloc]init];
    }
    [_sequenceEntries addObject:la];
}

@end

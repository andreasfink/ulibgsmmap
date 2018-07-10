//
//  UMGSMMAP_SS_List.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_SS_List.h"
#import "UMGSMMAP_SS_Code.h"

@implementation UMGSMMAP_SS_List

@synthesize operationName;
@synthesize sequenceEntries;




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


- (UMGSMMAP_SS_List *) processAfterDecodeWithContext:(id)context
{
    int p=0;
    UMASN1Object *o = [self getObjectAtPosition:p++];
    _sequenceEntries = [[NSMutableArray alloc]init];
    while(o)
    {
        UMGSMMAP_SS_Code *o2 = [[UMGSMMAP_SS_Code alloc]initWithASN1Object:o context:context];
        [_sequenceEntries addObject:o2];
        o = [self getObjectAtPosition:p++];
    }
    return self;
}

- (NSString *) objectName
{
    return @"SS-List";
}
- (id) objectValue
{
    UMSynchronizedArray *arr = [[UMSynchronizedArray alloc]init];

    for(UMGSMMAP_SS_Code *o2 in _sequenceEntries)
    {
        [arr addObject:o2.objectValue];
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

- (void)addEntry:(UMGSMMAP_SS_Code *)code
{
    if(_sequenceEntries==NULL)
    {
        _sequenceEntries = [[NSMutableArray alloc]init];
    }
    [_sequenceEntries addObject:code];
}

@end

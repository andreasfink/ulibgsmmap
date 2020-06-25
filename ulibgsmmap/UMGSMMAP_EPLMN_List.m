//
//  UMGSMMAP_EPLMN_List.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 09.07.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMGSMMAP_EPLMN_List.h"

@implementation UMGSMMAP_EPLMN_List



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


- (UMGSMMAP_EPLMN_List *) processAfterDecodeWithContext:(id)context
{
    int p=0;
    UMASN1Object *o = [self getObjectAtPosition:p++];
    _sequenceEntries = [[NSMutableArray alloc]init];
    while(o)
    {
        UMGSMMAP_PLMN_Id *o2 = [[UMGSMMAP_PLMN_Id alloc]initWithASN1Object:o context:context];
        [_sequenceEntries addObject:o2];
        o = [self getObjectAtPosition:p++];
    }
    return self;
}

- (NSString *) objectName
{
    return @"EPLMN-List";
}
- (id) objectValue
{
    UMSynchronizedArray *arr = [[UMSynchronizedArray alloc]init];

    for(UMGSMMAP_PLMN_Id *o2 in _sequenceEntries)
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

- (UMGSMMAP_EPLMN_List *)initWithString:(NSString *)str
{
    self = [super init];
    if(self)
    {
        _sequenceEntries = [[NSMutableArray alloc]init];

        NSArray *a = [str componentsSeparatedByString:@","];
        for(NSString *s in a)
        {
            UMGSMMAP_PLMN_Id *p = [[UMGSMMAP_PLMN_Id alloc]initWithString:s];
            if(p)
            {
                [_sequenceEntries addObject:p];
            }
        }
    }
    return self;
}

@end

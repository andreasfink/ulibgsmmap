//
//  UMGSMMAP_SentParameterList.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 09.01.19.
//  Copyright © 2019 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMGSMMAP_SentParameterList.h"
#import "UMGSMMAP_SentParameter.h"

@implementation UMGSMMAP_SentParameterList

@synthesize operationName;

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}

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


- (UMGSMMAP_SentParameterList *) processAfterDecodeWithContext:(id)context
{
    int p=0;
    UMASN1Object *o = [self getObjectAtPosition:p++];
    _sequenceEntries = [[NSMutableArray alloc]init];
    while(o)
    {
        UMGSMMAP_SentParameter  *e = [[UMGSMMAP_SentParameter alloc]initWithASN1Object:o context:context];
        [_sequenceEntries addObject:e];
        o = [self getObjectAtPosition:p++];
    }
    return self;
}

- (NSString *) objectName
{
    return @"SentParameterList";
}

- (id) objectValue
{
    UMSynchronizedArray *arr = [[UMSynchronizedArray alloc]init];
    for(UMGSMMAP_SentParameter *e in _sequenceEntries)
    {
        [arr addObject:e.objectValue];
    }
    return arr;
}


- (void)addEntry:(UMGSMMAP_SentParameter  *)e
{
    if(_sequenceEntries==NULL)
    {
        _sequenceEntries = [[NSMutableArray alloc]init];
    }
    [_sequenceEntries addObject:e];
}

@end

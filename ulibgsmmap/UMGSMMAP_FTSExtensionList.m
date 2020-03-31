//
//  UMGSMMAP_FTSExtensionList.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 31.03.20.
//  Copyright © 2020 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMGSMMAP_FTSExtensionList.h"
#import "UMGSMMAP_FTSExtension.h"

@implementation UMGSMMAP_FTSExtensionList

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


- (UMGSMMAP_FTSExtensionList *) processAfterDecodeWithContext:(id)context
{
    int p=0;
    UMASN1Object *o = [self getObjectAtPosition:p++];
    _sequenceEntries = [[NSMutableArray alloc]init];
    while(o)
    {
        UMGSMMAP_FTSExtension  *e = [[UMGSMMAP_FTSExtension alloc]initWithASN1Object:o context:context];
        [_sequenceEntries addObject:e];
        o = [self getObjectAtPosition:p++];
    }
    return self;
}

- (NSString *) objectName
{
    return @"FTSExtensionList";
}


- (id) objectValue
{
    UMSynchronizedArray *arr = [[UMSynchronizedArray alloc]init];
    for(UMGSMMAP_FTSExtension *e in _sequenceEntries)
    {
        [arr addObject:e.objectValue];
    }
    return arr;
}


- (void)addEntry:(UMGSMMAP_FTSExtension  *)e
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

- (UMGSMMAP_FTSExtensionList *)initWithString:(NSString *)str
{
    self = [super init];
    if(self)
    {
        NSArray *codes = [str componentsSeparatedByString:@","];
        for(NSString *code in codes)
        {
            UMGSMMAP_FTSExtension *cd = [[UMGSMMAP_FTSExtension alloc]initWithString:code];
            [self addEntry:cd];
        }
    }
    return self;
}

@end


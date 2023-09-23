//
//  UMGSMMAP_VGCSDataList.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_VGCSDataList.h>

@implementation UMGSMMAP_VGCSDataList

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


- (UMGSMMAP_VGCSDataList *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	_sequenceEntries = [[NSMutableArray alloc]init];
	while(o)
	{
        UMGSMMAP_VoiceGroupCallData  *e = [[UMGSMMAP_VoiceGroupCallData alloc]initWithASN1Object:o context:context];
		[_sequenceEntries addObject:e];
		o = [self getObjectAtPosition:p++];
	}
	return self;
}

- (NSString *) objectName
{
	return @"VGCSDataList";
}

- (id) objectValue
{
    UMSynchronizedArray *arr = [[UMSynchronizedArray alloc]init];
    for(UMGSMMAP_VoiceGroupCallData *e in _sequenceEntries)
    {
        [arr addObject:e.objectValue];
    }
    return arr;
}


- (void)addEntry:(UMGSMMAP_VoiceGroupCallData  *)e
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

- (UMGSMMAP_VGCSDataList *)initWithString:(NSString *)str
{
    self = [super init];
    if(self)
    {
        NSArray *codes = [str componentsSeparatedByString:@","];
        for(NSString *code in codes)
        {
            UMGSMMAP_VoiceGroupCallData *cd = [[UMGSMMAP_VoiceGroupCallData alloc]initWithString:code];
            [self addEntry:cd];
        }
    }
    return self;
}


@end

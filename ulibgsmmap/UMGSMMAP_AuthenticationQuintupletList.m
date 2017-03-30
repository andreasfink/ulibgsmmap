//
//  UMGSMMAP_AuthenticationQuintupletList.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_AuthenticationQuintupletList.h"
#import "UMGSMMAP_AuthenticationQuintuplet.h"

@implementation UMGSMMAP_AuthenticationQuintupletList

@synthesize operationName;
@synthesize sequenceEntries;

- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	for(id entry in sequenceEntries)
	{
		[asn1_list addObject:entry];
	}
}


- (UMGSMMAP_AuthenticationQuintupletList *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	sequenceEntries = [[NSMutableArray alloc]init];
	while(o)
	{
        UMGSMMAP_AuthenticationQuintuplet *quintuplet = [[UMGSMMAP_AuthenticationQuintuplet alloc]initWithASN1Object:o context:context];
        [sequenceEntries addObject:quintuplet];
		o = [self getObjectAtPosition:p++];
	}
	return self;
}


- (NSString *) objectName
{
	return @"AuthenticationQuintupletList";
}

- (id) objectValue
{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    NSUInteger n = [sequenceEntries count];
    for(NSUInteger i=0;i<n;i++)
    {
        [arr addObject:[sequenceEntries[i] objectValue]];
    }
    return arr;
}


- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}

@end

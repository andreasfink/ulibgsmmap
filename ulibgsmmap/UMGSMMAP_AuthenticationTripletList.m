//
//  UMGSMMAP_AuthenticationTripletList.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_AuthenticationTripletList.h"
#import "UMGSMMAP_AuthenticationTriplet.h"

@implementation UMGSMMAP_AuthenticationTripletList

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


- (UMGSMMAP_AuthenticationTripletList *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	sequenceEntries = [[NSMutableArray alloc]init];
	while(o)
	{
        UMGSMMAP_AuthenticationTriplet *triplet = [[UMGSMMAP_AuthenticationTriplet alloc]initWithASN1Object:o context:context];
		[sequenceEntries addObject:triplet];
		o = [self getObjectAtPosition:p++];

	}
	return self;
}

- (NSString *) objectName
{
	return @"AuthenticationTripletList";
}


- (id) objectValue
{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    int n = [sequenceEntries count];
    for(int i=0;i<n;i++)
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

//
//  UMGSMMAP_LCSClientName.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_LCSClientName.h"

@implementation UMGSMMAP_LCSClientName


@synthesize	operationName;
@synthesize	dataCodingScheme;
@synthesize	nameString;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(dataCodingScheme)
	{
		dataCodingScheme.asn1_tag.tagNumber = 0;
		dataCodingScheme.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:dataCodingScheme];
	}
	if(nameString)
	{
		nameString.asn1_tag.tagNumber = 2;
		nameString.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:nameString];
	}
}


- (UMGSMMAP_LCSClientName *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		dataCodingScheme = [[UMGSMMAP_USSD_DataCodingScheme alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		nameString = [[UMGSMMAP_NameString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
        /* ... */
        o = [self getObjectAtPosition:p++];
    }
	return self;
}

- (NSString *) objectName
{
	return @"LCSClientName";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(dataCodingScheme)
	{
		dict[@"dataCodingScheme"] = dataCodingScheme.objectValue;
	}
	if(nameString)
	{
		dict[@"nameString"] = nameString.objectValue;
	}
	return dict;
}

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}


@end


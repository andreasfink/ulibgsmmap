//
//  UMGSMMAP_Ussd_Res.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_Ussd_Res.h"

@implementation UMGSMMAP_Ussd_Res


@synthesize	operationName;
@synthesize	ussd_DataCodingScheme;
@synthesize	ussd_String;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(ussd_DataCodingScheme)
	{
		[asn1_list addObject:ussd_DataCodingScheme];
	}
	if(ussd_String)
	{
		[asn1_list addObject:ussd_String];
	}
}


- (UMGSMMAP_Ussd_Res *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		ussd_DataCodingScheme = [[UMGSMMAP_USSD_DataCodingScheme alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		ussd_String = [[UMGSMMAP_USSD_String alloc]initWithASN1Object:o context:context];
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
	return @"Ussd-Res";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(ussd_DataCodingScheme)
	{
		dict[@"ussd-DataCodingScheme"] = ussd_DataCodingScheme.objectValue;
	}
	if(ussd_String)
	{
		dict[@"ussd-String"] = ussd_String.objectValue;
	}
	return dict;
}

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}


@end


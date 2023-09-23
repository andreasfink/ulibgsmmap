//
//  UMGSMMAP_Ussd_Arg.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_Ussd_Arg.h>

@implementation UMGSMMAP_Ussd_Arg


@synthesize	operationName;
@synthesize	ussd_DataCodingScheme;
@synthesize	ussd_String;
@synthesize	alertingPattern;
@synthesize	msisdn;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(ussd_DataCodingScheme)
	{
		[_asn1_list addObject:ussd_DataCodingScheme];
	}
	if(ussd_String)
	{
		[_asn1_list addObject:ussd_String];
	}
	if(alertingPattern)
	{
		[_asn1_list addObject:alertingPattern];
	}
	if(msisdn)
	{
		msisdn.asn1_tag.tagNumber = 0;
		msisdn.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:msisdn];
	}
}


- (UMGSMMAP_Ussd_Arg *) processAfterDecodeWithContext:(id)context
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
		if(o)
		{
			alertingPattern = [[UMASN1OctetString alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			msisdn = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
        else
        {
            o = [self getObjectAtPosition:p++];
        }
	}
	return self;
}

- (NSString *) objectName
{
	return @"Ussd-Arg";
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
	if(alertingPattern)
	{
		dict[@"alertingPattern"] = alertingPattern.objectValue;
	}
	if(msisdn)
	{
		dict[@"msisdn"] = msisdn.objectValue;
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


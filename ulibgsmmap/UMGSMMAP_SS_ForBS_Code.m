//
//  UMGSMMAP_SS_ForBS_Code.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_SS_ForBS_Code.h"

@implementation UMGSMMAP_SS_ForBS_Code


@synthesize	operationName;
@synthesize	ss_Code;
@synthesize	basicService;
@synthesize	longFTN_Supported;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	_asn1_tag.isConstructed=YES;
	_asn1_list = [[NSMutableArray alloc]init];
	if(ss_Code)
	{
		[_asn1_list addObject:ss_Code];
	}
	if(basicService)
	{
		[_asn1_list addObject:basicService];
	}
	if(longFTN_Supported)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 4;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:n];
	}
}


- (UMGSMMAP_SS_ForBS_Code *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && ([UMGSMMAP_SS_Code tagMatches:o.asn1_tag.tagNumber]) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
	{
		ss_Code = [[UMGSMMAP_SS_Code alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && ([UMGSMMAP_BasicServiceCode tagMatches:o.asn1_tag.tagNumber]) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
	{
		basicService = [[UMGSMMAP_BasicServiceCode alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			longFTN_Supported = YES;
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
	return @"SS-ForBS-Code";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(ss_Code)
	{
		dict[@"ss-Code"] = ss_Code.objectValue;
	}
	if(basicService)
	{
		dict[@"basicService"] = basicService.objectValue;
	}
	if(longFTN_Supported)
	{
		dict[@"longFTN-Supported"] = @(YES);
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


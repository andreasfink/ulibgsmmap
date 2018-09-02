//
//  UMGSMMAP_RegisterSS_Arg.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_RegisterSS_Arg.h"

@implementation UMGSMMAP_RegisterSS_Arg


@synthesize	operationName;
@synthesize	ss_Code;
@synthesize	basicService;
@synthesize	forwardedToNumber;
@synthesize	forwardedToSubaddress;
@synthesize	noReplyConditionTime;
@synthesize	defaultPriority;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(ss_Code)
	{
		[_asn1_list addObject:ss_Code];
	}
	if(basicService)
	{
		[_asn1_list addObject:basicService];
	}
	if(forwardedToNumber)
	{
		forwardedToNumber.asn1_tag.tagNumber = 4;
		forwardedToNumber.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:forwardedToNumber];
	}
	if(forwardedToSubaddress)
	{
		forwardedToSubaddress.asn1_tag.tagNumber = 6;
		forwardedToSubaddress.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:forwardedToSubaddress];
	}
	if(noReplyConditionTime)
	{
		noReplyConditionTime.asn1_tag.tagNumber = 5;
		noReplyConditionTime.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:noReplyConditionTime];
	}
	if(defaultPriority)
	{
		defaultPriority.asn1_tag.tagNumber = 7;
		defaultPriority.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:defaultPriority];
	}
}


- (UMGSMMAP_RegisterSS_Arg *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		ss_Code = [[UMGSMMAP_SS_Code alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		basicService = [[UMGSMMAP_BasicServiceCode alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		forwardedToNumber = [[UMGSMMAP_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 6) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		forwardedToSubaddress = [[UMGSMMAP_ISDN_SubaddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		noReplyConditionTime = [[UMGSMMAP_NoReplyConditionTime alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if((o) && (o.asn1_tag.tagNumber == 7) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			defaultPriority = [[UMGSMMAP_EMLPP_Priority alloc]initWithASN1Object:o context:context];
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
	return @"RegisterSS-Arg";
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
	if(forwardedToNumber)
	{
		dict[@"forwardedToNumber"] = forwardedToNumber.objectValue;
	}
	if(forwardedToSubaddress)
	{
		dict[@"forwardedToSubaddress"] = forwardedToSubaddress.objectValue;
	}
	if(noReplyConditionTime)
	{
		dict[@"noReplyConditionTime"] = noReplyConditionTime.objectValue;
	}
	if(defaultPriority)
	{
		dict[@"defaultPriority"] = defaultPriority.objectValue;
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


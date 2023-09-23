//
//  UMGSMMAP_ForwardingFeature.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_ForwardingFeature.h>

@implementation UMGSMMAP_ForwardingFeature


@synthesize	operationName;
@synthesize	basicService;
@synthesize	ss_Status;
@synthesize	forwardedToNumber;
@synthesize	forwardedToSubaddress;
@synthesize	forwardingOptions;
@synthesize	noReplyConditionTime;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(basicService)
	{
		[_asn1_list addObject:basicService];
	}
	if(ss_Status)
	{
		ss_Status.asn1_tag.tagNumber = 4;
		ss_Status.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:ss_Status];
	}
	if(forwardedToNumber)
	{
		forwardedToNumber.asn1_tag.tagNumber = 5;
		forwardedToNumber.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:forwardedToNumber];
	}
	if(forwardedToSubaddress)
	{
		forwardedToSubaddress.asn1_tag.tagNumber = 8;
		forwardedToSubaddress.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:forwardedToSubaddress];
	}
	if(forwardingOptions)
	{
		forwardingOptions.asn1_tag.tagNumber = 6;
		forwardingOptions.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:forwardingOptions];
	}
	if(noReplyConditionTime)
	{
		noReplyConditionTime.asn1_tag.tagNumber = 7;
		noReplyConditionTime.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:noReplyConditionTime];
	}
}


- (UMGSMMAP_ForwardingFeature *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		basicService = [[UMGSMMAP_BasicServiceCode alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ss_Status = [[UMGSMMAP_SS_Status alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		forwardedToNumber = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 8) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		forwardedToSubaddress = [[UMGSMMAP_ISDN_SubaddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 6) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		forwardingOptions = [[UMGSMMAP_ForwardingOptions alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 7) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		noReplyConditionTime = [[UMGSMMAP_NoReplyConditionTime alloc]initWithASN1Object:o context:context];
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
	return @"ForwardingFeature";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(basicService)
	{
		dict[@"basicService"] = basicService.objectValue;
	}
	if(ss_Status)
	{
		dict[@"ss-Status"] = ss_Status.objectValue;
	}
	if(forwardedToNumber)
	{
		dict[@"forwardedToNumber"] = forwardedToNumber.objectValue;
	}
	if(forwardedToSubaddress)
	{
		dict[@"forwardedToSubaddress"] = forwardedToSubaddress.objectValue;
	}
	if(forwardingOptions)
	{
		dict[@"forwardingOptions"] = forwardingOptions.objectValue;
	}
	if(noReplyConditionTime)
	{
		dict[@"noReplyConditionTime"] = noReplyConditionTime.objectValue;
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


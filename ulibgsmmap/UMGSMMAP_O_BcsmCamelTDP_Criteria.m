//
//  UMGSMMAP_O_BcsmCamelTDP_Criteria.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_O_BcsmCamelTDP_Criteria.h>

@implementation UMGSMMAP_O_BcsmCamelTDP_Criteria


@synthesize	operationName;
@synthesize	o_BcsmTriggerDetectionPoint;
@synthesize	destinationNumberCriteria;
@synthesize	basicServiceCriteria;
@synthesize	callTypeCriteria;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(o_BcsmTriggerDetectionPoint)
	{
		[_asn1_list addObject:o_BcsmTriggerDetectionPoint];
	}
	if(destinationNumberCriteria)
	{
		destinationNumberCriteria.asn1_tag.tagNumber = 0;
		destinationNumberCriteria.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:destinationNumberCriteria];
	}
	if(basicServiceCriteria)
	{
		basicServiceCriteria.asn1_tag.tagNumber = 1;
		basicServiceCriteria.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:basicServiceCriteria];
	}
	if(callTypeCriteria)
	{
		callTypeCriteria.asn1_tag.tagNumber = 2;
		callTypeCriteria.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:callTypeCriteria];
	}
}


- (UMGSMMAP_O_BcsmCamelTDP_Criteria *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		o_BcsmTriggerDetectionPoint = [[UMGSMMAP_O_BcsmTriggerDetectionPoint alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		destinationNumberCriteria = [[UMGSMMAP_DestinationNumberCriteria alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		basicServiceCriteria = [[UMGSMMAP_BasicServiceCriteria alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		callTypeCriteria = [[UMGSMMAP_CallTypeCriteria alloc]initWithASN1Object:o context:context];
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
	return @"O-BcsmCamelTDP-Criteria";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(o_BcsmTriggerDetectionPoint)
	{
		dict[@"o-BcsmTriggerDetectionPoint"] = o_BcsmTriggerDetectionPoint.objectValue;
	}
	if(destinationNumberCriteria)
	{
		dict[@"destinationNumberCriteria"] = destinationNumberCriteria.objectValue;
	}
	if(basicServiceCriteria)
	{
		dict[@"basicServiceCriteria"] = basicServiceCriteria.objectValue;
	}
	if(callTypeCriteria)
	{
		dict[@"callTypeCriteria"] = callTypeCriteria.objectValue;
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


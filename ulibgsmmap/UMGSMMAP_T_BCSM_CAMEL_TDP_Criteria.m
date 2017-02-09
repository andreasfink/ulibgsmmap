//
//  UMGSMMAP_T_BCSM_CAMEL_TDP_Criteria.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_T_BCSM_CAMEL_TDP_Criteria.h"

@implementation UMGSMMAP_T_BCSM_CAMEL_TDP_Criteria


@synthesize	operationName;
@synthesize	t_BCSM_TriggerDetectionPoint;
@synthesize	basicServiceCriteria;
@synthesize	t_CauseValueCriteria;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	asn1_tag.isConstructed=YES;
	asn1_list = [[NSMutableArray alloc]init];
	if(t_BCSM_TriggerDetectionPoint)
	{
		[asn1_list addObject:t_BCSM_TriggerDetectionPoint];
	}
	if(basicServiceCriteria)
	{
		basicServiceCriteria.asn1_tag.tagNumber = 0;
		basicServiceCriteria.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:basicServiceCriteria];
	}
	if(t_CauseValueCriteria)
	{
		t_CauseValueCriteria.asn1_tag.tagNumber = 1;
		t_CauseValueCriteria.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:t_CauseValueCriteria];
	}
}


- (UMGSMMAP_T_BCSM_CAMEL_TDP_Criteria *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && ([UMGSMMAP_T_BcsmTriggerDetectionPoint tagMatches:o.asn1_tag.tagNumber]) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
	{
		t_BCSM_TriggerDetectionPoint = [[UMGSMMAP_T_BcsmTriggerDetectionPoint alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		basicServiceCriteria = [[UMGSMMAP_BasicServiceCriteria alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		t_CauseValueCriteria = [[UMGSMMAP_T_CauseValueCriteria alloc]initWithASN1Object:o context:context];
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
	return @"T-BCSM-CAMEL-TDP-Criteria";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(t_BCSM_TriggerDetectionPoint)
	{
		dict[@"t-BCSM-TriggerDetectionPoint"] = t_BCSM_TriggerDetectionPoint.objectValue;
	}
	if(basicServiceCriteria)
	{
		dict[@"basicServiceCriteria"] = basicServiceCriteria.objectValue;
	}
	if(t_CauseValueCriteria)
	{
		dict[@"t-CauseValueCriteria"] = t_CauseValueCriteria.objectValue;
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


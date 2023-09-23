//
//  UMGSMMAP_MT_smsCAMELTDP_Criteria.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_MT_smsCAMELTDP_Criteria.h>

@implementation UMGSMMAP_MT_smsCAMELTDP_Criteria


@synthesize	operationName;
@synthesize	sms_TriggerDetectionPoint;
@synthesize	tpdu_TypeCriterion;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	_asn1_tag.isConstructed=YES;
	_asn1_list = [[NSMutableArray alloc]init];
	if(sms_TriggerDetectionPoint)
	{
		[_asn1_list addObject:sms_TriggerDetectionPoint];
	}
	if(tpdu_TypeCriterion)
	{
		tpdu_TypeCriterion.asn1_tag.tagNumber = 0;
		tpdu_TypeCriterion.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:tpdu_TypeCriterion];
	}
}


- (UMGSMMAP_MT_smsCAMELTDP_Criteria *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && ([UMGSMMAP_SMS_TriggerDetectionPoint tagMatches:o.asn1_tag.tagNumber]) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
	{
		sms_TriggerDetectionPoint = [[UMGSMMAP_SMS_TriggerDetectionPoint alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		tpdu_TypeCriterion = [[UMGSMMAP_TPDU_TypeCriterion alloc]initWithASN1Object:o context:context];
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
	return @"MT-smsCAMELTDP-Criteria";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(sms_TriggerDetectionPoint)
	{
		dict[@"sms-TriggerDetectionPoint"] = sms_TriggerDetectionPoint.objectValue;
	}
	if(tpdu_TypeCriterion)
	{
		dict[@"tpdu-TypeCriterion"] = tpdu_TypeCriterion.objectValue;
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


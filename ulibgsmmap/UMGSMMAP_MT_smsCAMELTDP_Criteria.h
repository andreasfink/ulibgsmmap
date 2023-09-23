//
//  UMGSMMAP_MT_smsCAMELTDP_Criteria.h
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

#import <ulibgsmmap/UMGSMMAP_SMS_TriggerDetectionPoint.h>
#import <ulibgsmmap/UMGSMMAP_TPDU_TypeCriterion.h>

@interface UMGSMMAP_MT_smsCAMELTDP_Criteria : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_SMS_TriggerDetectionPoint *sms_TriggerDetectionPoint;
	UMGSMMAP_TPDU_TypeCriterion *tpdu_TypeCriterion;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_SMS_TriggerDetectionPoint *sms_TriggerDetectionPoint;
@property(readwrite,strong)	UMGSMMAP_TPDU_TypeCriterion *tpdu_TypeCriterion;


- (void)processBeforeEncode;
- (UMGSMMAP_MT_smsCAMELTDP_Criteria *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

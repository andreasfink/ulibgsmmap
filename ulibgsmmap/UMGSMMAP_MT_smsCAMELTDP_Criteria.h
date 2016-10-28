//
//  UMGSMMAP_MT_smsCAMELTDP_Criteria.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_SMS_TriggerDetectionPoint.h"
#import "UMGSMMAP_TPDU_TypeCriterion.h"

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
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

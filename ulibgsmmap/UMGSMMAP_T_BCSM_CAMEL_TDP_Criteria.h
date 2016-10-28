//
//  UMGSMMAP_T_BCSM_CAMEL_TDP_Criteria.h
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

#import "UMGSMMAP_T_BcsmTriggerDetectionPoint.h"
#import "UMGSMMAP_BasicServiceCriteria.h"
#import "UMGSMMAP_T_CauseValueCriteria.h"

@interface UMGSMMAP_T_BCSM_CAMEL_TDP_Criteria : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_T_BcsmTriggerDetectionPoint *t_BCSM_TriggerDetectionPoint;
	UMGSMMAP_BasicServiceCriteria *basicServiceCriteria;
	UMGSMMAP_T_CauseValueCriteria *t_CauseValueCriteria;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_T_BcsmTriggerDetectionPoint *t_BCSM_TriggerDetectionPoint;
@property(readwrite,strong)	UMGSMMAP_BasicServiceCriteria *basicServiceCriteria;
@property(readwrite,strong)	UMGSMMAP_T_CauseValueCriteria *t_CauseValueCriteria;


- (void)processBeforeEncode;
- (UMGSMMAP_T_BCSM_CAMEL_TDP_Criteria *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

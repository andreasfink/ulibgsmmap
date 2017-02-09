//
//  UMGSMMAP_GPRS_TriggerDetectionPoint.h
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"


typedef enum UMGSMMAP_GPRS_TriggerDetectionPoint_enum
{
    UMGSMMAP_GPRS_TriggerDetectionPoint_attach = 1,
    UMGSMMAP_GPRS_TriggerDetectionPoint_attachChangeOfPosition = 2,
    UMGSMMAP_GPRS_TriggerDetectionPoint_pdp_ContextEstablishment = 11,
    UMGSMMAP_GPRS_TriggerDetectionPoint_pdp_ContextEstablishmentAcknowledgement = 12,
    UMGSMMAP_GPRS_TriggerDetectionPoint_pdp_ContextChangeOfPosition = 14,
}  UMGSMMAP_GPRS_TriggerDetectionPoint_enum;


@interface UMGSMMAP_GPRS_TriggerDetectionPoint : UMASN1Enumerated<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
}
@property(readwrite,strong)    NSString *operationName;

- (UMGSMMAP_GPRS_TriggerDetectionPoint *)initWithString:(NSString *)s;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

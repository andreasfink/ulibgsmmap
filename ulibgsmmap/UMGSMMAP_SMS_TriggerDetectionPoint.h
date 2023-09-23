//
//  UMGSMMAP_SMS_TriggerDetectionPoint.h
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


typedef enum UMGSMMAP_SMS_TriggerDetectionPoint_enum
{
    UMGSMMAP_SMS_TriggerDetectionPoint_sms_CollectedInfo = 1,
    UMGSMMAP_SMS_TriggerDetectionPoint_sms_DeliveryRequest = 2,
}  UMGSMMAP_SMS_TriggerDetectionPoint_enum;


@interface UMGSMMAP_SMS_TriggerDetectionPoint : UMASN1Enumerated<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
}
@property(readwrite,strong)    NSString *operationName;

- (UMGSMMAP_SMS_TriggerDetectionPoint *)initWithString:(NSString *)s;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

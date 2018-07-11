//
//  UMGSMMAP_MT_SMS_TPDU_Type.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 10.07.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"


typedef enum UMGSMMAP_MT_SMS_TPDU_Type_enum
{
    UMGSMMAP_MT_SMS_TPDU_Type_sms_DELIVER = 0,
    UMGSMMAP_MT_SMS_TPDU_Type_sms_SUBMIT_REPORT = 1,
    UMGSMMAP_MT_SMS_TPDU_Type_sms_STATUS_REPORT = 2,
} UMGSMMAP_MT_SMS_TPDU_Type_enum;

@interface UMGSMMAP_MT_SMS_TPDU_Type : UMASN1Enumerated<UMGSMMAP_asn1_protocol>
{
    NSString *operationName;
}

@property(readwrite,strong)    NSString *operationName;

- (UMGSMMAP_MT_SMS_TPDU_Type *)initWithString:(NSString *)s;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

//
//  UMGSMMAP_AdditionalRequestedCAMEL_SubscriptionInfo.h
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


typedef enum UMGSMMAP_AdditionalRequestedCAMEL_SubscriptionInfo_enum
{
    UMGSMMAP_AdditionalRequestedCAMEL_SubscriptionInfo_mt_sms_CSI = 0,
    UMGSMMAP_AdditionalRequestedCAMEL_SubscriptionInfo_mg_csi = 1,
    UMGSMMAP_AdditionalRequestedCAMEL_SubscriptionInfo_o_IM_CSI = 2,
    UMGSMMAP_AdditionalRequestedCAMEL_SubscriptionInfo_d_IM_CSI = 3,
    UMGSMMAP_AdditionalRequestedCAMEL_SubscriptionInfo_vt_IM_CSI = 4,
}  UMGSMMAP_AdditionalRequestedCAMEL_SubscriptionInfo_enum;


@interface UMGSMMAP_AdditionalRequestedCAMEL_SubscriptionInfo : UMASN1Enumerated<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
}
@property(readwrite,strong)    NSString *operationName;

- (UMGSMMAP_AdditionalRequestedCAMEL_SubscriptionInfo *)initWithString:(NSString *)s;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

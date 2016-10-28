//
//  UMGSMMAP_RequestedCAMEL_SubscriptionInfo.h
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


typedef enum UMGSMMAP_RequestedCAMEL_SubscriptionInfo_enum
{
    UMGSMMAP_RequestedCAMEL_SubscriptionInfo_o_CSI = 0,
    UMGSMMAP_RequestedCAMEL_SubscriptionInfo_t_CSI = 1,
    UMGSMMAP_RequestedCAMEL_SubscriptionInfo_vt_CSI = 2,
    UMGSMMAP_RequestedCAMEL_SubscriptionInfo_tif_CSI = 3,
    UMGSMMAP_RequestedCAMEL_SubscriptionInfo_gprs_CSI = 4,
    UMGSMMAP_RequestedCAMEL_SubscriptionInfo_mo_sms_CSI = 5,
    UMGSMMAP_RequestedCAMEL_SubscriptionInfo_ss_CSI = 6,
    UMGSMMAP_RequestedCAMEL_SubscriptionInfo_m_CSI = 7,
    UMGSMMAP_RequestedCAMEL_SubscriptionInfo_d_csi = 8,
}  UMGSMMAP_RequestedCAMEL_SubscriptionInfo_enum;


@interface UMGSMMAP_RequestedCAMEL_SubscriptionInfo : UMASN1Enumerated<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
}
@property(readwrite,strong)    NSString *operationName;

- (UMGSMMAP_RequestedCAMEL_SubscriptionInfo *)initWithString:(NSString *)s;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

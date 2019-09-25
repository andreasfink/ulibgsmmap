//
//  UMGSMMAP_AdditionalRequestedCAMEL_SubscriptionInfo.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_AdditionalRequestedCAMEL_SubscriptionInfo.h"

@implementation UMGSMMAP_AdditionalRequestedCAMEL_SubscriptionInfo

@synthesize operationName;

- (void)setEnumDefinition
{
    _enumDefinition = @ {
        @"mt-sms-CSI" : @(UMGSMMAP_AdditionalRequestedCAMEL_SubscriptionInfo_mt_sms_CSI),
        @"mg-csi" : @(UMGSMMAP_AdditionalRequestedCAMEL_SubscriptionInfo_mg_csi),
        @"o-IM-CSI" : @(UMGSMMAP_AdditionalRequestedCAMEL_SubscriptionInfo_o_IM_CSI),
        @"d-IM-CSI" : @(UMGSMMAP_AdditionalRequestedCAMEL_SubscriptionInfo_d_IM_CSI),
        @"vt-IM-CSI" : @(UMGSMMAP_AdditionalRequestedCAMEL_SubscriptionInfo_vt_IM_CSI),
    };
}
- (NSString *) objectName
{
	return @"AdditionalRequestedCAMEL-SubscriptionInfo";
}

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}



@end


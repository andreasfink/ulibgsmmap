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

- (UMASN1Enumerated *)initWithString:(NSString *)s
{
    s = [s stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if([s isEqualToString:@"mt_sms_CSI"])
    {
        return [super initWithValue:0];
    }
    if([s isEqualToString:@"mg_csi"])
    {
        return [super initWithValue:1];
    }
    if([s isEqualToString:@"o_IM_CSI"])
    {
        return [super initWithValue:2];
    }
    if([s isEqualToString:@"d_IM_CSI"])
    {
        return [super initWithValue:3];
    }
    if([s isEqualToString:@"vt_IM_CSI"])
    {
        return [super initWithValue:4];
    }
    return [super initWithValue:(int64_t)[s integerValue]];
}

- (NSString *) objectName
{
	return @"AdditionalRequestedCAMEL-SubscriptionInfo";
}

- (id) objectValue
{
    switch(self.value)
    {
        case(0):
            return @"mt_sms_CSI (0)";
            break;
        case(1):
            return @"mg_csi (1)";
            break;
        case(2):
            return @"o_IM_CSI (2)";
            break;
        case(3):
            return @"d_IM_CSI (3)";
            break;
        case(4):
            return @"vt_IM_CSI (4)";
            break;
        default:
            return [NSString stringWithFormat:@"undefined (%d)",(int)self.value];
    }
}

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}



@end


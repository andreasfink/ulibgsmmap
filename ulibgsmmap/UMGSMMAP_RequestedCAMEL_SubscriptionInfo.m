//
//  UMGSMMAP_RequestedCAMEL_SubscriptionInfo.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_RequestedCAMEL_SubscriptionInfo.h"

@implementation UMGSMMAP_RequestedCAMEL_SubscriptionInfo

@synthesize operationName;

- (UMASN1Enumerated *)initWithString:(NSString *)s
{
    s = [s stringByTrimmingCharactersInSet:[UMObject whitespaceAndNewlineCharacterSet]];
    if([s isEqualToString:@"o_CSI"])
    {
        return [super initWithValue:0];
    }
    if([s isEqualToString:@"t_CSI"])
    {
        return [super initWithValue:1];
    }
    if([s isEqualToString:@"vt_CSI"])
    {
        return [super initWithValue:2];
    }
    if([s isEqualToString:@"tif_CSI"])
    {
        return [super initWithValue:3];
    }
    if([s isEqualToString:@"gprs_CSI"])
    {
        return [super initWithValue:4];
    }
    if([s isEqualToString:@"mo_sms_CSI"])
    {
        return [super initWithValue:5];
    }
    if([s isEqualToString:@"ss_CSI"])
    {
        return [super initWithValue:6];
    }
    if([s isEqualToString:@"m_CSI"])
    {
        return [super initWithValue:7];
    }
    if([s isEqualToString:@"d_csi"])
    {
        return [super initWithValue:8];
    }
    return [super initWithValue:(int64_t)[s integerValue]];
}

- (NSString *) objectName
{
	return @"RequestedCAMEL-SubscriptionInfo";
}

- (id) objectValue
{
    switch(self.value)
    {
        case(0):
            return @"o_CSI (0)";
            break;
        case(1):
            return @"t_CSI (1)";
            break;
        case(2):
            return @"vt_CSI (2)";
            break;
        case(3):
            return @"tif_CSI (3)";
            break;
        case(4):
            return @"gprs_CSI (4)";
            break;
        case(5):
            return @"mo_sms_CSI (5)";
            break;
        case(6):
            return @"ss_CSI (6)";
            break;
        case(7):
            return @"m_CSI (7)";
            break;
        case(8):
            return @"d_csi (8)";
            break;
        default:
            return [NSString stringWithFormat:@"undefined (%d)",(int)self.value];
    }
}

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}



@end


//
//  UMGSMMAP_VelocityEstimate.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_VelocityEstimate.h"
/*
 -- Refers to Velocity description defined in 3GPP TS 23.032.
 -- This is composed of 4 or more octets with an internal structure according to -- 3GPP TS 23.032
 -- Octet 1: Type of velocity, only the following types in 3GPP TS 23.032 are allowed:
 --    (a) Horizontal Velocity
 --    (b) Horizontal with Vertical Velocity
 --    (c) Horizontal Velocity with Uncertainty
 --    (d) Horizontal with Vertical Velocity and Uncertainty
 -- For types Horizontal with Vertical Velocity and Horizontal with Vertical Velocity
 -- and Uncertainty, the direction of the Vertical Speed is also included in Octet 1
 -- Any other value in octet 1 shall be treated as invalid
 Octets  2 to 4 for case (a) Horizontal velocity:
    Bearing (1 octet)
    Horizontal Speed (2 octet)
 Octets 2 to 5 for case (b) – Horizontal with Vertical Velocity: 
    Bearing (1 octet)
    Horizontal Speed (2 octet)
    Vertical Speed (2 octet)
 Octet 2 to 5 for case (c) – Horizontal velocity with Uncertainty: 
    Bearing (1 octet)
    Horizontal Speed (2 octet)
    Uncertainty Speed (1 octet)
 Octet 2 to 7 for case (d) – Horizontal with Vertical Velocity and Uncertainty:
    Bearing (1 octet)
    Horizontal Speed (2 octet)
    Vertical Speed (1 octet)
    Horizontal Uncertainty Speed (1 octet)
    Vertical Uncertainty Speed (1 octet)
 */
@implementation UMGSMMAP_VelocityEstimate

@synthesize operationName;

- (NSString *) objectName
{
	return @"UMGSMMAP_VelocityEstimate";
}

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
	return self;
}

- (id) objectValue
{
    UMSynchronizedSortedDictionary *dict = [self decodeVelocity];
    dict[@"rawData"] = super.objectValue;
    return dict;
}

- (UMSynchronizedSortedDictionary *)decodeVelocity
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    const uint8_t *bytes = _asn1_data.bytes;
    NSUInteger len = _asn1_data.length;
    int horizontalSpeed;
    int verticalSpeed;
    int horizontalUncertainty;
    int verticalUncertainty;
    int bearing;
    BOOL verticalDirectionUp;
    
    if(len <1)
    {
        dict[@"error"] = @"packet-too-short";
    }
    else
    {
        
        int velocityType = (bytes[0] & 0xF0) >> 8;
        if((bytes[0] & 0x02) == 0)
        {
            verticalDirectionUp = YES;
        }
        else
        {
            verticalDirectionUp = NO;
        }
        switch(velocityType)
        {
            case 0:
                if(len <5)
                {
                    dict[@"error"] = @"packet-too-short";
                }
                else
                {
                    bearing         = bytes[1] << 8 | bytes[2];
                    horizontalSpeed = bytes[3] << 8 | bytes[4];
                    dict[@"bearing"] = @(bearing);
                    dict[@"horizontal-speed"] = @(horizontalSpeed);
                }
                break;
            case 1:
                if(len <6)
                {
                    dict[@"error"] = @"packet-too-short";
                }
                else
                {
                    bearing         = bytes[1] << 8 | bytes[2];
                    horizontalSpeed = bytes[3] << 8 | bytes[4];
                    verticalSpeed   = bytes[5];
                    dict[@"bearing"] = @(bearing);
                    dict[@"horizontal-speed"] = @(horizontalSpeed);
                    dict[@"vertical-speed"] = @(verticalSpeed);
                    if(verticalDirectionUp)
                    {
                        dict[@"vertical-direction"] = @"up";
                    }
                    else
                    {
                        dict[@"vertical-direction"] = @"down";
                    }
                }
                break;
            case 2:
                if(len <6)
                {
                    dict[@"error"] = @"packet-too-short";
                }
                else
                {
                    bearing         = bytes[1] << 8 | bytes[2];
                    horizontalSpeed = bytes[3] << 8 | bytes[4];
                    horizontalUncertainty     = bytes[5];
                    dict[@"bearing"] = @(bearing);
                    dict[@"horizontal-speed"] = @(horizontalSpeed);
                    dict[@"horizontal-uncertainty"] = @(horizontalUncertainty);
                }
                break;
            case 3:
                if(len <8)
                {
                    dict[@"error"] = @"packet-too-short";
                    return dict;
                }
                else
                {
                    bearing         = bytes[1] << 8 | bytes[2];
                    horizontalSpeed = bytes[3] << 8 | bytes[4];
                    verticalSpeed   = bytes[5];
                    horizontalUncertainty  = bytes[6];
                    verticalUncertainty    = bytes[7];
                    dict[@"bearing"] = @(bearing);
                    dict[@"horizontal-speed"] = @(horizontalSpeed);
                    dict[@"horizontal-uncertainty"] = @(horizontalUncertainty);
                    dict[@"vertical-speed"] = @(verticalSpeed);
                    dict[@"vertical-uncertainty"] = @(verticalUncertainty);
                }
                break;
            default:
                dict[@"error"] = @"unknown-velocity-type";
                break;
        }
    }
    return dict;
}

@end

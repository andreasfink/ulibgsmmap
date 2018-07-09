//
//  UMGSMMAP_SupportedLCS_CapabilitySets.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 05.03.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//


/*
 lcsCapabilitySet1 (0),
 lcsCapabilitySet2 (1),
 lcsCapabilitySet3 (2),
 lcsCapabilitySet4 (3) ,
 lcsCapabilitySet5 (4) } (SIZE (2..16))
 
 */
#import "UMGSMMAP_SupportedLCS_CapabilitySets.h"

@implementation UMGSMMAP_SupportedLCS_CapabilitySets


- (UMGSMMAP_SupportedLCS_CapabilitySets *)initWithString:(NSString *)str
{
    const char bytes[1] = { 0 };
    NSData *d = [NSData dataWithBytes:bytes length:1];
    self = [super initWithValue:d bitcount:6];
    if(self)
    {
        NSCharacterSet *whitespace  = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        
        NSArray *array = [str componentsSeparatedByString:@","];
        for(NSString *component in array)
        {
            NSString *s = [component stringByTrimmingCharactersInSet:whitespace];
            if([s isEqualToString:@"1"]|| [s isEqualToString:@"lcsCapabilitySet1"])
            {
                [self setBit:0];
            }
            if([s isEqualToString:@"2"]|| [s isEqualToString:@"lcsCapabilitySet2"])
            {
                [self setBit:1];
            }
            if([s isEqualToString:@"3"]|| [s isEqualToString:@"lcsCapabilitySet3"])
            {
                [self setBit:2];
            }
            if([s isEqualToString:@"4"]|| [s isEqualToString:@"lcsCapabilitySet4"])
            {
                [self setBit:3];
            }
            if([s isEqualToString:@"5"] || [s isEqualToString:@"lcsCapabilitySet5"])
            {
                [self setBit:4];
            }
        }
    }
    return self;
}

@end

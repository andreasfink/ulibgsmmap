//
//  UMGSMMAP_RequestingNodeType.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 06.03.17.
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMGSMMAP_RequestingNodeType.h"

@implementation UMGSMMAP_RequestingNodeType

@synthesize operationName;

- (UMGSMMAP_RequestingNodeType *)initWithString:(NSString *)s
{
    s = [s stringByTrimmingCharactersInSet:[UMObject whitespaceAndNewlineCharacterSet]];
    if([s isEqualToString:@"vlr"])
    {
        return [super initWithValue:0];
    }
    else if([s isEqualToString:@"sgsn"])
    {
        return [super initWithValue:1];
    }
    if([s isEqualToString:@"s-cscf"])
    {
        return [super initWithValue:2];
    }
    if([s isEqualToString:@"bsf"])
    {
        return [super initWithValue:3];
    }
    if([s isEqualToString:@"gan-aaa-server"])
    {
        return [super initWithValue:4];
    }
    if([s isEqualToString:@"gan-aaa-server"])
    {
        return [super initWithValue:4];
    }
    if([s isEqualToString:@"wlan-aaa-server"])
    {
        return [super initWithValue:5];
    }
    if([s isEqualToString:@"mme"])
    {
        return [super initWithValue:16];
    }
    if([s isEqualToString:@"mme-sgsn"])
    {
        return [super initWithValue:17];
    }
    return [super initWithValue:(int64_t)[s integerValue]];
}

- (NSString *) objectName
{
    return @"RequestingNodeType";
}

- (id) objectValue
{
    switch(self.value)
    {
        case(0):
            return @"vlr (0)";
            break;
        case(1):
            return @"sgsn (1)";
            break;
        case(2):
            return @"s-cscf (2)";
            break;
        case(3):
            return @"bsf (3)";
            break;
        case(4):
            return @"gan-aaa-server (4)";
            break;
        case(5):
            return @"wlan-aaa-server (5)";
            break;
        case(16):
            return @"mme (16)";
            break;
        case(17):
            return @"mme-sgsn (17)";
            break;
        default:
            return [NSString stringWithFormat:@"undefined (%d)",(int)self.value];
    }
}
@end

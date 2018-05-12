//
//  UMGSMMAP_SM_DeliveryNotIntended.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 09.05.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMGSMMAP_SM_DeliveryNotIntended.h"

@implementation UMGSMMAP_SM_DeliveryNotIntended

- (UMASN1Enumerated *)initWithString:(NSString *)s
{
    s = [s stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if([s isEqualToString:@"onlyIMSI-requested"])
    {
        return [super initWithValue:0];
    }
    if([s isEqualToString:@"onlyMCC-MNC-requested"])
    {
        return [super initWithValue:1];
    }
    return [super initWithValue:(int64_t)[s integerValue]];
}

- (NSString *) objectName
{
    return @"SM-DeliveryNotIntended";
}

- (id) objectValue
{
    switch(self.value)
    {
        case(0):
            return @"onlyIMSI-requested (0)";
            break;
        case(1):
            return @"onlyMCC-MNC-requested (1)";
            break;
        default:
            return [NSString stringWithFormat:@"undefined (%d)",(int)self.value];
    }
}



@end


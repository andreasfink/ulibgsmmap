//
//  UMGSMMAP_AccessRestrictionData.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 23.09.19.
//  Copyright © 2019 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMGSMMAP_AccessRestrictionData.h"

@implementation UMGSMMAP_AccessRestrictionData


- (NSString *) objectName
{
    return @"AccessRestrictionData";
}

- (UMGSMMAP_AccessRestrictionData *)initWithString:(NSString *)str
{
    const char bytes[1] = { 0 };
    NSData *d = [NSData dataWithBytes:bytes length:1];
    self = [super initWithValue:d bitcount:6];
    if(self)
    {
        NSCharacterSet *whitespace  = [UMObject whitespaceAndNewlineCharacterSet];

        NSArray *array = [str componentsSeparatedByString:@","];
        for(NSString *component in array)
        {
            NSString *s = [component stringByTrimmingCharactersInSet:whitespace];
            if([s isEqualToString:@"utranNotAllowed"])
            {
                [self setBit:0];
            }
            if([s isEqualToString:@"geranNotAllowed"])
            {
                [self setBit:1];
            }
            if([s isEqualToString:@"ganNotAllowed"])
            {
                [self setBit:2];
            }
            if([s isEqualToString:@"i-hspa-evolutionNotAllowed"])
            {
                [self setBit:3];
            }
            if([s isEqualToString:@"wb-e-utranNotAllowed"])
            {
                [self setBit:4];
            }
            if([s isEqualToString:@"ho-toNon3GPP-AccessNotAllowed"])
            {
                [self setBit:5];
            }
            if([s isEqualToString:@"nb-iotNotAllowed"])
            {
                [self setBit:6];
            }
        }
    }
    return self;
}

@end

//
//  UMGSMMAP_AccessRestrictionData.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 23.09.19.
//  Copyright © 2019 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibgsmmap/UMGSMMAP_AccessRestrictionData.h>

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
            if([s isEqualToString:@"enhancedCoverageNotAllowed"])
            {
                [self setBit:7];
            }
        }
    }
    return self;
}


- (id) objectValue
{
    NSMutableArray *a = [[NSMutableArray alloc]init];
    if([self bit:0])
    {
        [a addObject:@"utranNotAllowed"];
    }
    if([self bit:1])
    {
        [a addObject:@"geranNotAllowed"];
    }
    if([self bit:2])
    {
        [a addObject:@"i-hspa-evolutionNotAllowed"];
    }
    if([self bit:3])
    {
        [a addObject:@"i-hspa-evolutionNotAllowed"];
    }
    if([self bit:4])
    {
        [a addObject:@"wb-e-utranNotAllowed"];
    }
    if([self bit:5])
    {
        [a addObject:@"ho-toNon3GPP-AccessNotAllowed"];
    }
    if([self bit:6])
    {
        [a addObject:@"nb-iotNotAllowed"];
    }
    if([self bit:7])
    {
        [a addObject:@"enhancedCoverageNotAllowed"];
    }
    NSString *s = [a componentsJoinedByString:@","];
    return s;
}
@end

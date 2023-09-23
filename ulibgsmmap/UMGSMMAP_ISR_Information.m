//
//  UMGSMMAP_ISR_Information.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 14.07.20.
//  Copyright © 2020 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibgsmmap/UMGSMMAP_ISR_Information.h>

@implementation UMGSMMAP_ISR_Information

- (NSString *) objectName
{
    return @"ISR-Information";
}

- (UMGSMMAP_ISR_Information *)initWithString:(NSString *)str
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
            if([s isEqualToString:@"updateLocation"])
            {
                [self setBit:0];
            }
            if([s isEqualToString:@"cancelSGSN"])
            {
                [self setBit:1];
            }
            if([s isEqualToString:@"initialAttachIndicator"])
            {
                [self setBit:2];
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
        [a addObject:@"updateLocation"];
    }
    if([self bit:1])
    {
        [a addObject:@"cancelSGSN"];
    }
    if([self bit:2])
    {
        [a addObject:@"initialAttachIndicator"];
    }
    NSString *s = [a componentsJoinedByString:@","];
    return s;
}

@end

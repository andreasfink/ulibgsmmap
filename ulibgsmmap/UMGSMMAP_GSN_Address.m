//
//  UMGSMMAP_GSN_Address.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_GSN_Address.h"

@implementation UMGSMMAP_GSN_Address


- (NSString *) objectName
{
	return @"GSN_Address";
}

- (UMGSMMAP_GSN_Address *)initWithString:(NSString *)s
{
    self = [super initWithString:s];
    return self;
}

- (NSString *)stringValue
{
    NSString *s = [[NSString alloc]initWithData:self.value encoding:NSASCIIStringEncoding ];
    return s;
}

@end

//
//  UMGSMMAP_SupportedCamelPhases.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_SupportedCamelPhases.h"

@implementation UMGSMMAP_SupportedCamelPhases

@synthesize operationName;

- (NSString *) objectName
{
	return @"UMGSMMAP_SupportedCamelPhases";
}

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}

- (UMGSMMAP_SupportedCamelPhases *)initWithString:(NSString *)str
{
    self = [super init];
    if(self)
    {
        NSCharacterSet *whitespace  = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        
        NSArray *array = [str componentsSeparatedByString:@","];
        for(NSString *component in array)
        {
            NSString *s = [component stringByTrimmingCharactersInSet:whitespace];
            if([s isEqualToString:@"1"])
            {
                [self setBit:0];
            }
            if([s isEqualToString:@"2"])
            {
                [self setBit:1];
            }
            if([s isEqualToString:@"3"])
            {
                [self setBit:2];
            }
            if([s isEqualToString:@"4"])
            {
                [self setBit:3];
            }
        }
    }
    return self;
}


@end

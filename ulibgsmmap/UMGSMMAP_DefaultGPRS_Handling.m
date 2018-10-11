//
//  UMGSMMAP_DefaultGPRS_Handling.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_DefaultGPRS_Handling.h"

@implementation UMGSMMAP_DefaultGPRS_Handling

@synthesize operationName;

- (UMASN1Enumerated *)initWithString:(NSString *)s
{
    s = [s stringByTrimmingCharactersInSet:[UMObject whitespaceAndNewlineCharacterSet]];
    if([s isEqualToString:@"continueTransaction"])
    {
        return [super initWithValue:0];
    }
    if([s isEqualToString:@"releaseTransaction"])
    {
        return [super initWithValue:1];
    }
    return [super initWithValue:(int64_t)[s integerValue]];
}

- (NSString *) objectName
{
	return @"DefaultGPRS-Handling";
}

- (id) objectValue
{
    switch(self.value)
    {
        case(0):
            return @"continueTransaction (0)";
            break;
        case(1):
            return @"releaseTransaction (1)";
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


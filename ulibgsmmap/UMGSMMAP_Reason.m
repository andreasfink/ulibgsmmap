//
//  UMGSMMAP_Reason.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_Reason.h"

@implementation UMGSMMAP_Reason
@synthesize operationName;

- (UMASN1Enumerated *)initWithString:(NSString *)s
{
    s = [s stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if([s isEqualToString:@"noReasonGiven"])
    {
        return [super initWithValue:0];
    }
    if([s isEqualToString:@"invalidDestinationReference"])
    {
        return [super initWithValue:1];
    }
    if([s isEqualToString:@"invalidOriginatingReference"])
    {
        return [super initWithValue:2];
    }
    return [super initWithValue:(int64_t)[s integerValue]];
}

- (NSString *) objectName
{
	return @"Reason";
}

- (id) objectValue
{
    switch(self.value)
    {
        case(0):
            return @"noReasonGiven (0)";
            break;
        case(1):
            return @"invalidDestinationReference (1)";
            break;
        case(2):
            return @"invalidOriginatingReference (2)";
            break;
        default:
            return [NSString stringWithFormat:@"undefined (%d)",(int)self.value];
    }
}

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}



@end


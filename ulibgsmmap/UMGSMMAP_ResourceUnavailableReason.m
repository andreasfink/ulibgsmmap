//
//  UMGSMMAP_ResourceUnavailableReason.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_ResourceUnavailableReason.h>

@implementation UMGSMMAP_ResourceUnavailableReason
@synthesize operationName;

- (UMASN1Enumerated *)initWithString:(NSString *)s
{
    s = [s stringByTrimmingCharactersInSet:[UMObject whitespaceAndNewlineCharacterSet]];
    if([s isEqualToString:@"shortTermResourceLimitation"])
    {
        return [super initWithValue:0];
    }
    if([s isEqualToString:@"longTermResourceLimitation"])
    {
        return [super initWithValue:1];
    }
    return [super initWithValue:(int64_t)[s integerValue]];
}

- (NSString *) objectName
{
	return @"ResourceUnavailableReason";
}

- (id) objectValue
{
    switch(self.value)
    {
        case(0):
            return @"shortTermResourceLimitation (0)";
            break;
        case(1):
            return @"longTermResourceLimitation (1)";
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


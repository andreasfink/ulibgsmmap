//
//  UMGSMMAP_RoamingNotAllowedCause.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_RoamingNotAllowedCause.h"

@implementation UMGSMMAP_RoamingNotAllowedCause
@synthesize operationName;

- (UMASN1Enumerated *)initWithString:(NSString *)s
{
    s = [s stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if([s isEqualToString:@"plmnRoamingNotAllowed"])
    {
        return [super initWithValue:0];
    }
    if([s isEqualToString:@"operatorDeterminedBarring"])
    {
        return [super initWithValue:3];
    }
    return [super initWithValue:(int64_t)[s integerValue]];
}

- (NSString *) objectName
{
    return @"RoamingNotAllowedCause";
}

- (id) objectValue
{
    switch(self.value)
    {
        case(0):
            return @"plmnRoamingNotAllowed (0)";
            break;
        case(3):
            return @"operatorDeterminedBarring (3)";
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


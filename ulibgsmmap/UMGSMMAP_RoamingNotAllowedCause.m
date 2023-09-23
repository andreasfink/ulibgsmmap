//
//  UMGSMMAP_RoamingNotAllowedCause.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_RoamingNotAllowedCause.h>

@implementation UMGSMMAP_RoamingNotAllowedCause
@synthesize operationName;

- (UMASN1Enumerated *)initWithString:(NSString *)s
{
    s = [s stringByTrimmingCharactersInSet:[UMObject whitespaceAndNewlineCharacterSet]];
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
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}



@end


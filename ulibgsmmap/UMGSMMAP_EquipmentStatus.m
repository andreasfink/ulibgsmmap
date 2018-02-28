//
//  UMGSMMAP_EquipmentStatus.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_EquipmentStatus.h"

@implementation UMGSMMAP_EquipmentStatus

@synthesize operationName;

- (NSString *) objectName
{
	return @"EquipmentStatus";
}

- (UMGSMMAP_EquipmentStatus *)initWithString:(NSString *)s
{
    s = [s stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if([s isEqualToString:@"whiteListed"])
    {
        return [super initWithValue:0];
    }
    if([s isEqualToString:@"blackListed"])
    {
        return [super initWithValue:1];
    }
    if([s isEqualToString:@"greyListed"])
    {
        return [super initWithValue:1];
    }
    return [super initWithValue:(int64_t)[s integerValue]];
}

- (id) objectValue
{
    switch(self.value)
    {
        case 0:
            return @"whiteListed (0)";
            break;
        case 1:
            return @"blackListed (1)";
            break;
        case 2:
            return @"greylisted (2)";
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



//
//  UMGSMMAP_GPRS_TriggerDetectionPoint.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_GPRS_TriggerDetectionPoint.h"

@implementation UMGSMMAP_GPRS_TriggerDetectionPoint

@synthesize operationName;

- (UMASN1Enumerated *)initWithString:(NSString *)s
{
    s = [s stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if([s isEqualToString:@"attach"])
    {
        return [super initWithValue:1];
    }
    if([s isEqualToString:@"attachChangeOfPosition"])
    {
        return [super initWithValue:2];
    }
    if([s isEqualToString:@"pdp_ContextEstablishment"])
    {
        return [super initWithValue:11];
    }
    if([s isEqualToString:@"pdp_ContextEstablishmentAcknowledgement"])
    {
        return [super initWithValue:12];
    }
    if([s isEqualToString:@"pdp_ContextChangeOfPosition"])
    {
        return [super initWithValue:14];
    }
    return [super initWithValue:(int64_t)[s integerValue]];
}

- (NSString *) objectName
{
	return @"GPRS-TriggerDetectionPoint";
}

- (id) objectValue
{
    switch(self.value)
    {
        case(1):
            return @"attach (1)";
            break;
        case(2):
            return @"attachChangeOfPosition (2)";
            break;
        case(11):
            return @"pdp_ContextEstablishment (11)";
            break;
        case(12):
            return @"pdp_ContextEstablishmentAcknowledgement (12)";
            break;
        case(14):
            return @"pdp_ContextChangeOfPosition (14)";
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


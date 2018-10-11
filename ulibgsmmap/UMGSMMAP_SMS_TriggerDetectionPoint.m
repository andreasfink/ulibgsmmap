//
//  UMGSMMAP_SMS_TriggerDetectionPoint.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_SMS_TriggerDetectionPoint.h"

@implementation UMGSMMAP_SMS_TriggerDetectionPoint

@synthesize operationName;

- (UMASN1Enumerated *)initWithString:(NSString *)s
{
    s = [s stringByTrimmingCharactersInSet:[UMObject whitespaceAndNewlineCharacterSet]];
    if([s isEqualToString:@"sms_CollectedInfo"])
    {
        return [super initWithValue:1];
    }
    if([s isEqualToString:@"sms_DeliveryRequest"])
    {
        return [super initWithValue:2];
    }
    return [super initWithValue:(int64_t)[s integerValue]];
}

- (NSString *) objectName
{
	return @"SMS-TriggerDetectionPoint";
}

- (id) objectValue
{
    switch(self.value)
    {
        case(1):
            return @"sms_CollectedInfo (1)";
            break;
        case(2):
            return @"sms_DeliveryRequest (2)";
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


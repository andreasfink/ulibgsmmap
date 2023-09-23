//
//  UMGSMMAP_MT_SMS_TPDU_Type.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 10.07.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibgsmmap/UMGSMMAP_MT_SMS_TPDU_Type.h>

@implementation UMGSMMAP_MT_SMS_TPDU_Type

@synthesize operationName;


- (UMASN1Enumerated *)initWithString:(NSString *)s
{
    s = [s stringByTrimmingCharactersInSet:[UMObject whitespaceAndNewlineCharacterSet]];
    if([s isEqualToString:@"sms-DELIVER"])
    {
        return [super initWithValue:UMGSMMAP_MT_SMS_TPDU_Type_sms_DELIVER];
    }
    if([s isEqualToString:@"sms-SUBMIT-REPORT"])
    {
        return [super initWithValue:UMGSMMAP_MT_SMS_TPDU_Type_sms_SUBMIT_REPORT];
    }
    if([s isEqualToString:@"sms-STATUS-REPORT"])
    {
        return [super initWithValue:UMGSMMAP_MT_SMS_TPDU_Type_sms_STATUS_REPORT];
    }
    return [super initWithValue:(int64_t)[s integerValue]];
}

- (NSString *) objectName
{
    return @"AdditionalRequestedCAMEL-SubscriptionInfo";
}

- (id) objectValue
{
    switch(self.value)
    {
        case UMGSMMAP_MT_SMS_TPDU_Type_sms_DELIVER:
            return @"sms-DELIVER (0)";
            break;
        case UMGSMMAP_MT_SMS_TPDU_Type_sms_SUBMIT_REPORT:
            return @"sms-SUBMIT-REPORT (1)";
            break;
        case UMGSMMAP_MT_SMS_TPDU_Type_sms_STATUS_REPORT:
            return @"sms-STATUS-REPORT (2)";
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


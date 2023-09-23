//
//  UMGSMMAP_SMSRegisterRequest.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 14.07.20.
//  Copyright © 2020 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibgsmmap/UMGSMMAP_SMSRegisterRequest.h>

@implementation UMGSMMAP_SMSRegisterRequest

- (NSString *) objectName
{
    return @"SMSRegisterRequest";
}

- (void)setEnumDefinition
{
    _enumDefinition = @ {
        @"sms-registration-required"        : @(UMGSMMAP_SMSRegisterRequest_sms_registration_required),
        @"sms-registration-not-preferred"   : @(UMGSMMAP_SMSRegisterRequest_sms_registration_not_preferred),
        @"no-preference"                    : @(UMGSMMAP_SMSRegisterRequest_no_preference),
    };
}


@end

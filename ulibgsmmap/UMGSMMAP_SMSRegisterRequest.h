//
//  UMGSMMAP_SMSRegisterRequest.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 14.07.20.
//  Copyright © 2020 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>

typedef enum UMGSMMAP_SMSRegisterRequest_enum
{
    UMGSMMAP_SMSRegisterRequest_sms_registration_required = 0,
    UMGSMMAP_SMSRegisterRequest_sms_registration_not_preferred = 1,
    UMGSMMAP_SMSRegisterRequest_no_preference = 2,
} UMGSMMAP_SMSRegisterRequest_enum;

@interface UMGSMMAP_SMSRegisterRequest : UMASN1Enumerated

@end

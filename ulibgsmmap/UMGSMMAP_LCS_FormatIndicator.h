//
//  UMGSMMAP_LCS_FormatIndicator.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 25.09.2019.
//  Copyright © 2019 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

typedef enum UMGSMMAP_LCS_FormatIndicator_enum
{
    UMGSMMAP_LCS_FormatIndicator_logicalName = 0,
    UMGSMMAP_LCS_FormatIndicator_e_mailAddress = 1,
    UMGSMMAP_LCS_FormatIndicator_msisdn = 2,
    UMGSMMAP_LCS_FormatIndicator_url = 3,
    UMGSMMAP_LCS_FormatIndicator_sipUrl = 4,
} UMGSMMAP_LCS_FormatIndicator_enum;


@interface UMGSMMAP_LCS_FormatIndicator : UMASN1Enumerated

@end


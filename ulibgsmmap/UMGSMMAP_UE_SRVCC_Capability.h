//
//  UMGSMMAP_UE_SRVCC_Capability.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 14.07.20.
//  Copyright © 2020 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>

typedef enum UMGSMMAP_UE_SRVCC_Capability_enum
{
    UMGSMMAP_UE_SRVCC_Capability_not_supported = 0,
    UMGSMMAP_UE_SRVCC_Capability_supported = 1,
} UMGSMMAP_UE_SRVCC_Capability_enum;

@interface UMGSMMAP_UE_SRVCC_Capability : UMASN1Enumerated

@end


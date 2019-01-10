//
//  UMGSMMAP_RequestParameter.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 09.01.19.
//  Copyright © 2019 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

typedef enum UMGSMMAP_RequestParameter_enum
{
    UMGSMMAP_RequestParameter_requestIMSI = 0,
    UMGSMMAP_RequestParameter_requestAuthenticationSet = 1,
    UMGSMMAP_RequestParameter_requestSubscriberData = 2,
    UMGSMMAP_RequestParameter_requestKi = 4,
} UMGSMMAP_RequestParameter_enum;

@interface UMGSMMAP_RequestParameter : UMASN1Enumerated<UMGSMMAP_asn1_protocol>

@end


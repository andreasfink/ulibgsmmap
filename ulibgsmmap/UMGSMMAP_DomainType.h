//
//  UMGSMMAP_DomainType.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 01.12.2019.
//  Copyright © 2019 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>

typedef enum UMGSMMAP_DomainType_value
{
    UMGSMMAP_DomainType_cs_Domain = 0,
    UMGSMMAP_DomainType_ps_Domain = 1,
} UMGSMMAP_DomainType_value;

@interface UMGSMMAP_DomainType : UMASN1Enumerated

@end


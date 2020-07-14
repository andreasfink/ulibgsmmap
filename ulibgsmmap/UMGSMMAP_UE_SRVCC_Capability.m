//
//  UMGSMMAP_UE_SRVCC_Capability.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 14.07.20.
//  Copyright © 2020 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMGSMMAP_UE_SRVCC_Capability.h"

@implementation UMGSMMAP_UE_SRVCC_Capability

- (void)setEnumDefinition
{
    _enumDefinition = @ {
        @"ue-srvcc-not-supported" : @(UMGSMMAP_UE_SRVCC_Capability_not_supported),
        @"ue-srvcc-supported" : @(UMGSMMAP_UE_SRVCC_Capability_supported),
    };
}

@end

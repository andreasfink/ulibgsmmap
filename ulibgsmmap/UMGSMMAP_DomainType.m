//
//  UMGSMMAP_DomainType.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 01.12.2019.
//  Copyright © 2019 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibgsmmap/UMGSMMAP_DomainType.h>

@implementation UMGSMMAP_DomainType


- (NSString *) objectName
{
    return @"DomainType";
}


- (void)setEnumDefinition
{
    _enumDefinition = @ {
        @"cs-Domain" : @(UMGSMMAP_DomainType_cs_Domain),
        @"ps-Domain" : @(UMGSMMAP_DomainType_ps_Domain),
    };
}

@end

//
//  UMGSMMAP_Problem.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 02.01.2024.
//  Copyright © 2024 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibtcap/ulibtcap.h>
#import "UMGSMMAP_Problem.h"
#import "UMGSMMAP_asn1_protocol.h"

@implementation UMGSMMAP_Problem

- (NSString *) objectName
{
    return @"Problem";
}

- (void)setEnumDefinition
{
    _enumDefinition = @ {
        @"mistypedComponent" : @(UMGSMMAP_Problem_mistypedComponent),
    };
}

@end

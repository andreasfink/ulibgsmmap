//
//  UMGSMMAP_LCS_FormatIndicator.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 25.09.2019.
//  Copyright © 2019 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMGSMMAP_LCS_FormatIndicator.h"


@implementation UMGSMMAP_LCS_FormatIndicator

- (void)setEnumDefinition
{
    _enumDefinition = @ {
        @"logicalName" : @(UMGSMMAP_LCS_FormatIndicator_logicalName),
        @"e-mailAddress" : @(UMGSMMAP_LCS_FormatIndicator_e_mailAddress),
        @"msisdn" : @(UMGSMMAP_LCS_FormatIndicator_msisdn),
        @"url" : @(UMGSMMAP_LCS_FormatIndicator_url),
        @"sipUrl" : @(UMGSMMAP_LCS_FormatIndicator_sipUrl),
    };
}

    
- (NSString *) objectName
{
    return @"LCS-FormatIndicator";
}

@end

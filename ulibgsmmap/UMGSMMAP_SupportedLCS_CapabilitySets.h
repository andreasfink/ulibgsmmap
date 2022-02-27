//
//  UMGSMMAP_SupportedLCS_CapabilitySets.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 05.03.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>

@interface UMGSMMAP_SupportedLCS_CapabilitySets : UMASN1BitString
{
    
}

- (UMGSMMAP_SupportedLCS_CapabilitySets *)initWithString:(NSString *)s;

- (void)setBitStringDefinition
{
    /* this is overridden normally */
    /* this metod should _bitStringDefintionBitToName to a dictionary stringValue -> @(number) */
    
    _bitStringDefintionBitToName = @{
        @(0) : @"utran" ,
        @(1) : @"geran" ,
        @(2) : @"gann" ,
        @(3) : @"i-hspa-evolution" ,
        @(4) : @"e-utran",
        @(5) : @"nb-iot" ,
    };
    _bitStringDefintionNameToBit = @{
        @"phase1" : @(0) ,
        @"geran" : @(1) ,
        @"gan" : @(2) ,
        @"i-hspa-evolution" : @(3) ,
        @"e-utran" : @(4),
        @"nb-iot" : @(5),
    };
}
@end

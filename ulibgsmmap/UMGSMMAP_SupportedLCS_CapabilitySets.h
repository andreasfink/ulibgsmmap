//
//  UMGSMMAP_SupportedLCS_CapabilitySets.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 05.03.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibtcap/ulibtcap.h>

@interface UMGSMMAP_SupportedLCS_CapabilitySets : UMASN1BitString
{
    
}

- (UMGSMMAP_SupportedLCS_CapabilitySets *)initWithString:(NSString *)s;

- (void)setBitStringDefinition;
@end

//
//  UMGSMMAP_SupportedRAT_Types.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 05.03.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibtcap/ulibtcap.h>

@interface UMGSMMAP_SupportedRAT_Types : UMASN1BitString


- (UMGSMMAP_SupportedRAT_Types *)initWithString:(NSString *)str;

@end

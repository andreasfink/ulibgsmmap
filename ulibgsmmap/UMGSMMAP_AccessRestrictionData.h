//
//  UMGSMMAP_AccessRestrictionData.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 23.09.19.
//  Copyright © 2019 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>
#import <ulibtcap/ulibtcap.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

@interface UMGSMMAP_AccessRestrictionData : UMASN1BitString


- (UMGSMMAP_AccessRestrictionData *)initWithString:(NSString *)str;


@end

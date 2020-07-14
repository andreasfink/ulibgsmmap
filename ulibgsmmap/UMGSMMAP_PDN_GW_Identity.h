//
//  UMGSMMAP_PDN_GW_Identity.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 14.07.20.
//  Copyright © 2020 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>

#import "UMGSMMAP_PDP_Address.h"
#import "UMGSMMAP_FQDN.h"
#import "UMGSMMAP_ExtensionContainer.h"

@interface UMGSMMAP_PDN_GW_Identity : UMASN1Sequence
{
    UMGSMMAP_PDP_Address        *_pdn_gw_ipv4_Address;
    UMGSMMAP_PDP_Address        *_pdn_gw_ipv6_Address;
    UMGSMMAP_FQDN               *_pdn_gw_name;
    UMGSMMAP_ExtensionContainer *_extensionContainer;
}

@property(readwrite,strong,atomic)  UMGSMMAP_PDP_Address        *pdn_gw_ipv4_Address;
@property(readwrite,strong,atomic)  UMGSMMAP_PDP_Address        *pdn_gw_ipv6_Address;
@property(readwrite,strong,atomic)  UMGSMMAP_FQDN               *pdn_gw_name;
@property(readwrite,strong,atomic)  UMGSMMAP_ExtensionContainer *extensionContainer;

@end


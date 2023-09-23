//
//  UMGSMMAP_PDN_GW_Update.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 14.07.20.
//  Copyright © 2020 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>

#import <ulibgsmmap/UMGSMMAP_APN.h>
#import <ulibgsmmap/UMGSMMAP_PDN_GW_Identity.h>
#import <ulibgsmmap/UMGSMMAP_ContextId.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>

@interface UMGSMMAP_PDN_GW_Update : UMASN1Sequence
{
    UMGSMMAP_APN                *_apn;
    UMGSMMAP_PDN_GW_Identity    *_pdn_gw_Identity;
    UMGSMMAP_ContextId          *_contextId;
    UMGSMMAP_ExtensionContainer *_extensionContainer;
}

@property(readwrite,strong,atomic)  UMGSMMAP_APN                *apn;
@property(readwrite,strong,atomic)  UMGSMMAP_PDN_GW_Identity    *pdn_gw_Identity;
@property(readwrite,strong,atomic)  UMGSMMAP_ContextId          *contextId;
@property(readwrite,strong,atomic)  UMGSMMAP_ExtensionContainer *extensionContainer;

@end


//
//  UMGSMMAP_RoutingInfoForLCSRes.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 29/04/16.
//
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_SubscriberIdentity.h>
#import <ulibgsmmap/UMGSMMAP_LCSLocationInfo.h>
#include "UMGSMMAP_ExtensionContainer.h"

@interface UMGSMMAP_RoutingInfoForLCSRes : UMASN1Object
{
    UMGSMMAP_SubscriberIdentity *targetMS;
    UMGSMMAP_LCSLocationInfo *lcsLocationInfo;
    UMGSMMAP_ExtensionContainer *extensionContainer;

}


@property(readwrite,strong) UMGSMMAP_SubscriberIdentity *targetMS;
@property(readwrite,strong) UMGSMMAP_LCSLocationInfo *lcsLocationInfo;
@property(readwrite,strong) UMGSMMAP_ExtensionContainer *extensionContainer;

@end

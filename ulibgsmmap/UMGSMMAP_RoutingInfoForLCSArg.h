//
//  UMGSMMAP_RoutingInfoForLCSArg.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 29/04/16.
//
//

#import <ulibasn1/ulibasn1.h>

#import <ulibgsmmap/UMGSMMAP_AddressString.h>
#import <ulibgsmmap/UMGSMMAP_SubscriberIdentity.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>

@interface UMGSMMAP_RoutingInfoForLCSArg : UMASN1Sequence
{
    UMGSMMAP_AddressString      *mlcNumber;
    UMGSMMAP_SubscriberIdentity *targetMS;
    UMGSMMAP_ExtensionContainer *extensionContainer;
}

@property(readwrite,strong) UMGSMMAP_AddressString            *mlcNumber;
@property(readwrite,strong) UMGSMMAP_SubscriberIdentity *targetMS;
@property(readwrite,strong) UMGSMMAP_ExtensionContainer *extensionContainer;

@end

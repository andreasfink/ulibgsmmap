//
//  UMGSMMAP_DialogIdentifier.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 12.12.17.
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibtcap/ulibtcap.h>

@interface UMGSMMAP_DialogIdentifier : UMTCAP_UserDialogIdentifier
{

}

- (UMGSMMAP_DialogIdentifier *)initWithString:(NSString *)str;
- (UMGSMMAP_DialogIdentifier *)initWithTcapUserDialogIdentifier:(UMTCAP_UserDialogIdentifier *)tcapUserDialogIdentifier;
- (UMGSMMAP_DialogIdentifier *)copyWithZone:(NSZone *)zone;


@end

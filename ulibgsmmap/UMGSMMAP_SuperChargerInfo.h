//
//  UMGSMMAP_SuperChargerInfo.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 05.03.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibtcap/ulibtcap.h>

@class UMGSMMAP_AgeIndicator;

@interface UMGSMMAP_SuperChargerInfo : UMASN1Choice
{
    BOOL                    _sendSubscriberData;
    UMGSMMAP_AgeIndicator   *_subscriberDataStored;
}
@property(readwrite,assign) BOOL sendSubscriberData;
@property(readwrite,strong) UMGSMMAP_AgeIndicator *subscriberDataStored;

- (UMGSMMAP_SuperChargerInfo *)initWithString:(NSString *)str;

@end

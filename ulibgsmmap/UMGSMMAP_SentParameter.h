//
//  UMGSMMAP_SentParameter.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 09.01.19.
//  Copyright © 2019 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>
#import <ulibgsmmap/UMGSMMAP_IMSI.h>
#import <ulibgsmmap/UMGSMMAP_AuthenticationSetList.h>
#import <ulibgsmmap/UMGSMMAP_SubscriberData.h>
#import <ulibgsmmap/UMGSMMAP_Ki.h>

@interface UMGSMMAP_SentParameter : UMASN1Choice<UMGSMMAP_asn1_protocol>
{
    UMGSMMAP_IMSI                   *_imsi;
    UMGSMMAP_AuthenticationSetList  *_authenticationSet;
    UMGSMMAP_SubscriberData         *_subscriberData;
    UMGSMMAP_Ki                     *_ki;
}

@property(readwrite,strong,atomic)  UMGSMMAP_IMSI                   *imsi;
@property(readwrite,strong,atomic)  UMGSMMAP_AuthenticationSetList  *authenticationSet;
@property(readwrite,strong,atomic)  UMGSMMAP_SubscriberData         *subscriberData;
@property(readwrite,strong,atomic)  UMGSMMAP_Ki                     *ki;

@end

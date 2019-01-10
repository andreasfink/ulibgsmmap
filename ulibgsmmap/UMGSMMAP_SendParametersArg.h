//
//  UMGSMMAP_SendParametersArg.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 09.01.19.
//  Copyright © 2019 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"
#import "UMGSMMAP_SubscriberIdentity.h"
#import "UMGSMMAP_RequestParameterList.h"

@interface UMGSMMAP_SendParametersArg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
    UMGSMMAP_SubscriberIdentity *_subscriberId;
    UMGSMMAP_RequestParameterList *_requestParameterList;
}

@property(readwrite,atomic,strong)  UMGSMMAP_SubscriberIdentity *subscriberId;
@property(readwrite,atomic,strong)  UMGSMMAP_RequestParameterList *requestParameterList;

@end


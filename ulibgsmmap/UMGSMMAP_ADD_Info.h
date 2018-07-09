//
//  UMGSMMAP_ADD_Info.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 09.07.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_IMEI.h"
#import "UMGSMMAP_asn1_protocol.h"

@interface UMGSMMAP_ADD_Info : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
    UMGSMMAP_IMEI   *_imeisv;
    BOOL             _skipSubscriberDataUpdate;
}


@property(readwrite,strong,atomic) UMGSMMAP_IMEI *imeisv;
@property(readwrite,assign,atomic) BOOL skipSubscriberDataUpdate;

@end

//
//  UMGSMMAP_AbsentSubscriberReason.h
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

typedef enum UMGSMMAP_AbsentSubscriberReason_enum
{
    UMGSMMAP_AbsentSubscriberReason_imsiDetach = 0,
    UMGSMMAP_AbsentSubscriberReason_restrictedArea = 1,
    UMGSMMAP_AbsentSubscriberReason_noPageResponse = 2,
    UMGSMMAP_AbsentSubscriberReason_purgedMS = 3,
    UMGSMMAP_AbsentSubscriberReason_mtRoamingRetry = 4,
    UMGSMMAP_AbsentSubscriberReason_busySubscriber = 5,
} UMGSMMAP_AbsentSubscriberReason_enum;

@interface UMGSMMAP_AbsentSubscriberReason : UMASN1Enumerated<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
}
@property(readwrite,strong)    NSString *operationName;

@end

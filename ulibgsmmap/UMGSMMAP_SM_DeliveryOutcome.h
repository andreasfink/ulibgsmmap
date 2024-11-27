//
//  UMGSMMAP_SM_DeliveryOutcome.h
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

typedef enum UMGSMMAP_SM_DeliveryOutcome_enum
{
    UMGSMMAP_SM_DeliveryOutcome_memoryCapacityExceeded  = 0,
    UMGSMMAP_SM_DeliveryOutcome_absentSubscriber        = 1,
    UMGSMMAP_SM_DeliveryOutcome_successfulTransfer      = 2,
} UMGSMMAP_SM_DeliveryOutcome_enum;

@interface UMGSMMAP_SM_DeliveryOutcome : UMASN1Enumerated<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
}

@property(readwrite,strong)    NSString *operationName;

@end

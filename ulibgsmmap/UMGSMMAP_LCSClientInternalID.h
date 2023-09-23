//
//  UMGSMMAP_LCSClientInternalID.h
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

typedef enum UMGSMMAP_LCSClientInternalID_enum
{
    UMGSMMAP_LCSClientInternalID_broadcastService           = 0,
    UMGSMMAP_LCSClientInternalID_o_andM_HPLMN               = 1,
    UMGSMMAP_LCSClientInternalID_o_andM_VPLMN               = 2,
    UMGSMMAP_LCSClientInternalID_anonymousLocation          = 3,
    UMGSMMAP_LCSClientInternalID_targetMSsubscribedService  = 4,
} UMGSMMAP_LCSClientInternalID_enum;

@interface UMGSMMAP_LCSClientInternalID : UMASN1Enumerated<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
}
@property(readwrite,strong)    NSString *operationName;

@end

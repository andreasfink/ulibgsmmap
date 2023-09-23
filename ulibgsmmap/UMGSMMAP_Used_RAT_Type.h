//
//  UMGSMMAP_Used_RAT_Type.h
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

typedef enum UMGSMMAP_Used_RAT_Type_enum
{
    UMGSMMAP_Used_RAT_Type_utran = 0,
    UMGSMMAP_Used_RAT_Type_geran = 1,
    UMGSMMAP_Used_RAT_Type_gan = 2,
    UMGSMMAP_Used_RAT_Type_i_hspa_evolution = 3,
    UMGSMMAP_Used_RAT_Type_e_utran = 4,
} UMGSMMAP_Used_RAT_Type_enum;


@interface UMGSMMAP_Used_RAT_Type : UMASN1Enumerated<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
}
@property(readwrite,strong)    NSString *operationName;

@end

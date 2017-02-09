//
//  UMGSMMAP_LocationEstimateType.h
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

typedef enum UMGSMMAP_LocationEstimateTypeEnum
{
   UMGSMMAP_LocationEstimateTypeEnum_currentLocation=0, 
   UMGSMMAP_LocationEstimateTypeEnum_currentOrLastKnownLocation=1, 
   UMGSMMAP_LocationEstimateTypeEnum_initialLocation=2 
} UMGSMMAP_LocationEstimateTypeEnum;

@interface UMGSMMAP_LocationEstimateType : UMASN1Enumerated<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
    UMASN1Enumerated *enumValue;
}

@property(readwrite,assign)     UMGSMMAP_LocationEstimateTypeEnum type;
@property(readwrite,strong)     NSString *operationName;
@property(readwrite,strong)     UMASN1Enumerated *enumValue;


@end

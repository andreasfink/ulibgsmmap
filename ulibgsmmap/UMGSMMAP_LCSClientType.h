//
//  UMGSMMAP_LCSClientType.h
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

typedef enum UMGSMMAP_LCSClientType_enum
{
    UMGSMMAP_LCSClientType_emergencyServices = 0,
    UMGSMMAP_LCSClientType_valueAddedServices = 1,
    UMGSMMAP_LCSClientType_plmnOperatorServices = 2,
    UMGSMMAP_LCSClientType_lawfulInterceptServices = 3,
} UMGSMMAP_LCSClientType_enum;

@interface UMGSMMAP_LCSClientType : UMASN1Enumerated<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
}

@property(readwrite,strong)    NSString *operationName;

- (UMGSMMAP_LCSClientType *)initWithString:(NSString *)lcsClientType;

@end

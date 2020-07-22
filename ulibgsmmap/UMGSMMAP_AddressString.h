//
//  UMGSMMAP_AddressString.h
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

typedef	enum GSMMAP_TonType
{
    GSMMAP_TON_UNKNOWN              = 0,
    GSMMAP_TON_INTERNATIONAL	 	= 1,
    GSMMAP_TON_NATIONAL 			= 2,
    GSMMAP_TON_NETWORK_SPECIFIC     = 3,
    GSMMAP_TON_SUBSCRIBER 			= 4,
    GSMMAP_TON_ALPHANUMERIC 		= 5,
    GSMMAP_TON_ABBREVIATED			= 6,
    GSMMAP_TON_RESERVED 			= 7,
    GSMMAP_TON_IMSI 				= 100,
    GSMMAP_TON_URL					= 101,
    GSMMAP_TON_EMAIL 				= 102,
    GSMMAP_TON_POINTCODE			= 103,
    GSMMAP_TON_EMPTY                = 104,
    GSMMAP_TON_MISSING              = 105,
    GSMMAP_TON_EMPTY2               = 106,
    GSMMAP_TON_EMPTY3               = 103,

} GSMMAP_TonType;

typedef enum GSMMAP_NpiType
{
    GSMMAP_NPI_UNKNOWN				= 0,
    GSMMAP_NPI_ISDN_E164			= 1,
    GSMMAP_NPI_GENERIC              = 2,
    GSMMAP_NPI_DATA_X121			= 3,	 	/* was 2 */
    GSMMAP_NPI_TELEX 				= 4, 		/* was 3 */
    GSMMAP_NPI_E212                 = 6, /* imsi */
    GSMMAP_NPI_E214                 = 7, /* mgt */
    GSMMAP_NPI_NATIONAL             = 8,
    GSMMAP_NPI_PRIVATE				= 9,
    GSMMAP_NPI_ERMES 				= 10,
    GSMMAP_NPI_RESERVED 			= 15,
    GSMMAP_NPI_IMSI 				= 100,
    GSMMAP_NPI_INTERNET 			= 101,
    GSMMAP_NPI_POINTCODE			= 103,
} GSMMAP_NpiType;




@interface UMGSMMAP_AddressString :  UMASN1OctetString<UMGSMMAP_asn1_protocol>
{
    NSString *operationName;
    GSMMAP_TonType _ton;
    GSMMAP_NpiType _npi;
    NSString *_address;
}

@property(readwrite,assign,atomic)  GSMMAP_TonType ton;
@property(readwrite,assign,atomic)  GSMMAP_NpiType npi;
@property(readwrite,strong,atomic)  NSString *address;

@property(readwrite,strong)    NSString *operationName;
- (UMGSMMAP_AddressString *)initWithString:(NSString *)msisdn;
- (UMGSMMAP_AddressString *)initWithMsisdn:(NSString *)msisdn; /* legacy wrapper */
- (UMGSMMAP_AddressString *)initWithImsi:(NSString *)digits;

- (UMGSMMAP_AddressString *)initWithAddress:(NSString *)msisdn ton:(GSMMAP_TonType)ton npi:(GSMMAP_NpiType)npi;
- (NSString *)stringValue;
- (UMGSMMAP_AddressString *)initWithAlpha:(NSString *)digits;

- (NSData *)berEncoded;

@end

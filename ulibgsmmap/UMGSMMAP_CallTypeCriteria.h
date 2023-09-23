//
//  UMGSMMAP_CallTypeCriteria.h
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

typedef enum UMGSMMAP_CallTypeCriteria_enum
{
    UMGSMMAP_CallTypeCriteria_forwarded = 0,
    UMGSMMAP_CallTypeCriteria_notForwarded = 1,
} UMGSMMAP_CallTypeCriteria_enum;

@interface UMGSMMAP_CallTypeCriteria : UMASN1Enumerated<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
}
@property(readwrite,strong)    NSString *operationName;

@end

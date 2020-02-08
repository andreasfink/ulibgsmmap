//
//  UMGSMMAP_CallBarringCause.h
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

typedef enum    UMGSMMAP_CallBarringCause_enum
{
    UMGSMMAP_CallBarringCause_barringServiceActive = 0,
    UMGSMMAP_CallBarringCause_operatorBarring = 1,
} UMGSMMAP_CallBarringCause_enum;



@interface UMGSMMAP_CallBarringCause : UMASN1Enumerated<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
}
@property(readwrite,strong)    NSString *operationName;

@end

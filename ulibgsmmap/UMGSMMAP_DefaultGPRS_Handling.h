//
//  UMGSMMAP_DefaultGPRS_Handling.h
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


typedef enum UMGSMMAP_DefaultGPRS_Handling_enum
{
    UMGSMMAP_DefaultGPRS_Handling_continueTransaction = 0,
    UMGSMMAP_DefaultGPRS_Handling_releaseTransaction = 1,
}  UMGSMMAP_DefaultGPRS_Handling_enum;


@interface UMGSMMAP_DefaultGPRS_Handling : UMASN1Enumerated<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
}
@property(readwrite,strong)    NSString *operationName;

- (UMGSMMAP_DefaultGPRS_Handling *)initWithString:(NSString *)s;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

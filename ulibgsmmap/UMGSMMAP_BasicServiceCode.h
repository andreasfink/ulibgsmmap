//
//  UMGSMMAP_BasicServiceCode.h
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

#import "UMGSMMAP_BearerServiceCode.h"
#import "UMGSMMAP_TeleserviceCode.h"

@interface UMGSMMAP_BasicServiceCode : UMASN1Choice<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_BearerServiceCode *bearerService;
	UMGSMMAP_TeleserviceCode *teleservice;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_BearerServiceCode *bearerService;
@property(readwrite,strong)	UMGSMMAP_TeleserviceCode *teleservice;


- (void)processBeforeEncode;
- (UMGSMMAP_BasicServiceCode *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

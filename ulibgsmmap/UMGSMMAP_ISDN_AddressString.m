//
//  UMGSMMAP_ISDN_AddressString.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 11/05/16.
//
//

#import "UMGSMMAP_ISDN_AddressString.h"

@implementation UMGSMMAP_ISDN_AddressString


- (NSString *)objectName
{
    return @"ISDN-AddressString";
}

- (UMGSMMAP_AddressString *)initWithString:(NSString *)msisdn
{
    self = [super initWithString:msisdn];
    return self;
}

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}

@end

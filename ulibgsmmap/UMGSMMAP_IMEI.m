//
//  UMGSMMAP_IMEI.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_IMEI.h"

@implementation UMGSMMAP_IMEI

@synthesize operationName;

- (NSString *) objectName
{
	return @"UMGSMMAP_IMEI";
}

- (UMASN1Object *)processAfterDecodeWithContext:(id)context
{
    if(self.asn1_data.length < 8)
    {
        @throw([NSException exceptionWithName:@"DECODING_ERRROR" reason:@"IMEI does not have at least 8 bytes length" userInfo:NULL]);
    }
    return self;
}

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}

- (UMASN1OctetString *)initWithString:(NSString *)s
{
    if(s.length < 16)
    {
        @throw([NSException exceptionWithName:@"ENCODING_ERROR" reason:@"IMEI does not have at least 8 bytes length" userInfo:NULL]);
    }
    return [self initWithValue:[s unhexedData]];
}

@end

//
//  UMGSMMAP_GSN_Address.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_GSN_Address.h"

@implementation UMGSMMAP_GSN_Address

@synthesize operationName;

- (NSString *) objectName
{
	return @"UMGSMMAP_GSN_Address";
}

- (UMGSMMAP_GSN_Address *)initWithString:(NSString *)s
{
    self = [super init];
    if(self)
    {
        self.value = [s dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    }
    return self;
}

- (NSString *)stringValue
{
    NSString *s = [[NSString alloc]initWithData:self.value encoding:NSASCIIStringEncoding ];
    return s;
}

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}

@end

//
//  UMGSMMAP_USSD_String.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_USSD_String.h"
#import "NSString+map.h"
#import "NSData+map.h"

@implementation UMGSMMAP_USSD_String

@synthesize operationName;

- (NSString *) objectName
{
	return @"UMGSMMAP_USSD_String";
}

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}

- (UMGSMMAP_USSD_String *)initWithString:(NSString *)s
{
    self = [super init];
    if(self)
    {
        NSMutableData *d8 = [s gsm8];
        if((d8.length % 8) == 7)
        {
            [d8 appendByte:0x0D];
        }
        NSData *d = [d8 gsm8to7:NULL];
        self.asn1_data = d;
    }
    return self;
}

- (NSString *)stringValue
{
    NSString *s = [self.asn1_data stringFromGsm7:(self.asn1_data.length * 2)];
    return s;
}

-(id) objectValue
{
    return [self stringValue];
}

@end

//
//  UMGSMMAP_OfferedCamel4CSIs.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_OfferedCamel4CSIs.h>

@implementation UMGSMMAP_OfferedCamel4CSIs

@synthesize operationName;

- (NSString *) objectName
{
	return @"UMGSMMAP_OfferedCamel4CSIs";
}

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}


- (UMGSMMAP_OfferedCamel4CSIs *)initWithString:(NSString *)str
{
    const char bytes[1] = { 0 };
    NSData *d = [NSData dataWithBytes:bytes length:1];
    self = [super initWithValue:d bitcount:6];
    if(self)
    {
        NSCharacterSet *whitespace  = [UMObject whitespaceAndNewlineCharacterSet];
        
        NSArray *array = [str componentsSeparatedByString:@","];
        for(NSString *component in array)
        {
            NSString *s = [component stringByTrimmingCharactersInSet:whitespace];
            if([s isEqualToString:@"o-csi"])
            {
                [self setBit:0];
            }
            if([s isEqualToString:@"d-csi"])
            {
                [self setBit:1];
            }
            if([s isEqualToString:@"vt-csi"])
            {
                [self setBit:2];
            }
            if([s isEqualToString:@"t-csi"])
            {
                [self setBit:3];
            }
            if([s isEqualToString:@"mt-sms-csi"])
            {
                [self setBit:4];
            }
            if([s isEqualToString:@"mg-csi"])
            {
                [self setBit:5];
            }
            if([s isEqualToString:@"psi-enhancements"])
            {
                [self setBit:6];
            }
        }
    }
    return self;
}
@end

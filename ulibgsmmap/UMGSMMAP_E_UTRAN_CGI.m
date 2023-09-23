//
//  UMGSMMAP_E_UTRAN_CGI.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_E_UTRAN_CGI.h>

@implementation UMGSMMAP_E_UTRAN_CGI

@synthesize operationName;

- (NSString *) objectName
{
	return @"UMGSMMAP_E_UTRAN_CGI";
}


- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}


- (id) objectValue
{
    UMSynchronizedSortedDictionary *dict = [self decodeECGI];
    dict[@"rawData"] = super.objectValue;
    return dict;
}

- (UMSynchronizedSortedDictionary *)decodeECGI
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    const uint8_t *bytes = _asn1_data.bytes;
    NSUInteger len       = _asn1_data.length;
    if(len < 7)
    {
        return dict;
    }

    int mcc_digit1 = ((bytes[0] >> 0) & 0x0F);
    int mcc_digit2 = ((bytes[0] >> 4) & 0x0F);
    int mcc_digit3 = ((bytes[1] >> 0) & 0x0F);
    int mcc = mcc_digit1 *100 + mcc_digit2*10 + mcc_digit3;
    dict[@"mcc"] = [NSString stringWithFormat:@"%03d",mcc];

    int mnc_digit1 = ((bytes[2] >> 0) & 0x0F);
    int mnc_digit2 = ((bytes[2] >> 4) & 0x0F);
    int mnc_digit3 = ((bytes[1] >> 4) & 0x0F);
    if(mnc_digit3 == 0x0F)
    {
        int mnc = mnc_digit1 * 100 + mnc_digit2;
        dict[@"mnc"] = [NSString stringWithFormat:@"%02d",mnc];
    }
    else
    {
        int mnc = mnc_digit1 * 1000 + mnc_digit2 * 100 + mnc_digit3;
        dict[@"mnc"] = [NSString stringWithFormat:@"%03d",mnc];
    }
    NSData *ecgi = [NSData dataWithBytes:&bytes[3] length:4];
    NSString *eci_str = [ecgi hexString];
    eci_str = [eci_str substringWithRange:NSMakeRange(1,7)]; /* stip off the first nibble */
    dict[@"eci"] = eci_str;
    return dict;
}

+ (UMSynchronizedSortedDictionary *)decodeECGI:(NSData *)data
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    const uint8_t *bytes = data.bytes;
    NSUInteger len       = data.length;
    if(len < 7)
    {
        return dict;
    }

    int mcc_digit1 = ((bytes[0] >> 0) & 0x0F);
    int mcc_digit2 = ((bytes[0] >> 4) & 0x0F);
    int mcc_digit3 = ((bytes[1] >> 0) & 0x0F);
    int mcc = mcc_digit1 *100 + mcc_digit2*10 + mcc_digit3;
    dict[@"mcc"] = [NSString stringWithFormat:@"%03d",mcc];

    int mnc_digit1 = ((bytes[2] >> 0) & 0x0F);
    int mnc_digit2 = ((bytes[2] >> 4) & 0x0F);
    int mnc_digit3 = ((bytes[1] >> 4) & 0x0F);
    if(mnc_digit3 == 0x0F)
    {
        int mnc = mnc_digit1 * 100 + mnc_digit2;
        dict[@"mnc"] = [NSString stringWithFormat:@"%02d",mnc];
    }
    else
    {
        int mnc = mnc_digit1 * 1000 + mnc_digit2 * 100 + mnc_digit3;
        dict[@"mnc"] = [NSString stringWithFormat:@"%03d",mnc];
    }
    NSData *ecgi = [NSData dataWithBytes:&bytes[3] length:4];
    NSString *eci_str = [ecgi hexString];
    eci_str = [eci_str substringWithRange:NSMakeRange(1,7)]; /* stip off the first nibble */
    dict[@"eci"] = eci_str;
    return dict;
}

@end

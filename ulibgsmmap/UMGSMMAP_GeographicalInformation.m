//
//  UMGSMMAP_GeographicalInformation.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_GeographicalInformation.h"

@implementation UMGSMMAP_GeographicalInformation

@synthesize operationName;

- (NSString *) objectName
{
	return @"UMGSMMAP_GeographicalInformation";
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
    UMSynchronizedSortedDictionary *dict = [self decodeGeographicalInformation];
    dict[@"rawData"] = super.objectValue;
    return dict;
}


- (UMSynchronizedSortedDictionary *)decodeGeographicalInformation
{
    const uint8_t *bytes = _asn1_data.bytes;
    NSUInteger len = _asn1_data.length;
    
    long long latitiude;
    long long longitude;
    int sign;
    int uncertainity_code;
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    if(len <8)
    {
        dict[@"error"] = @"packet-too-short";
    }
    else
    {
        if((bytes[0] & 0xF0) != 0x10)
        {
            dict[@"error"] = @"invalid-shape-object";
        }
        else
        {
            sign = bytes[1] & 0x80;
            latitiude   = (bytes[1] & 0x7F) << 16;
            latitiude |= bytes[2] << 8;
            latitiude |= bytes[3];
            longitude  = bytes[4] << 16;
            longitude |= bytes[5] << 8;
            longitude |= bytes[6];
            uncertainity_code = bytes[7] & 0x7F;
            double lat = 93206.75555555555556 * latitiude; /* 2 ^ 23 / 90 */
            if(sign)
            {
            }
            double lon = 46603.37777777777778 * longitude; /* 2 ^ 24 / 360 */
            double uncertainity = 10.0 * (pow(1.01,(double)uncertainity_code)-1.0);
            if(sign)
            {
                lat = -lat;
            }
            dict[@"longitude"]      = @(lon);
            dict[@"latitude"]       = @(lat);
            dict[@"uncertainity"]   = @(uncertainity);

        }
    }
    return dict;
}

- (void) setEllipsoidPointwithLatitude:(double)latitude
                             longitude:(double)longitude
                      uncertanity_code:(int)uncertainity_code
{
    if(longitude<0.0)
    {
        longitude = longitude + 360.0;
    }
    long long lat = (long long)( latitude * 93206.75555555555556);
    long long lon =(long long) ( longitude * 46603.37777777777778);
    int sign = 0;
    if(lat < 0)
    {
        sign = 1;
        lat = -lat;
    }
    
    uint8_t bytes[8];
    bytes[0] = 0x01; /* Ellipsoid point with uncertainty Circle */
    bytes[1] = ((lat >> 16 ) & 0x7F) | (sign ? 0x80 : 0x00);
    bytes[2] = (lat >> 8) & 0xFF;
    bytes[3] = (lat >> 0) & 0xFF;
    bytes[4] = (lon >> 16 ) & 0xFF;
    bytes[5] = (lon >> 8) & 0xFF;
    bytes[6] = (lon >> 0) & 0xFF;
    bytes[7] = uncertainity_code & 0x7F;
    _asn1_data = [NSData dataWithBytes:&bytes length:sizeof(bytes)];
}

@end

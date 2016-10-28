//
//  UMGSMMAP_GeographicalInformation.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
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
                                             operationType:(UMTCAP_Operation)operation
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
    const uint8_t *bytes = asn1_data.bytes;
    NSUInteger len = asn1_data.length;
    
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
            uncertainity_code = bytes[8] & 0x7F;
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

/*ellipsoid point with uncertainty circle */

@end

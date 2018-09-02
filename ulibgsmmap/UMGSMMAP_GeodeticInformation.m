//
//  UMGSMMAP_GeodeticInformation.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_GeodeticInformation.h"

@implementation UMGSMMAP_GeodeticInformation

@synthesize operationName;

- (NSString *) objectName
{
	return @"UMGSMMAP_GeodeticInformation";
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
    UMSynchronizedSortedDictionary *dict = [self decodeGeodeticInformation];
    dict[@"rawData"] = super.objectValue;
    return dict;
}

/*
 GeodeticInformation ::= OCTET STRING (SIZE (10))
 -- Refers to Calling Geodetic Location defined in Q.763 (1999).
 -- Only the description of an ellipsoid point with uncertainty circle
 -- as specified in Q.763 (1999) is allowed to be used
 -- The internal structure according to Q.763 (1999) is as follows:
 -- Screening and presentation indicators
 -- Type of shape (ellipsoid point with uncertainty circle)
 -- Degrees of Latitude
 -- Degrees of Longitude
 -- Uncertainty code
 -- Confidence
 */


- (UMSynchronizedSortedDictionary *)decodeGeodeticInformation
{
    const uint8_t *bytes = _asn1_data.bytes;
    NSUInteger len = _asn1_data.length;
    
    long long latitiude;
    long long longitude;
    int sign;
    int uncertainity_code;
    int confidence_code;
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    if(len <1)
    {
        dict[@"error"] = @"packet-too-short";
        return dict;
    }
    switch((bytes[0] >> 2 ) & 0x03)
    {
        case 0:
            dict[@"lpri"] = @"presentation allowed";
            break;
        case 1:
            dict[@"lpri"] = @"presentation restricted";
            break;
        case 2:
            dict[@"lpri"] = @"location not available";
            return dict;
            break;
        case 3:
            dict[@"lpri"] = @"spare";
            break;
    }
    if(len <2)
    {
        dict[@"error"] = @"packet-too-short";
        return dict;
    }
    switch(bytes[1] & 0x7F)
    {
        case 0:
            dict[@"type-of-shape"] =@"ellipsoid point";
            break;
        case 1:
            dict[@"type-of-shape"] =@"ellipsoid point with uncertainty";
            break;
        case 2:
            dict[@"type-of-shape"] =@"point with altitude and uncertainty";
            break;
        case 3:
            dict[@"type-of-shape"] =@"ellipse on the ellipsoid";
            break;
        case 4:
            dict[@"type-of-shape"] =@"ellipsoid circle sector";
            break;
        case 5:
            dict[@"type-of-shape"] =@"polygon";
            break;
        default:
            dict[@"type-of-shape"] =@"spare";
            break;
    }
    if((bytes[1] & 0x7F) != 1)
    {
        dict[@"error"] = @"invalid-shape-object";
        return dict;
    }
    
    if(len <10)
    {
        dict[@"error"] = @"packet-too-short";
        return dict;
    }

    sign = bytes[3] & 0x80;
    latitiude   = (bytes[3] & 0x7F) << 16;
    latitiude |= bytes[4] << 8;
    latitiude |= bytes[5];
    longitude  = bytes[6] << 16;
    longitude |= bytes[7] << 8;
    longitude |= bytes[8];
    uncertainity_code = bytes[9] & 0x7F;
    confidence_code = bytes[10] & 0x7F;
    double lat = 93206.75555555555556 * latitiude; /* 2 ^ 23 / 90 */
    double lon = 46603.37777777777778 * longitude; /* 2 ^ 24 / 360 */
    double uncertainity = 10.0 * (pow(1.01,(double)uncertainity_code)-1.0);
    double confidence = 10.0 * (pow(1.01,(double)confidence_code)-1.0);
    if(sign)
    {
        lat = -lat;
    }
    dict[@"longitude"]      = @(lon);
    dict[@"latitude"]       = @(lat);
    dict[@"uncertainity"]   = @(uncertainity);
    if(confidence_code == 0)
    {
        dict[@"confidence"] = @"no information";
    }
    else if (confidence_code < 100)
    {
        dict[@"confidence"]   = @(confidence);
    }
    return dict;
}
@end

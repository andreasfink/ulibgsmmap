//
//  UMGSMMAP_Ext_BearerServiceCode.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
/*
BearerServiceCode ::= OCTET STRING (SIZE (1))
-- This type is used to represent the code identifying a single
-- bearer service, a group of bearer services, or all bearer
-- services. The services are defined in TS 3GPP TS 22.002 [3].
-- The internal structure is defined as follows: --
-- plmn-specific bearer services:
-- bits 87654321: defined by the HPLMN operator
-- rest of bearer services: -- bit 8: 0 (unused)
-- bits 7654321: group (bits 7654), and rate, if applicable -- (bits 321)

*/
#import "UMGSMMAP_Ext_BearerServiceCode.h"

@implementation UMGSMMAP_Ext_BearerServiceCode

@synthesize operationName;

- (NSString *) objectName
{
    return @"UMGSMMAP_Ext_BearerServiceCode";
}


- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}

- (UMGSMMAP_Ext_BearerServiceCode *)initWithString:(NSString *)str;
{
    if([str isEqualToString:@"allBearerServices"])
    {
        return [super initWithString:@"00"];
    }
    if([str isEqualToString:@"allDataCDA-Services"])
    {
        return [super initWithString:@"10"];
    }
    if([str isEqualToString:@"allDataCDA-300bps"])
    {
        return [super initWithString:@"11"];
    }
    if([str isEqualToString:@"allDataCDA-1200bps"])
    {
        return [super initWithString:@"12"];
    }
    if([str isEqualToString:@"allDataCDA-1200-75bps"])
    {
        return [super initWithString:@"13"];
    }
    if([str isEqualToString:@"allDataCDA-2400bps"])
    {
        return [super initWithString:@"14"];
    }
    if([str isEqualToString:@"allDataCDA-4800bps"])
    {
        return [super initWithString:@"15"];
    }
    if([str isEqualToString:@"allDataCDA-9600bps"])
    {
        return [super initWithString:@"16"];
    }
    if([str isEqualToString:@"general-dataCDA"])
    {
        return [super initWithString:@"17"];
    }
    if([str isEqualToString:@"allDataCDS-Services"])
    {
        return [super initWithString:@"18"];
    }
    if([str isEqualToString:@"allDataCDS-1200bps"])
    {
        return [super initWithString:@"1A"];
    }
    if([str isEqualToString:@"allDataCDA-2400bps"])
    {
        return [super initWithString:@"1C"];
    }
    if([str isEqualToString:@"allDataCDA-4800bps"])
    {
        return [super initWithString:@"1D"];
    }
    if([str isEqualToString:@"allDataCDA-9600bps"])
    {
        return [super initWithString:@"1E"];
    }
    if([str isEqualToString:@"general-dataCDS"])
    {
        return [super initWithString:@"1F"];
    }

    if([str isEqualToString:@"allPadAccessCA-Services"])
    {
        return [super initWithString:@"20"];
    }

    if([str isEqualToString:@"padAccessCA-300bps"])
    {
        return [super initWithString:@"21"];
    }
    if([str isEqualToString:@"padAccessCA-1200bps"])
    {
        return [super initWithString:@"22"];
    }
    if([str isEqualToString:@"padAccessCA-1200-75bps"])
    {
        return [super initWithString:@"23"];
    }
    if([str isEqualToString:@"padAccessCA-2400bps"])
    {
        return [super initWithString:@"24"];
    }
    if([str isEqualToString:@"padAccessCA-4800bps"])
    {
        return [super initWithString:@"25"];
    }
    if([str isEqualToString:@"padAccessCA-9600bps"])
    {
        return [super initWithString:@"26"];
    }
    if([str isEqualToString:@"general-padAccessCA"])
    {
        return [super initWithString:@"27"];
    }


    if([str isEqualToString:@"allDataPDS-Services"])
    {
        return [super initWithString:@"28"];
    }
    if([str isEqualToString:@"dataPDS-2400bps"])
    {
        return [super initWithString:@"2C"];
    }
    if([str isEqualToString:@"dataPDS-4800bps"])
    {
        return [super initWithString:@"2D"];
    }
    if([str isEqualToString:@"dataPDS-9600bps"])
    {
        return [super initWithString:@"2E"];
    }
    if([str isEqualToString:@"general-dataPDS"])
    {
        return [super initWithString:@"2F"];
    }
    if([str isEqualToString:@"allAlternateSpeech-DataCDA"])
    {
        return [super initWithString:@"30"];
    }
    if([str isEqualToString:@"allAlternateSpeech-DataCDS"])
    {
        return [super initWithString:@"38"];
    }
    if([str isEqualToString:@"allSpeechFollowedByDataCDA"])
    {
        return [super initWithString:@"40"];
    }
    if([str isEqualToString:@"allSpeechFollowedByDataCDS"])
    {
        return [super initWithString:@"48"];
    }

    if([str isEqualToString:@"allDataCircuitAsynchronous"])
    {
        return [super initWithString:@"50"];
    }
    if([str isEqualToString:@"allAsynchronousServices"])
    {
        return [super initWithString:@"60"];
    }
    if([str isEqualToString:@"allDataCircuitSynchronous"])
    {
        return [super initWithString:@"58"];
    }
    if([str isEqualToString:@"allSynchronousServices"])
    {
        return [super initWithString:@"68"];
    }
    //
    if([str isEqualToString:@"allPLMN-specificBS"])
    {
        return [super initWithString:@"70"];
    }

    if([str isEqualToString:@"plmn-specificBS-1"])
    {
        return [super initWithString:@"71"];
    }

    if([str isEqualToString:@"plmn-specificBS-2"])
    {
        return [super initWithString:@"72"];
    }

    if([str isEqualToString:@"plmn-specificBS-3"])
    {
        return [super initWithString:@"73"];
    }

    if([str isEqualToString:@"plmn-specificBS-4"])
    {
        return [super initWithString:@"74"];
    }

    if([str isEqualToString:@"plmn-specificBS-5"])
    {
        return [super initWithString:@"75"];
    }

    if([str isEqualToString:@"plmn-specificBS-6"])
    {
        return [super initWithString:@"76"];
    }

    if([str isEqualToString:@"plmn-specificBS-7"])
    {
        return [super initWithString:@"77"];
    }

    if([str isEqualToString:@"plmn-specificBS-8"])
    {
        return [super initWithString:@"78"];
    }

    if([str isEqualToString:@"plmn-specificBS-9"])
    {
        return [super initWithString:@"79"];
    }

    if([str isEqualToString:@"plmn-specificBS-A"])
    {
        return [super initWithString:@"7A"];
    }

    if([str isEqualToString:@"plmn-specificBS-B"])
    {
        return [super initWithString:@"7B"];
    }

    if([str isEqualToString:@"plmn-specificBS-C"])
    {
        return [super initWithString:@"7C"];
    }

    if([str isEqualToString:@"plmn-specificBS-D"])
    {
        return [super initWithString:@"7D"];
    }

    if([str isEqualToString:@"plmn-specificBS-E"])
    {
        return [super initWithString:@"7E"];
    }

    if([str isEqualToString:@"plmn-specificBS-F"])
    {
        return [super initWithString:@"7F"];
    }
    return [super initWithString:str];

}

@end



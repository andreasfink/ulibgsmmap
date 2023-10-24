//
//  UMGSMMAP_SignalInfo.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_SignalInfo.h>
#import <ulibgsmmap/UMLayerGSMMAP_UserProtocol.h>
#import <ulibgsmmap/UMLayerGSMMAP.h>

@implementation UMGSMMAP_SignalInfo

@synthesize operationName;

- (NSString *) objectName
{
	return @"UMGSMMAP_SignalInfo";
}

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    if([context isKindOfClass:[UMLayerGSMMAP class]])
    {
        UMLayerGSMMAP *map = (UMLayerGSMMAP *)context;
        decoded_sms = [map.user decodeSmsObject:_asn1_data context:context];
    }
    else if([context respondsToSelector:@selector(decodeSmsObject:context:)])
    {
        decoded_sms = [context decodeSmsObject:_asn1_data context:context];
    }
    return self;
}

- (id)objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];

    dict[@"rawData"] = _asn1_data;
    if(decoded_sms)
    {
        dict[@"decoded-sms"] = decoded_sms;
    }
    return dict;
}
@end

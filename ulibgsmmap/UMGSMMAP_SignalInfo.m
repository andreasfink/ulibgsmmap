//
//  UMGSMMAP_SignalInfo.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_SignalInfo.h"
#import "UMLayerGSMMAP_UserProtocol.h"
#import "UMLayerGSMMAP.h"

@implementation UMGSMMAP_SignalInfo

@synthesize operationName;

- (NSString *) objectName
{
	return @"UMGSMMAP_SignalInfo";
}

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    id<UMLayerGSMMAP_UserProtocol> map_user = NULL;
    if([context isKindOfClass:[UMLayerTCAP class]])
    {
        UMLayerTCAP *tcap = (UMLayerTCAP *) context;
        UMLayerGSMMAP *map = (UMLayerGSMMAP *)tcap.tcapDefaultUser;
        map_user = map.user;
    }
    else if([context isKindOfClass:[UMLayerGSMMAP class]])
    {
        UMLayerGSMMAP *map = (UMLayerGSMMAP *)context;
        decoded_sms = [map.user decodeSmsObject:asn1_data context:context];
    }
    else if([context respondsToSelector:@selector(decodeSmsObject:context:)])
    {
        decoded_sms = [context decodeSmsObject:asn1_data context:context];
    }
    return self;
}

- (id)objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];

    dict[@"rawData"] = asn1_data;
    if(decoded_sms)
    {
        dict[@"decoded-sms"] = decoded_sms;
    }
    return dict;
}
@end

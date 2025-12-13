//
//  UMGSMMAP_BeingSubscriberActivityArg.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 06.08.2025.
//  Copyright © 2025 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMGSMMAP_BeginSubscriberActivityArg.h"

@implementation UMGSMMAP_BeginSubscriberActivityArg


- (void) processBeforeEncode
{
    [super processBeforeEncode];
    [_asn1_tag setTagIsConstructed];
    _asn1_list = [[NSMutableArray alloc]init];
    if(_imsi)
    {
        [_asn1_list addObject:_imsi];
    }
    if(_msisdn)
    {
        _msisdn.asn1_tag.tagClass = UMASN1Class_Private;
        _msisdn.asn1_tag.tagNumber = 28;
        [_asn1_list addObject:_msisdn];
    }
}


- (UMGSMMAP_BeginSubscriberActivityArg *) processAfterDecodeWithContext:(id)context
{
    int p=0;
    UMASN1Object *o = [self getObjectAtPosition:p++];
    if(o)
    {
        _imsi = [[UMGSMMAP_IMSI alloc]initWithASN1Object:o context:context];
        o = [self getObjectAtPosition:p++];
        if((o.asn1_tag.tagClass == UMASN1Class_Private) && (o.asn1_tag.tagNumber == 28))
        {
            _msisdn = [[UMGSMMAP_AddressString alloc]initWithASN1Object:o context:context];
        }
    }
    return self;
}

- (NSString *) objectName
{
    return @"BeginSubscriberActivityArg";
}

- (id) objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    if(_imsi)
    {
        dict[@"imsi"] = _imsi.objectValue;
    }
    if(_msisdn)
    {
        dict[@"msisdn"] = _msisdn.objectValue;
    }
    return dict;
}

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}


- (NSString *)operationName
{
    return [self objectName];
}

- (void)setOperationName:(NSString *)operationName
{
    
}
@end

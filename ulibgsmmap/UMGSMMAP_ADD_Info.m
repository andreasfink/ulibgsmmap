//
//  UMGSMMAP_ADD_Info.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 09.07.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMGSMMAP_ADD_Info.h"

@implementation UMGSMMAP_ADD_Info
@synthesize operationName;

- (void) processBeforeEncode
{
    [super processBeforeEncode];
    asn1_tag.isConstructed=YES;
    asn1_list = [[NSMutableArray alloc]init];
    if(_imeisv)
    {
        _imeisv.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        _imeisv.asn1_tag.tagNumber = 0;
        [asn1_list addObject:_imeisv];
    }
    else
    {
        @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
                                       reason:@"imeisv missing"
                                     userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
    }
    if(_skipSubscriberDataUpdate)
    {
        UMASN1Null *n = [[UMASN1Null alloc]init];
        n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        n.asn1_tag.tagNumber = 1;
        [asn1_list addObject:n];
    }
}


- (UMGSMMAP_ADD_Info *) processAfterDecodeWithContext:(id)context
{
    int p=0;
    UMASN1Object *o = [self getObjectAtPosition:p++];
    if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
    {
        _imeisv = [[UMGSMMAP_IMEI alloc]initWithASN1Object:o context:context];
        o = [self getObjectAtPosition:p++];
    }
    if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
    {
        _skipSubscriberDataUpdate = YES;
        // o = [self getObjectAtPosition:p++];
    }
    return self;
}

- (NSString *) objectName
{
    return @"MSISDN-BS";
}
- (id) objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    if(_imeisv)
    {
        dict[@"imeisv"] = _imeisv.objectValue;
    }
    if(_skipSubscriberDataUpdate)
    {
        dict[@"skipSubscriberDataUpdate"] = @(YES);
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


@end


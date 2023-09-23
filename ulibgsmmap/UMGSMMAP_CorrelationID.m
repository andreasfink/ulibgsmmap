//
//  UMGSMMAPCorrelationID.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 09.05.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibgsmmap/UMGSMMAP_CorrelationID.h>
#import <ulibgsmmap/UMGSMMAP_HLR_Id.h>
#import <ulibgsmmap/UMGSMMAP_SIP_URI.h>

/*
CorrelationID ::= SEQUENCE
{
    hlr-id      [0] HLR-Id  OPTIONAL,
    sip-uri-A   [1] SIP-URI OPTIONAL,
    sip-uri-B   [2] SIP-URI
}
*/
@implementation UMGSMMAP_CorrelationID

- (void) processBeforeEncode
{
    [super processBeforeEncode];
    [_asn1_tag setTagIsConstructed];
    _asn1_list = [[NSMutableArray alloc]init];
    if(_hlr_id)
    {
        _hlr_id.asn1_tag.tagNumber = 0;
        _hlr_id.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_hlr_id];
    }
    if(_sip_uri_A)
    {
        _sip_uri_A.asn1_tag.tagNumber = 1;
        _sip_uri_A.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_sip_uri_A];
    }
    if(_sip_uri_B)
    {
        _sip_uri_B.asn1_tag.tagNumber = 1;
        _sip_uri_B.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_sip_uri_B];
    }
}


- (UMGSMMAP_CorrelationID *) processAfterDecodeWithContext:(id)context
{
    int p=0;
    UMASN1Object *o = [self getObjectAtPosition:p++];
    if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
    {
        _hlr_id = [[UMGSMMAP_HLR_Id alloc]initWithASN1Object:o context:context];
        o = [self getObjectAtPosition:p++];
    }
    if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
    {
        _sip_uri_A = [[UMGSMMAP_SIP_URI alloc]initWithASN1Object:o context:context];
        o = [self getObjectAtPosition:p++];
    }
    if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
    {
        _sip_uri_B = [[UMGSMMAP_SIP_URI alloc]initWithASN1Object:o context:context];
        o = [self getObjectAtPosition:p++];
    }
    return self;
}

- (NSString *) objectName
{
    return @"CorrelationID";
}

- (id) objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    if(_hlr_id)
    {
        dict[@"hlr-id"] = _hlr_id.objectValue;
    }
    if(_sip_uri_A)
    {
        dict[@"sip-uri-A"] = _sip_uri_A.objectValue;
    }
    if(_sip_uri_B)
    {
        dict[@"sip-uri-B"] = _sip_uri_B.objectValue;
    }
    return dict;
}

@end


//
//  UMGSMMAP_Reject.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 02.01.2024.
//  Copyright © 2024 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMGSMMAP_Reject.h"

@implementation UMGSMMAP_Reject

- (void) processBeforeEncode
{

#define IF_ADD_ASN1_NULL(list,condition,tag)                   \
    if(condition)                                              \
    {                                                          \
        UMASN1Null *n = [[UMASN1Null alloc]init];              \
        n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;     \
        n.asn1_tag.tagNumber = tag;                            \
        [list addObject:n];                                    \
    }


    [super processBeforeEncode];
    [_asn1_tag setTagIsConstructed];
    _asn1_list = [[NSMutableArray alloc]init];
    if(_invokeIDRej)
    {
        [_asn1_list addObject:_invokeIDRej];
    }
    if(_problem)
    {
        [_asn1_list addObject:_problem];
    }
    if(_extensionContainer)
    {
        _extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        _extensionContainer.asn1_tag.tagNumber = 2;
        [_asn1_list addObject:_extensionContainer];
    }
    IF_ADD_ASN1_NULL(_asn1_list,_currentLocation,3);
    if(_requestedDomain)
    {
        _requestedDomain.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        _requestedDomain.asn1_tag.tagNumber = 4;
        [_asn1_list addObject:_requestedDomain];
    }
    IF_ADD_ASN1_NULL(_asn1_list,_imei,6);
    IF_ADD_ASN1_NULL(_asn1_list,_ms_classmark,5);
    IF_ADD_ASN1_NULL(_asn1_list,_mnpRequestedInfo,7);
    IF_ADD_ASN1_NULL(_asn1_list,_locationInformationEPS_Supported,11);
    IF_ADD_ASN1_NULL(_asn1_list,_t_adsData,8);
    if(_requestedNodes)
    {
        _requestedNodes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        _requestedNodes.asn1_tag.tagNumber = 9;
        [_asn1_list addObject:_requestedNodes];
    }
    IF_ADD_ASN1_NULL(_asn1_list,_servingNodeIndication,10);
    IF_ADD_ASN1_NULL(_asn1_list,_localTimeZoneRequest,12);
}

- (UMGSMMAP_Reject *) processAfterDecodeWithContext:(id)context
{
    int p=0;
    UMASN1Object *o = [self getObjectAtPosition:p++];
    if((o) && (o.asn1_tag.tagNumber == UMASN1Primitive_integer) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
    {
        _invokeIDRej = [[UMASN1Integer alloc]initWithASN1Object:o context:context];
        o = [self getObjectAtPosition:p++];
    }
    if((o) && (o.asn1_tag.tagNumber == UMASN1Primitive_enumerated) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
    {
        _problem = [[UMASN1Enumerated alloc]initWithASN1Object:o context:context];
        o = [self getObjectAtPosition:p++];
    }

    while(o)
    {
        if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
        {
            _extensionContainer = (UMGSMMAP_ExtensionContainer *)o;
            //[[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:initWithASN1Object:o context:context];
        }
        else if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
        {
            _currentLocation = YES;
        }
        else if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
        {
            _requestedDomain = [[UMASN1Integer alloc]initWithASN1Object:o context:context];
        }
        else if((o) && (o.asn1_tag.tagNumber == 6) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
        {
            _imei = YES;
        }
        else if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
        {
            _ms_classmark = YES;
        }
        else if((o) && (o.asn1_tag.tagNumber == 7) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
        {
            _mnpRequestedInfo = YES;
        }
        else if((o) && (o.asn1_tag.tagNumber == 11) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
        {
            _locationInformationEPS_Supported = YES;
        }
        else if((o) && (o.asn1_tag.tagNumber == 8) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
        {
            _t_adsData = YES;
        }
        else if((o) && (o.asn1_tag.tagNumber == 9) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
        {
            _requestedNodes = [[UMASN1BitString alloc]initWithASN1Object:o context:context];
        }
        else if((o) && (o.asn1_tag.tagNumber == 10) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
        {
            _servingNodeIndication = YES;
        }
        else if((o) && (o.asn1_tag.tagNumber == 12) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
        {
            _localTimeZoneRequest = YES;
        }
        o = [self getObjectAtPosition:p++];
    }
    return self;
}

- (NSString *) objectName
{
    return @"Reject";
}
- (id) objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    
    
    /*
    invokeIDRej               I NTEGER OPTIONAL,
    problem                         ENUMERATED
    extensionContainer                [2] IMPLICIT ExtensionContainer OPTIONAL,
    ... ,
    currentLocation                    [3] IMPLICIT NULL OPTIONAL,
    requestedDomain                    [4] IMPLICIT INTEGER OPTIONAL,
    imei                               [6] IMPLICIT NULL OPTIONAL,
    ms-classmark                       [5] IMPLICIT NULL OPTIONAL,
    mnpRequestedInfo                   [7] IMPLICIT NULL OPTIONAL,
    locationInformationEPS-Supported   [11] IMPLICIT NULL OPTIONAL,
    t-adsData                          [8] IMPLICIT NULL OPTIONAL,
    requestedNodes                     [9] IMPLICIT BIT STRING OPTIONAL,
    servingNodeIndication              [10] IMPLICIT NULL OPTIONAL,
    localTimeZoneRequest               [12] IMPLICIT NULL OPTIONAL
    */
    if(_invokeIDRej)
    {
        dict[@"invokeIDRej"] = _invokeIDRej.objectValue;
    }
    if(_problem)
    {
        dict[@"problem"] = _problem.objectValue;
    }
    if(_extensionContainer)
    {
        dict[@"extensionContainer"] = _extensionContainer.objectValue;
    }
    if(_currentLocation)
    {
        dict[@"currentLocation"] = @(YES);
    }
    if(_requestedDomain)
    {
        dict[@"requestedDomain"] = _requestedDomain.objectValue;
    }
    if(_imei)
    {
        dict[@"imei"] = @(YES);
    }
    if(_ms_classmark)
    {
        dict[@"ms-classmark"] = @(YES);
    }
    if(_mnpRequestedInfo)
    {
        dict[@"mnpRequestedInfo"] = @(YES);
    }
    if(_locationInformationEPS_Supported)
    {
        dict[@"locationInformationEPS-Supported"] = @(YES);
    }
    if(_t_adsData)
    {
        dict[@"t-adsData"] = @(YES);
    }
    if(_requestedNodes)
    {
        dict[@"requestedNodes"] = _requestedNodes.objectValue;
    }
    if(_servingNodeIndication)
    {
        dict[@"servingNodeIndication"] = @(YES);
    }
    if(_localTimeZoneRequest)
    {
        dict[@"localTimeZoneRequest"] = @(YES);
    }
    return dict;
}

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return (UMASN1Object<UMGSMMAP_asn1_protocol> *)self;
}

@end


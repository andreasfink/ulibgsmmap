//
//  UMGSMMAP_CheckIMSIArg.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 28.02.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMGSMMAP_CheckIMEIArg.h"
#import "UMGSMMAP_RequestedEquipmentInfo.h"
#import "UMGSMMAP_IMEI.h"
#import "UMGSMMAP_ExtensionContainer.h"
#import "UMGSMMAP_IMSI.h"

@implementation UMGSMMAP_CheckIMEIArg
    
- (void) processBeforeEncode
{
    [super processBeforeEncode];
    [asn1_tag setTagIsConstructed];
    asn1_list = [[NSMutableArray alloc]init];
    if(_imei==NULL)
    {
        @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
                                       reason:@"UMGSMMAP_CheckIMEIArg imei missing"
                                     userInfo:NULL]);
    }
    [asn1_list addObject:_imei];
    if(_requestedEquipmentInfo == NULL)
    {
        @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
                                       reason:@"UMGSMMAP_CheckIMEIArg requestedEquipmentInfo missing"
                                     userInfo:NULL]);
    }
    [asn1_list addObject:_requestedEquipmentInfo];

    if(_imsi)
    {
        _imsi.asn1_tag.tagClass = UMASN1Class_Private;
        _imsi.asn1_tag.tagNumber = 1;
        [asn1_list addObject:_imsi];
    }
    if(_locationInformation)
    {
        _locationInformation.asn1_tag.tagClass = UMASN1Class_Private;
        _locationInformation.asn1_tag.tagNumber = 3;
        [asn1_list addObject:_locationInformation];
    }
    if(_extensionContainer)
    {
        [asn1_list addObject:_extensionContainer];
    }
}
    
    
- (UMGSMMAP_CheckIMEIArg *) processAfterDecodeWithContext:(id)context
{
    int p=0;
    UMASN1Object *o = [self getObjectAtPosition:p++];
    if(o)
    {
        _imei = [[UMGSMMAP_IMEI alloc]initWithASN1Object:o context:context];
        o = [self getObjectAtPosition:p++];
    }
    if((o) && (o.asn1_tag.tagClass == UMASN1Class_Universal) && (o.asn1_tag.tagNumber == UMASN1Primitive_bitstring))
    {
        _requestedEquipmentInfo = [[UMGSMMAP_RequestedEquipmentInfo alloc]initWithASN1Object:o context:context];
        o = [self getObjectAtPosition:p++];
    }
    if((o) && (o.asn1_tag.tagClass == UMASN1Class_Private) && (o.asn1_tag.tagNumber == 1))
    {
        _imsi = [[UMGSMMAP_IMSI alloc]initWithASN1Object:o context:context];
        o = [self getObjectAtPosition:p++];
    }
    if((o) && (o.asn1_tag.tagClass == UMASN1Class_Private) && (o.asn1_tag.tagNumber == 3))
    {
        _locationInformation = [[UMASN1OctetString alloc]initWithASN1Object:o context:context];
        o = [self getObjectAtPosition:p++];
    }
    if((o) && (o.asn1_tag.tagClass == UMASN1Class_Universal) && (o.asn1_tag.tagNumber == UMASN1Primitive_sequence))
    {
        _extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
        o = [self getObjectAtPosition:p++];
    }
    while(o)
    {
        /* ... */
        o = [self getObjectAtPosition:p++];
    }
    return self;
}
    
- (NSString *) objectName
{
    return @"CheckIMEIArg";
}

- (id) objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    if(_imei)
    {
        dict[@"imei"] = _imei.objectValue;
    }
    if(_requestedEquipmentInfo)
    {
        dict[@"requestedEquipmentInfo"] = _requestedEquipmentInfo.objectValue;
    }
    if(_imsi)
    {
        dict[@"imsi"] = _imsi.objectValue;
    }
    if(_locationInformation)
    {
        dict[@"locationInformation"] = _locationInformation.objectValue;
    }
    if(_extensionContainer)
    {
        dict[@"extensionContainer"] = _extensionContainer.objectValue;
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


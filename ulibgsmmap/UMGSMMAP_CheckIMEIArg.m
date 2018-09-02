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
    [_asn1_tag setTagIsConstructed];
    _asn1_list = [[NSMutableArray alloc]init];
    if(_imei==NULL)
    {
        @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
                                       reason:@"UMGSMMAP_CheckIMEIArg imei missing"
                                     userInfo:NULL]);
    }
    [_asn1_list addObject:_imei];
    if(_requestedEquipmentInfo == NULL)
    {
        @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
                                       reason:@"UMGSMMAP_CheckIMEIArg requestedEquipmentInfo missing"
                                     userInfo:NULL]);
    }
    [_asn1_list addObject:_requestedEquipmentInfo];

    if(_imsi)
    {
        _imsi.asn1_tag.tagClass = UMASN1Class_Private;
        _imsi.asn1_tag.tagNumber = 1;
        [_asn1_list addObject:_imsi];
    }
    if(_locationInformation)
    {
        _locationInformation.asn1_tag.tagClass = UMASN1Class_Private;
        _locationInformation.asn1_tag.tagNumber = 3;
        [_asn1_list addObject:_locationInformation];
    }
    if(_extensionContainer)
    {
        [_asn1_list addObject:_extensionContainer];
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
        self.locationInformation = [[UMASN1OctetString alloc]initWithASN1Object:o context:context];
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


- (void)setLocationInformation:(UMASN1OctetString *)o
{
    _locationInformation = 0;
    [self locationInfoToFields];
}

- (UMASN1OctetString *)locationInformation
{
    [self fieldsToLocationInfo];
    return _locationInformation;
}

- (void)locationInfoToFields
{
    NSData *d = _locationInformation.asn1_data;
    if(d.length>0)
    {
        const uint8_t *b = d.bytes;
        
        /* see also https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=7648 */
        _rat = b[0];
        if((_rat==0) && (d.length >= 5))
        {
            _lac = (b[1] <<8) | b[2];
            _ci = (b[3] <<8) | b[4];
        }
        else if(((_rat==1) || (_rat==2))&& (d.length >= 5))
        {
            _lac = (b[1] <<8) | b[2];
            _sac = (b[3] <<8) | b[4];
        }
        _locationInformationPresent = YES;
    }
    else
    {
        _locationInformationPresent = NO;
    }
}

- (void)fieldsToLocationInfo
{
    if(_locationInformationPresent)
    {
        if(_rat==0) /* GSM */
        {
            NSString *s = [[NSString alloc]initWithFormat:@"%01x%02x%02x",_rat,_lac,_ci];
            _locationInformation = [[UMASN1OctetString alloc]initWithString:s];
        }
        else if((_rat==1) || (_rat==2))
        {
            NSString *s = [[NSString alloc]initWithFormat:@"%01x%02x%02x",_rat,_lac,_sac];
            _locationInformation = [[UMASN1OctetString alloc]initWithString:s];
            
        }
        else if(_rat == 0x0F)
        {
            _locationInformation = [[UMASN1OctetString alloc]initWithString:@"0F"];
        }
    }
    else
    {
        _locationInformation = NULL;
    }
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
    if(_locationInformationPresent)
    {
        dict[@"locationInformation"] = _locationInformation.objectValue;
        switch(_rat)
        {
            case 0:
                dict[@"locationInformationRat"] = @(_rat);
                dict[@"locationInformationLac"] = @(_lac);
                dict[@"locationInformationCi"] = @(_ci);
                break;
           case 1:
                dict[@"locationInformationRat"] = @(_rat);
                dict[@"locationInformationRatDescription"] = @"UMTS";
                dict[@"locationInformationLac"] = @(_lac);
                dict[@"locationInformationSac"] = @(_sac);
                break;
           case 2:
                dict[@"locationInformationRat"] = @(_rat);
                dict[@"locationInformationRatDescription"] = @"LTE";
                dict[@"locationInformationLac"] = @(_lac);
                dict[@"locationInformationSac"] = @(_sac);
                break;
            case 0xF:
                dict[@"locationInformationRat"] = @(_rat);
                dict[@"locationInformationRatDescription"] = @"No Information";
                break;
            default:
                dict[@"locationInformationRat"] = @(_rat);
                dict[@"locationInformationRatDescription"] = @"Unknown RAT";
                break;
        }
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


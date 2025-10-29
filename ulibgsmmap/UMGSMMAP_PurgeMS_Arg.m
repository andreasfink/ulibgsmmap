//
//  UMGSMMAP_PurgeMS_Arg.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_PurgeMS_Arg.h>

@implementation UMGSMMAP_PurgeMS_Arg

- (void) processBeforeEncode
{
    [super processBeforeEncode];
    [_asn1_tag setTagIsConstructed];
    _asn1_tag.tagNumber = 3;
    _asn1_tag.tagClass  = UMASN1Class_ContextSpecific;
    _asn1_list = [[NSMutableArray alloc]init];
    if(_imsi)
    {
        [_asn1_list addObject:_imsi];
    }
    if(_vlr_Number)
    {
        _vlr_Number.asn1_tag.tagNumber = 0;
        _vlr_Number.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_vlr_Number];
    }
    if(_sgsn_Number)
    {
        _sgsn_Number.asn1_tag.tagNumber = 1;
        _sgsn_Number.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_sgsn_Number];
    }
    if(_extensionContainer)
    {
        [_asn1_list addObject:_extensionContainer];
    }
    if(_locationInformation)
    {
        _locationInformation.asn1_tag.tagNumber = 2;
        _locationInformation.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_locationInformation];
        
    }
    if(_locationInformationGPRS)
    {
        _locationInformationGPRS.asn1_tag.tagNumber = 3;
        _locationInformationGPRS.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_locationInformationGPRS];
        
    }
    if(_locationInformationEPS)
    {
        _locationInformationEPS.asn1_tag.tagNumber = 3;
        _locationInformationEPS.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_locationInformationEPS];

    }

}


- (UMGSMMAP_PurgeMS_Arg *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		_imsi = [[UMGSMMAP_IMSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		_vlr_Number = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		_sgsn_Number = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == UMASN1Primitive_sequence) && (o.asn1_tag.tagClass==UMASN1Class_Universal))
	{
		_extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
    if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
    {
        _locationInformation = [[UMGSMMAP_LocationInformation alloc]initWithASN1Object:o context:context];
        o = [self getObjectAtPosition:p++];
    }
    if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
    {
        _locationInformationGPRS = [[UMGSMMAP_LocationInformationGPRS alloc]initWithASN1Object:o context:context];
        o = [self getObjectAtPosition:p++];
    }
    if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
    {
        _locationInformationEPS = [[UMGSMMAP_LocationInformationEPS alloc]initWithASN1Object:o context:context];
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
	return @"PurgeMS-Arg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(_imsi)
	{
		dict[@"imsi"] = _imsi.objectValue;
	}
	if(_vlr_Number)
	{
		dict[@"vlr-Number"] = _vlr_Number.objectValue;
	}
	if(_sgsn_Number)
	{
		dict[@"sgsn-Number"] = _sgsn_Number.objectValue;
	}
	if(_extensionContainer)
	{
		dict[@"extensionContainer"] = _extensionContainer.objectValue;
	}
    if(_locationInformation)
    {
        dict[@"locationInformation"] = _locationInformation.objectValue;
    }
    if(_locationInformationGPRS)
    {
        dict[@"locationInformationGPRS"] = _locationInformationGPRS.objectValue;
    }
    if(_locationInformationEPS)
    {
        dict[@"locationInformationEPS"] = _locationInformationEPS.objectValue;
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


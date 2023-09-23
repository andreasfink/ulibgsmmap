//
//  UMGSMMAP_VLR_Capability.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_VLR_Capability.h>

@implementation UMGSMMAP_VLR_Capability

@synthesize operationName;

- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(_supportedCamelPhases)
	{
		_supportedCamelPhases.asn1_tag.tagNumber = 0;
		_supportedCamelPhases.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:_supportedCamelPhases];
	}
	if(_extensionContainer)
	{
		[_asn1_list addObject:_extensionContainer];
	}
    if(_solsaSupportIndicator)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 2;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:n];
	}
    if(_istSupportIndicator)
    {
        _istSupportIndicator.asn1_tag.tagNumber = 1;
        _istSupportIndicator.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_istSupportIndicator];

    }
    if(_superChargerSupportedInServingNetworkEntity)
    {
        _superChargerSupportedInServingNetworkEntity.asn1_tag.tagNumber = 3;
        _superChargerSupportedInServingNetworkEntity.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_superChargerSupportedInServingNetworkEntity];
    }
    if(_longFTNSupported)
    {
        UMASN1Null *n = [[UMASN1Null alloc]init];
        n.asn1_tag.tagNumber = 4;
        n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:n];
    }
    if(_supportedLCS_CapabilitySets)
    {
        _supportedLCS_CapabilitySets.asn1_tag.tagNumber = 5;
        _supportedLCS_CapabilitySets.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_supportedLCS_CapabilitySets];
    }
    if(_offeredCamel4CSIs)
    {
        _offeredCamel4CSIs.asn1_tag.tagNumber = 6;
        _offeredCamel4CSIs.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_offeredCamel4CSIs];

    }
    if(_supportedRAT_TypesIndicator)
    {
        _supportedRAT_TypesIndicator.asn1_tag.tagNumber = 7;
        _supportedRAT_TypesIndicator.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_supportedRAT_TypesIndicator];
    }
    if(_longGroupID_Supported)
    {
        UMASN1Null *n = [[UMASN1Null alloc]init];
        n.asn1_tag.tagNumber = 8;
        n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:n];
    }
    if(_mtRoamingForwardingSupported)
    {
        UMASN1Null *n = [[UMASN1Null alloc]init];
        n.asn1_tag.tagNumber = 9;
        n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:n];
    }
    if(_msisdn_lessOperation_Supported)
    {
        UMASN1Null *n = [[UMASN1Null alloc]init];
        n.asn1_tag.tagNumber = 10;
        n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:n];
    }
    if(_reset_ids_Supported)
    {
        UMASN1Null *n = [[UMASN1Null alloc]init];
        n.asn1_tag.tagNumber = 11;
        n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:n];
    }
}


- (UMGSMMAP_VLR_Capability *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		_supportedCamelPhases = [[UMGSMMAP_SupportedCamelPhases alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		_extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
    
    if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
    {
        _solsaSupportIndicator = YES;
        o = [self getObjectAtPosition:p++];
    }
    if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
    {
        _istSupportIndicator = [[UMGSMMAP_IST_SupportIndicator alloc]initWithASN1Object:o context:context];
        o = [self getObjectAtPosition:p++];
    }
    if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
    {
        _superChargerSupportedInServingNetworkEntity = [[UMGSMMAP_SuperChargerInfo alloc]initWithASN1Object:o context:context];
        o = [self getObjectAtPosition:p++];
    }
    if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
    {
        _longFTNSupported = YES;
        o = [self getObjectAtPosition:p++];
    }
    if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
    {
        _supportedLCS_CapabilitySets = [[UMGSMMAP_SupportedLCS_CapabilitySets alloc]initWithASN1Object:o context:context];
        o = [self getObjectAtPosition:p++];
    }
    if((o) && (o.asn1_tag.tagNumber == 6) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
    {
        _offeredCamel4CSIs = [[UMGSMMAP_OfferedCamel4CSIs alloc]initWithASN1Object:o context:context];
        o = [self getObjectAtPosition:p++];
    }
    if((o) && (o.asn1_tag.tagNumber == 7) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
    {
        _supportedRAT_TypesIndicator = [[UMGSMMAP_SupportedRAT_Types alloc]initWithASN1Object:o context:context];
        o = [self getObjectAtPosition:p++];
    }
    if((o) && (o.asn1_tag.tagNumber == 8) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
    {
        _longGroupID_Supported = YES;
        o = [self getObjectAtPosition:p++];
    }
    if((o) && (o.asn1_tag.tagNumber == 9) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
    {
        _mtRoamingForwardingSupported = YES;
        o = [self getObjectAtPosition:p++];
    }
    if((o) && (o.asn1_tag.tagNumber == 10) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
    {
        _msisdn_lessOperation_Supported = YES;
        o = [self getObjectAtPosition:p++];
    }
    if((o) && (o.asn1_tag.tagNumber == 11) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
    {
        _reset_ids_Supported = YES;
        o = [self getObjectAtPosition:p++];
    }

	return self;
}

- (NSString *) objectName
{
	return @"VLR-Capability";
}

- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(_supportedCamelPhases)
	{
		dict[@"supportedCamelPhases"] = _supportedCamelPhases.objectValue;
	}
	if(_extensionContainer)
	{
		dict[@"extensionContainer"] = _extensionContainer.objectValue;
	}
	if(_solsaSupportIndicator)
	{
		dict[@"solsaSupportIndicator"] = @(YES);
	}
    if(_istSupportIndicator)
    {
        dict[@"istSupportIndicator"] = _istSupportIndicator.objectValue;
    }
    if(_superChargerSupportedInServingNetworkEntity)
    {
        dict[@"superChargerSupportedInServingNetworkEntity"] = _superChargerSupportedInServingNetworkEntity.objectValue;
    }
    if(_longFTNSupported)
    {
        dict[@"solsaSupportIndicator"] = @(YES);
    }
    if(_supportedLCS_CapabilitySets)
    {
        dict[@"supportedLCS_CapabilitySets"] = _supportedLCS_CapabilitySets.objectValue;
    }
    if(_offeredCamel4CSIs)
    {
        dict[@"offeredCamel4CSIs"] = _offeredCamel4CSIs.objectValue;
    }
    if(_supportedRAT_TypesIndicator)
    {
        dict[@"supportedRAT_TypesIndicator"] = _supportedRAT_TypesIndicator.objectValue;
    }
    if(_longGroupID_Supported)
    {
        dict[@"longGroupID_Supported"] = @(YES);
    }
    if(_mtRoamingForwardingSupported)
    {
        dict[@"mtRoamingForwardingSupported"] = @(YES);
    }
    if(_msisdn_lessOperation_Supported)
    {
        dict[@"msisdn_lessOperation_Supported"] = @(YES);
    }
    if(_reset_ids_Supported)
    {
        dict[@"reset_ids_Supported"] = @(YES);
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

- (UMGSMMAP_VLR_Capability *)initWithString:(NSString *)s
{
    self = [super init];
    if(self)
    {
        NSArray *arr = [s componentsSeparatedByString:@","];
        for(NSString *item in arr)
        {
            if([item isEqualToString:@"camel-phase2"])
            {
                if(!_supportedCamelPhases)
                {
                    _supportedCamelPhases = [[UMGSMMAP_SupportedCamelPhases alloc]init];
                }
                [_supportedCamelPhases setBit:0];
            }
            if([item isEqualToString:@"camel-phase1"])
            {
                if(!_supportedCamelPhases)
                {
                    _supportedCamelPhases = [[UMGSMMAP_SupportedCamelPhases alloc]init];
                }
                [_supportedCamelPhases setBit:1];
            }
            if([item isEqualToString:@"solsa-support"])
            {
                _solsaSupportIndicator = YES;
            }
        }
    }
    return self;
}

@end


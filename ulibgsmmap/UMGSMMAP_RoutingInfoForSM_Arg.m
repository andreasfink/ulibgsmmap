//
//  UMGSMMAP_RoutingInfoForSM_Arg.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_RoutingInfoForSM_Arg.h"

@implementation UMGSMMAP_RoutingInfoForSM_Arg

- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(_msisdn)
	{
		_msisdn.asn1_tag.tagNumber = 0;
		_msisdn.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:_msisdn];
	}
	if(_sm_RP_PRI == NULL)
	{
        _sm_RP_PRI =  [[UMASN1Boolean alloc]initAsNo];
    }
    _sm_RP_PRI.asn1_tag.tagNumber = 1;
    _sm_RP_PRI.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
    [_asn1_list addObject:_sm_RP_PRI];

	if(_serviceCentreAddress)
	{
		_serviceCentreAddress.asn1_tag.tagNumber = 2;
		_serviceCentreAddress.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:_serviceCentreAddress];
	}
	if(_extensionContainer)
	{
		_extensionContainer.asn1_tag.tagNumber = 6;
		_extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:_extensionContainer];
	}
	if(_gprsSupportIndicator)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 7;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:n];
	}
	if(_sm_RP_MTI)
	{
		_sm_RP_MTI.asn1_tag.tagNumber = 8;
		_sm_RP_MTI.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:_sm_RP_MTI];
	}
	if(_sm_RP_SMEA)
	{
		_sm_RP_SMEA.asn1_tag.tagNumber = 9;
		_sm_RP_SMEA.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:_sm_RP_SMEA];
	}


    if(_sm_deliveryNotIndtended)
    {
        _sm_deliveryNotIndtended.asn1_tag.tagNumber = 10;
        _sm_deliveryNotIndtended.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_sm_deliveryNotIndtended];
    }

    if(_ip_sm_gwGuidanceIndicator)
    {
        UMASN1Null *n = [[UMASN1Null alloc]init];
        n.asn1_tag.tagNumber = 11;
        n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:n];
    }
    if(_imsi)
    {
        _imsi.asn1_tag.tagNumber = 12;
        _imsi.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_imsi];
    }

    if(_t4_Trigger_Indicator)
    {
        UMASN1Null *n = [[UMASN1Null alloc]init];
        n.asn1_tag.tagNumber = 14;
        n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:n];
    }


    if(_singleAttemptDelivery)
    {
        UMASN1Null *n = [[UMASN1Null alloc]init];
        n.asn1_tag.tagNumber = 13;
        n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:n];
    }

    if(_correlationID)
    {
        _correlationID.asn1_tag.tagNumber = 15;
        _correlationID.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_correlationID];
    }
}

- (UMGSMMAP_RoutingInfoForSM_Arg *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		_msisdn = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		_sm_RP_PRI = [[UMASN1Boolean alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		_serviceCentreAddress = [[UMGSMMAP_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 6) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		_extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 7) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		_gprsSupportIndicator = YES;
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 8) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		_sm_RP_MTI = [[UMGSMMAP_SM_RP_MTI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 9) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		_sm_RP_SMEA = [[UMGSMMAP_SM_RP_SMEA alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	return self;
}

- (NSString *) objectName
{
	return @"RoutingInfoForSM-Arg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(_msisdn)
	{
		dict[@"msisdn"] = _msisdn.objectValue;
	}
	if(_sm_RP_PRI)
	{
		dict[@"sm-RP-PRI"] = _sm_RP_PRI.objectValue;
	}
	if(_serviceCentreAddress)
	{
		dict[@"serviceCentreAddress"] = _serviceCentreAddress.objectValue;
	}
	if(_extensionContainer)
	{
		dict[@"extensionContainer"] = _extensionContainer.objectValue;
	}
	if(_gprsSupportIndicator)
	{
		dict[@"gprsSupportIndicator"] = @(YES);
	}
	if(_sm_RP_MTI)
	{
		dict[@"sm-RP-MTI"] = _sm_RP_MTI.objectValue;
	}
	if(_sm_RP_SMEA)
	{
		dict[@"sm-RP-SMEA"] = _sm_RP_SMEA.objectValue;
	}

    if(_sm_deliveryNotIndtended)
    {
        dict[@"sm-deliveryNotIndtended"] = _sm_deliveryNotIndtended.objectValue;
    }

    if(_ip_sm_gwGuidanceIndicator )
    {
        dict[@"ip-sm-gwGuidanceIndicator"] = @(YES);
    }
    if(_imsi)
    {
        dict[@"imsi"] = _imsi.objectValue;
    }
    if(_t4_Trigger_Indicator)
    {
        dict[@"t4-Trigger-Indicator"] = @(YES);
    }
    if(_singleAttemptDelivery)
    {
        dict[@"singleAttemptDelivery"] = @(YES);
    }
    if(_correlationID)
    {
        dict[@"correlationID"] = _correlationID.objectValue;
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


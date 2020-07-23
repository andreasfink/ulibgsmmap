//
//  UMGSMMAP_UpdateGprsLocationArg.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_UpdateGprsLocationArg.h"

@implementation UMGSMMAP_UpdateGprsLocationArg


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(_imsi)
	{
		[_asn1_list addObject:_imsi];
	}
	if(_sgsn_Number)
	{
		[_asn1_list addObject:_sgsn_Number];
	}
	if(_sgsn_Address)
	{
		[_asn1_list addObject:_sgsn_Address];
	}
	if(_extensionContainer)
	{
		[_asn1_list addObject:_extensionContainer];
	}
	if(_sgsn_Capability != NULL)
	{
		_sgsn_Capability.asn1_tag.tagNumber = 0;
		_sgsn_Capability.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:_sgsn_Capability];
	}
    if(_informPreviousNetworkEntity)
    {
        UMASN1Null *n = [[UMASN1Null alloc]init];
        n.asn1_tag.tagNumber = 1;
        n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:n];
    }

    if(_ps_LCS_NotSupportedByUE)
    {
        UMASN1Null *n = [[UMASN1Null alloc]init];
        n.asn1_tag.tagNumber = 2;
        n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:n];
    }
    if(_v_gmlc_Address != NULL)
    {
        _v_gmlc_Address.asn1_tag.tagNumber = 3;
        _v_gmlc_Address.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_v_gmlc_Address];
    }
    if(_add_info != NULL)
    {
        _add_info.asn1_tag.tagNumber = 4;
        _add_info.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_add_info];
    }
    if(_eps_info != NULL)
    {
        _eps_info.asn1_tag.tagNumber = 5;
        _eps_info.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_eps_info];
    }
    if(_servingNodeTypeIndicator)
    {
       UMASN1Null *n = [[UMASN1Null alloc]init];
       n.asn1_tag.tagNumber = 6;
       n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
       [_asn1_list addObject:n];
    }
    if(_skipSubscriberDataUpdate)
    {
       UMASN1Null *n = [[UMASN1Null alloc]init];
       n.asn1_tag.tagNumber = 7;
       n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
       [_asn1_list addObject:n];
    }
    if(_usedRAT_Type != NULL)
    {
        _usedRAT_Type.asn1_tag.tagNumber = 8;
        _usedRAT_Type.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_usedRAT_Type];
    }
    if(_gprsSubscriptionDataNotNeeded)
    {
        UMASN1Null *n = [[UMASN1Null alloc]init];
        n.asn1_tag.tagNumber = 9;
        n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:n];
    }
    if(_nodeTypeIndicator)
    {
        UMASN1Null *n = [[UMASN1Null alloc]init];
        n.asn1_tag.tagNumber = 10;
        n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:n];
    }
    if(_areaRestricted)
    {
        UMASN1Null *n = [[UMASN1Null alloc]init];
        n.asn1_tag.tagNumber = 11;
        n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:n];
    }
    if(_ue_reachableIndicator)
    {
        UMASN1Null *n = [[UMASN1Null alloc]init];
        n.asn1_tag.tagNumber = 12;
        n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:n];
    }
    if(_epsSubscriptionDataNotNeeded)
    {
        UMASN1Null *n = [[UMASN1Null alloc]init];
        n.asn1_tag.tagNumber = 13;
        n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:n];
    }
    if(_ue_srvcc_Capability)
    {
        _ue_srvcc_Capability.asn1_tag.tagNumber = 14;
        _ue_srvcc_Capability.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_ue_srvcc_Capability];
    }
    if(_eplmn_List)
    {
        _eplmn_List.asn1_tag.tagNumber = 15;
        _eplmn_List.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_eplmn_List];
    }
    if(_mmeNumberforMTSMS)
    {
        _mmeNumberforMTSMS.asn1_tag.tagNumber = 16;
        _mmeNumberforMTSMS.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_mmeNumberforMTSMS];
    }
    if(_smsRegisterRequest)
    {
        _smsRegisterRequest.asn1_tag.tagNumber = 17;
        _smsRegisterRequest.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_smsRegisterRequest];
    }
    if(_sms_Only)
    {
        UMASN1Null *n = [[UMASN1Null alloc]init];
        n.asn1_tag.tagNumber = 18;
        n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:n];
    }
    if(_removalofMMERegistrationforSMS)
    {
        UMASN1Null *n = [[UMASN1Null alloc]init];
        n.asn1_tag.tagNumber = 22;
        n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:n];
    }
    if(_sgsn_Name)
    {
        _sgsn_Name.asn1_tag.tagNumber = 19;
        _sgsn_Name.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_sgsn_Name];
    }
    if(_sgsn_Realm)
    {
        _sgsn_Realm.asn1_tag.tagNumber = 19;
        _sgsn_Realm.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_sgsn_Realm];
    }
    if(_lgd_supportIndicator)
    {
        UMASN1Null *n = [[UMASN1Null alloc]init];
        n.asn1_tag.tagNumber = 21;
        n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:n];
    }
    if(_adjacentPLMN_List)
    {
        _adjacentPLMN_List.asn1_tag.tagNumber = 23;
        _adjacentPLMN_List.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_adjacentPLMN_List];
    }
}


#define     ELSE_IF_CHECK_CONTENT_SPECIFIC(o,p,tag,variable,classType) \
    else if((o) && (o.asn1_tag.tagNumber == tag) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific)) \
    { \
        variable = [[classType alloc]initWithASN1Object:o context:context]; \
        o = [self getObjectAtPosition:p++]; \
    }

#define     ELSE_IF_CHECK_CONTENT_SPECIFIC_BOOL(o,p,tag,variable) \
    else if((o) && (o.asn1_tag.tagNumber == tag) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific)) \
    { \
        variable = YES; \
        o = [self getObjectAtPosition:p++]; \
    }



- (UMGSMMAP_UpdateGprsLocationArg *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		_imsi = [[UMGSMMAP_IMSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		_sgsn_Number = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		_sgsn_Address = [[UMGSMMAP_GSN_Address alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
    if((o) && (o.asn1_tag.tagClass == UMASN1Class_Universal) && (o.asn1_tag.tagNumber == UMASN1Primitive_sequence))
	{
		_extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
        if(0)
        {
            
        }
        ELSE_IF_CHECK_CONTENT_SPECIFIC(o,p,0,_sgsn_Capability,UMGSMMAP_SGSN_Capability)
        ELSE_IF_CHECK_CONTENT_SPECIFIC_BOOL(o,p,1,_informPreviousNetworkEntity)
        ELSE_IF_CHECK_CONTENT_SPECIFIC_BOOL(o,p,2,_ps_LCS_NotSupportedByUE)
        ELSE_IF_CHECK_CONTENT_SPECIFIC(o,p,3,_v_gmlc_Address,UMGSMMAP_GSN_Address)
        ELSE_IF_CHECK_CONTENT_SPECIFIC(o,p,4,_add_info,UMGSMMAP_ADD_Info)
        ELSE_IF_CHECK_CONTENT_SPECIFIC(o,p,5,_eps_info,UMGSMMAP_EPS_Info)
        ELSE_IF_CHECK_CONTENT_SPECIFIC_BOOL(o,p,6,_servingNodeTypeIndicator)
        ELSE_IF_CHECK_CONTENT_SPECIFIC_BOOL(o,p,7,_skipSubscriberDataUpdate)
        ELSE_IF_CHECK_CONTENT_SPECIFIC(o,p,8,_usedRAT_Type,UMGSMMAP_Used_RAT_Type)
        ELSE_IF_CHECK_CONTENT_SPECIFIC_BOOL(o,p,9,_gprsSubscriptionDataNotNeeded)
        ELSE_IF_CHECK_CONTENT_SPECIFIC_BOOL(o,p,10,_nodeTypeIndicator)
        ELSE_IF_CHECK_CONTENT_SPECIFIC_BOOL(o,p,11,_areaRestricted)
        ELSE_IF_CHECK_CONTENT_SPECIFIC_BOOL(o,p,12,_ue_reachableIndicator)
        ELSE_IF_CHECK_CONTENT_SPECIFIC_BOOL(o,p,13,_epsSubscriptionDataNotNeeded)
        ELSE_IF_CHECK_CONTENT_SPECIFIC(o,p,14,_ue_srvcc_Capability,UMGSMMAP_UE_SRVCC_Capability)
        ELSE_IF_CHECK_CONTENT_SPECIFIC(o,p,15,_eplmn_List,UMGSMMAP_EPLMN_List)
        ELSE_IF_CHECK_CONTENT_SPECIFIC(o,p,16,_mmeNumberforMTSMS,UMGSMMAP_ISDN_AddressString)
        ELSE_IF_CHECK_CONTENT_SPECIFIC(o,p,17,_smsRegisterRequest,UMGSMMAP_SMSRegisterRequest)
        ELSE_IF_CHECK_CONTENT_SPECIFIC_BOOL(o,p,18,_sms_Only)
        ELSE_IF_CHECK_CONTENT_SPECIFIC_BOOL(o,p,22,_removalofMMERegistrationforSMS)
        ELSE_IF_CHECK_CONTENT_SPECIFIC(o,p,19,_sgsn_Name,UMGSMMAP_DiameterIdentity)
        ELSE_IF_CHECK_CONTENT_SPECIFIC(o,p,20,_sgsn_Realm,UMGSMMAP_DiameterIdentity)
        ELSE_IF_CHECK_CONTENT_SPECIFIC_BOOL(o,p,21,_lgd_supportIndicator)
        ELSE_IF_CHECK_CONTENT_SPECIFIC(o,p,23,_adjacentPLMN_List,UMGSMMAP_AdjacentPLMN_List)
        else
        {
            o = [self getObjectAtPosition:p++];
        }
	}
	return self;
}



- (NSString *) objectName
{
	return @"UpdateGprsLocationArg";
}

- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(_imsi)
	{
		dict[@"imsi"] = _imsi.objectValue;
	}
	if(_sgsn_Number)
	{
		dict[@"sgsn-Number"] = _sgsn_Number.objectValue;
	}
	if(_sgsn_Address)
	{
		dict[@"sgsn-Address"] = _sgsn_Address.objectValue;
	}
	if(_extensionContainer)
	{
		dict[@"extensionContainer"] = _extensionContainer.objectValue;
	}
	if(_sgsn_Capability)
	{
		dict[@"sgsn-Capability"] = _sgsn_Capability.objectValue;
	}
    if(_informPreviousNetworkEntity)
    {
        dict[@"informPreviousNetworkEntity"] = @(YES);
    }
    if(_ps_LCS_NotSupportedByUE)
    {
        dict[@"ps-LCS-NotSupportedByUE"] = @(YES);
    }
    if(_v_gmlc_Address)
    {
        dict[@"v-gmlc-Address"] = _v_gmlc_Address.objectValue;
    }
    if(_add_info)
    {
        dict[@"add-info"] = _add_info.objectValue;
    }
    if(_eps_info)
    {
        dict[@"eps-info"] = _eps_info.objectValue;
    }
    if(_servingNodeTypeIndicator)
    {
        dict[@"servingNodeTypeIndicator"] = @(YES);
    }
    if(_skipSubscriberDataUpdate)
    {
        dict[@"skipSubscriberDataUpdate"] = @(YES);
    }
    if(_usedRAT_Type)
    {
        dict[@"usedRAT-Type"] = _usedRAT_Type.objectValue;
    }
    
    if(_gprsSubscriptionDataNotNeeded)
    {
        dict[@"gprsSubscriptionDataNotNeeded"] = @(YES);
    }

    if(_nodeTypeIndicator)
    {
        dict[@"nodeTypeIndicator"] = @(YES);
    }

    if(_areaRestricted)
    {
        dict[@"areaRestricted"] = @(YES);
    }
    if(_ue_reachableIndicator)
    {
        dict[@"ue-reachableIndicator"] = @(YES);
    }

    if(_epsSubscriptionDataNotNeeded)
    {
        dict[@"epsSubscriptionDataNotNeeded"] = @(YES);
    }

    if(_ue_srvcc_Capability)
    {
        dict[@"ue-srvcc-Capability"] = _ue_srvcc_Capability.objectValue;
    }
    if(_eplmn_List)
    {
        dict[@"eplmn-List"] = _eplmn_List.objectValue;
    }
    if(_mmeNumberforMTSMS)
    {
        dict[@"mmeNumberforMTSMS"] = _mmeNumberforMTSMS.objectValue;
    }
    if(_smsRegisterRequest)
    {
        dict[@"smsRegisterRequest"] = _smsRegisterRequest.objectValue;
    }
    if(_sms_Only)
    {
        dict[@"sms-Only"] = @(YES);
    }
    if(_removalofMMERegistrationforSMS)
    {
        dict[@"removalofMMERegistrationforSMS"] = @(YES);
    }

    if(_sgsn_Name)
    {
        dict[@"sgsn-Name"] = _sgsn_Name.objectValue;
    }
    if(_sgsn_Realm)
    {
        dict[@"sgsn-Realm"] = _sgsn_Realm.objectValue;
    }
    if(_lgd_supportIndicator)
    {
        dict[@"lgd-supportIndicator"] = @(YES);
    }
    if(_adjacentPLMN_List)
    {
        dict[@"adjacentPLMN-List"] =_adjacentPLMN_List.objectValue;
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


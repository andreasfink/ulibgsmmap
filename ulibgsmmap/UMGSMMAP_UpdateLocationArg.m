//
//  UMGSMMAP_UpdateLocationArg.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_UpdateLocationArg.h>

@implementation UMGSMMAP_UpdateLocationArg


@synthesize	operationName;
@synthesize	imsi;
@synthesize	msc_Number;
@synthesize	vlr_Number;
@synthesize	lmsi;
@synthesize	extensionContainer;
@synthesize	vlr_Capability;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(imsi)
	{
		[_asn1_list addObject:imsi];
	}
	if(msc_Number)
	{
		msc_Number.asn1_tag.tagNumber = 1;
		msc_Number.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:msc_Number];
	}
	if(vlr_Number)
	{
		[_asn1_list addObject:vlr_Number];
	}
	if(lmsi)
	{
		lmsi.asn1_tag.tagNumber = 10;
		lmsi.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:lmsi];
	}
	if(extensionContainer)
	{
		[_asn1_list addObject:extensionContainer];
	}
	if(vlr_Capability)
	{
		vlr_Capability.asn1_tag.tagNumber = 6;
		vlr_Capability.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:vlr_Capability];
	}

    if(_informPreviousNetworkEntity)
    {
        UMASN1Null *n = [[UMASN1Null alloc]init];
        n.asn1_tag.tagNumber = 11;
        n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:n];
    }


    if(_cs_LCS_NotSupportedByUE)
    {
        UMASN1Null *n = [[UMASN1Null alloc]init];
        n.asn1_tag.tagNumber = 12;
        n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:n];
    }

    if(_v_gmlc_address)
    {
        _v_gmlc_address.asn1_tag.tagNumber = 2;
        _v_gmlc_address.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_v_gmlc_address];
    }

    if(_add_info)
    {
        _add_info.asn1_tag.tagNumber = 13;
        _add_info.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_add_info];
    }
    if(_pagingArea)
    {
        _pagingArea.asn1_tag.tagNumber = 14;
        _pagingArea.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_pagingArea];
    }
    if(_skipSubscriberDataUpdate)
    {
        UMASN1Null *n = [[UMASN1Null alloc]init];
        n.asn1_tag.tagNumber = 15;
        n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:n];
    }
    if(_restorationIndicator)
    {
        UMASN1Null *n = [[UMASN1Null alloc]init];
        n.asn1_tag.tagNumber = 16;
        n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:n];
    }
    if(_eplmn_List)
    {
        _eplmn_List.asn1_tag.tagNumber = 3;
        _eplmn_List.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_eplmn_List];
    }
    if(_mme_DiameterAddress)
    {
        _mme_DiameterAddress.asn1_tag.tagNumber = 3;
        _mme_DiameterAddress.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_mme_DiameterAddress];
    }
}


- (UMGSMMAP_UpdateLocationArg *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		imsi = [[UMGSMMAP_IMSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		msc_Number = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		vlr_Number = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 10) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		lmsi = [[UMGSMMAP_LMSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if((o) && (o.asn1_tag.tagNumber == 6) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			vlr_Capability = [[UMGSMMAP_VLR_Capability alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}

        else if((o) && (o.asn1_tag.tagNumber == 11) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
        {
            _informPreviousNetworkEntity = YES;
            o = [self getObjectAtPosition:p++];
        }
        else if((o) && (o.asn1_tag.tagNumber == 12) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
        {
            _cs_LCS_NotSupportedByUE = YES;
            o = [self getObjectAtPosition:p++];
        }
        else if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
        {
            _v_gmlc_address = [[UMGSMMAP_GSN_Address  alloc]initWithASN1Object:o context:context];
            o = [self getObjectAtPosition:p++];
        }
        else if((o) && (o.asn1_tag.tagNumber == 13) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
        {
            _add_info = [[UMGSMMAP_ADD_Info alloc]initWithASN1Object:o context:context];
            o = [self getObjectAtPosition:p++];
        }
        else if((o) && (o.asn1_tag.tagNumber == 14) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
        {
            _pagingArea = [[UMGSMMAP_PagingArea alloc]initWithASN1Object:o context:context];
            o = [self getObjectAtPosition:p++];
        }
        else if((o) && (o.asn1_tag.tagNumber == 15) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
        {
            _skipSubscriberDataUpdate =YES;
            o = [self getObjectAtPosition:p++];
        }
        else if((o) && (o.asn1_tag.tagNumber == 16) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
        {
            _restorationIndicator = YES;
            o = [self getObjectAtPosition:p++];
        }
        else if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
        {
            _eplmn_List  = [[UMGSMMAP_EPLMN_List alloc]initWithASN1Object:o context:context];
            o = [self getObjectAtPosition:p++];
        }
        else if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
        {
            _mme_DiameterAddress = [[UMGSMMAP_NetworkNodeDiameterAddress alloc]initWithASN1Object:o context:context];
            o = [self getObjectAtPosition:p++];
        }
        else
        {
            o = [self getObjectAtPosition:p++];
        }
	}
	return self;
}

- (NSString *) objectName
{
	return @"UpdateLocationArg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(imsi)
	{
		dict[@"imsi"] = imsi.objectValue;
	}
	if(msc_Number)
	{
		dict[@"msc-Number"] = msc_Number.objectValue;
	}
	if(vlr_Number)
	{
		dict[@"vlr-Number"] = vlr_Number.objectValue;
	}
	if(lmsi)
	{
		dict[@"lmsi"] = lmsi.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(vlr_Capability)
	{
		dict[@"vlr-Capability"] = vlr_Capability.objectValue;
	}
    if(_informPreviousNetworkEntity)
    {
        dict[@"informPreviousNetworkEntity"] = @(YES);
    }
    if(_cs_LCS_NotSupportedByUE)
    {
        dict[@"cs-LCS-NotSupportedByUE"] = @(YES);
    }
    if(_v_gmlc_address)
    {
        dict[@"v-gmlc-Address"] = _v_gmlc_address.objectValue;
    }
    if(_add_info)
    {
        dict[@"add-info"] = _add_info.objectValue;
    }
    if(_pagingArea)
    {
        dict[@"pagingArea"] = _pagingArea.objectValue;
    }
    if(_skipSubscriberDataUpdate)
    {
        dict[@"skipSubscriberDataUpdate"] = @(YES);
    }
    if(_restorationIndicator)
    {
        dict[@"restorationIndicator"] = @(YES);
    }
    if(_eplmn_List)
    {
        dict[@"eplm-List"] = _eplmn_List.objectValue;
    }
    if(_mme_DiameterAddress)
    {
        dict[@"mme-DiameterAddress "] = _mme_DiameterAddress.objectValue;
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


//
//  UMGSMMAP_CAMEL_SubscriptionInfo.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_CAMEL_SubscriptionInfo.h"

@implementation UMGSMMAP_CAMEL_SubscriptionInfo


@synthesize	operationName;
@synthesize	o_CSI;
@synthesize	o_BcsmCamelTDP_CriteriaList;
@synthesize	d_CSI;
@synthesize	t_CSI;
@synthesize	t_BCSM_CAMEL_TDP_CriteriaList;
@synthesize	vt_CSI;
@synthesize	vt_BCSM_CAMEL_TDP_CriteriaList;
@synthesize	tif_CSI;
@synthesize	tif_CSI_NotificationToCSE;
@synthesize	gprs_CSI;
@synthesize	mo_sms_CSI;
@synthesize	ss_CSI;
@synthesize	m_CSI;
@synthesize	extensionContainer;
@synthesize	specificCSIDeletedList;
@synthesize	mt_sms_CSI;
@synthesize	mt_smsCAMELTDP_CriteriaList;
@synthesize	mg_csi;
@synthesize	o_IM_CSI;
@synthesize	o_IM_BcsmCamelTDP_CriteriaList;
@synthesize	d_IM_CSI;
@synthesize	vt_IM_CSI;
@synthesize	vt_IM_BCSM_CAMEL_TDP_CriteriaList;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	asn1_tag.isConstructed=YES;
	asn1_list = [[NSMutableArray alloc]init];
	if(o_CSI)
	{
		o_CSI.asn1_tag.tagNumber = 0;
		o_CSI.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:o_CSI];
	}
	if(o_BcsmCamelTDP_CriteriaList)
	{
		o_BcsmCamelTDP_CriteriaList.asn1_tag.tagNumber = 1;
		o_BcsmCamelTDP_CriteriaList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:o_BcsmCamelTDP_CriteriaList];
	}
	if(d_CSI)
	{
		d_CSI.asn1_tag.tagNumber = 2;
		d_CSI.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:d_CSI];
	}
	if(t_CSI)
	{
		t_CSI.asn1_tag.tagNumber = 3;
		t_CSI.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:t_CSI];
	}
	if(t_BCSM_CAMEL_TDP_CriteriaList)
	{
		t_BCSM_CAMEL_TDP_CriteriaList.asn1_tag.tagNumber = 4;
		t_BCSM_CAMEL_TDP_CriteriaList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:t_BCSM_CAMEL_TDP_CriteriaList];
	}
	if(vt_CSI)
	{
		vt_CSI.asn1_tag.tagNumber = 5;
		vt_CSI.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:vt_CSI];
	}
	if(vt_BCSM_CAMEL_TDP_CriteriaList)
	{
		vt_BCSM_CAMEL_TDP_CriteriaList.asn1_tag.tagNumber = 6;
		vt_BCSM_CAMEL_TDP_CriteriaList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:vt_BCSM_CAMEL_TDP_CriteriaList];
	}
	if(tif_CSI)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 7;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(tif_CSI_NotificationToCSE)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 8;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(gprs_CSI)
	{
		gprs_CSI.asn1_tag.tagNumber = 9;
		gprs_CSI.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:gprs_CSI];
	}
	if(mo_sms_CSI)
	{
		mo_sms_CSI.asn1_tag.tagNumber = 10;
		mo_sms_CSI.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:mo_sms_CSI];
	}
	if(ss_CSI)
	{
		ss_CSI.asn1_tag.tagNumber = 11;
		ss_CSI.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ss_CSI];
	}
	if(m_CSI)
	{
		m_CSI.asn1_tag.tagNumber = 12;
		m_CSI.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:m_CSI];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 13;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
	if(specificCSIDeletedList)
	{
		specificCSIDeletedList.asn1_tag.tagNumber = 14;
		specificCSIDeletedList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:specificCSIDeletedList];
	}
	if(mt_sms_CSI)
	{
		mt_sms_CSI.asn1_tag.tagNumber = 15;
		mt_sms_CSI.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:mt_sms_CSI];
	}
	if(mt_smsCAMELTDP_CriteriaList)
	{
		mt_smsCAMELTDP_CriteriaList.asn1_tag.tagNumber = 16;
		mt_smsCAMELTDP_CriteriaList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:mt_smsCAMELTDP_CriteriaList];
	}
	if(mg_csi)
	{
		mg_csi.asn1_tag.tagNumber = 17;
		mg_csi.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:mg_csi];
	}
	if(o_IM_CSI)
	{
		o_IM_CSI.asn1_tag.tagNumber = 18;
		o_IM_CSI.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:o_IM_CSI];
	}
	if(o_IM_BcsmCamelTDP_CriteriaList)
	{
		o_IM_BcsmCamelTDP_CriteriaList.asn1_tag.tagNumber = 19;
		o_IM_BcsmCamelTDP_CriteriaList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:o_IM_BcsmCamelTDP_CriteriaList];
	}
	if(d_IM_CSI)
	{
		d_IM_CSI.asn1_tag.tagNumber = 20;
		d_IM_CSI.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:d_IM_CSI];
	}
	if(vt_IM_CSI)
	{
		vt_IM_CSI.asn1_tag.tagNumber = 21;
		vt_IM_CSI.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:vt_IM_CSI];
	}
	if(vt_IM_BCSM_CAMEL_TDP_CriteriaList)
	{
		vt_IM_BCSM_CAMEL_TDP_CriteriaList.asn1_tag.tagNumber = 22;
		vt_IM_BCSM_CAMEL_TDP_CriteriaList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:vt_IM_BCSM_CAMEL_TDP_CriteriaList];
	}
}


- (UMGSMMAP_CAMEL_SubscriptionInfo *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		o_CSI = [[UMGSMMAP_O_CSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		o_BcsmCamelTDP_CriteriaList = [[UMGSMMAP_O_BcsmCamelTDPCriteriaList alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		d_CSI = [[UMGSMMAP_D_CSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		t_CSI = [[UMGSMMAP_T_CSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		t_BCSM_CAMEL_TDP_CriteriaList = [[UMGSMMAP_T_BCSM_CAMEL_TDP_CriteriaList alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		vt_CSI = [[UMGSMMAP_T_CSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 6) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		vt_BCSM_CAMEL_TDP_CriteriaList = [[UMGSMMAP_T_BCSM_CAMEL_TDP_CriteriaList alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 7) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		tif_CSI = YES;
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 8) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		tif_CSI_NotificationToCSE = YES;
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 9) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		gprs_CSI = [[UMGSMMAP_GPRS_CSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 10) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		mo_sms_CSI = [[UMGSMMAP_SMS_CSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 11) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ss_CSI = [[UMGSMMAP_SS_CSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 12) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		m_CSI = [[UMGSMMAP_M_CSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 13) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if((o) && (o.asn1_tag.tagNumber == 14) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			specificCSIDeletedList = [[UMGSMMAP_SpecificCSI_Withdraw alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 15) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			mt_sms_CSI = [[UMGSMMAP_SMS_CSI alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 16) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			mt_smsCAMELTDP_CriteriaList = [[UMGSMMAP_MT_smsCAMELTDP_CriteriaList alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 17) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			mg_csi = [[UMGSMMAP_MG_CSI alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 18) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			o_IM_CSI = [[UMGSMMAP_O_CSI alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 19) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			o_IM_BcsmCamelTDP_CriteriaList = [[UMGSMMAP_O_BcsmCamelTDPCriteriaList alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 20) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			d_IM_CSI = [[UMGSMMAP_D_CSI alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 21) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			vt_IM_CSI = [[UMGSMMAP_T_CSI alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 22) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			vt_IM_BCSM_CAMEL_TDP_CriteriaList = [[UMGSMMAP_T_BCSM_CAMEL_TDP_CriteriaList alloc]initWithASN1Object:o context:context];
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
	return @"CAMEL-SubscriptionInfo";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(o_CSI)
	{
		dict[@"o-CSI"] = o_CSI.objectValue;
	}
	if(o_BcsmCamelTDP_CriteriaList)
	{
		dict[@"o-BcsmCamelTDP-CriteriaList"] = o_BcsmCamelTDP_CriteriaList.objectValue;
	}
	if(d_CSI)
	{
		dict[@"d-CSI"] = d_CSI.objectValue;
	}
	if(t_CSI)
	{
		dict[@"t-CSI"] = t_CSI.objectValue;
	}
	if(t_BCSM_CAMEL_TDP_CriteriaList)
	{
		dict[@"t-BCSM-CAMEL-TDP-CriteriaList"] = t_BCSM_CAMEL_TDP_CriteriaList.objectValue;
	}
	if(vt_CSI)
	{
		dict[@"vt-CSI"] = vt_CSI.objectValue;
	}
	if(vt_BCSM_CAMEL_TDP_CriteriaList)
	{
		dict[@"vt-BCSM-CAMEL-TDP-CriteriaList"] = vt_BCSM_CAMEL_TDP_CriteriaList.objectValue;
	}
	if(tif_CSI)
	{
		dict[@"tif-CSI"] = @(YES);
	}
	if(tif_CSI_NotificationToCSE)
	{
		dict[@"tif-CSI-NotificationToCSE"] = @(YES);
	}
	if(gprs_CSI)
	{
		dict[@"gprs-CSI"] = gprs_CSI.objectValue;
	}
	if(mo_sms_CSI)
	{
		dict[@"mo-sms-CSI"] = mo_sms_CSI.objectValue;
	}
	if(ss_CSI)
	{
		dict[@"ss-CSI"] = ss_CSI.objectValue;
	}
	if(m_CSI)
	{
		dict[@"m-CSI"] = m_CSI.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(specificCSIDeletedList)
	{
		dict[@"specificCSIDeletedList"] = specificCSIDeletedList.objectValue;
	}
	if(mt_sms_CSI)
	{
		dict[@"mt-sms-CSI"] = mt_sms_CSI.objectValue;
	}
	if(mt_smsCAMELTDP_CriteriaList)
	{
		dict[@"mt-smsCAMELTDP-CriteriaList"] = mt_smsCAMELTDP_CriteriaList.objectValue;
	}
	if(mg_csi)
	{
		dict[@"mg-csi"] = mg_csi.objectValue;
	}
	if(o_IM_CSI)
	{
		dict[@"o-IM-CSI"] = o_IM_CSI.objectValue;
	}
	if(o_IM_BcsmCamelTDP_CriteriaList)
	{
		dict[@"o-IM-BcsmCamelTDP-CriteriaList"] = o_IM_BcsmCamelTDP_CriteriaList.objectValue;
	}
	if(d_IM_CSI)
	{
		dict[@"d-IM-CSI"] = d_IM_CSI.objectValue;
	}
	if(vt_IM_CSI)
	{
		dict[@"vt-IM-CSI"] = vt_IM_CSI.objectValue;
	}
	if(vt_IM_BCSM_CAMEL_TDP_CriteriaList)
	{
		dict[@"vt-IM-BCSM-CAMEL-TDP-CriteriaList"] = vt_IM_BCSM_CAMEL_TDP_CriteriaList.objectValue;
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


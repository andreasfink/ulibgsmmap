//
//  UMGSMMAP_PDP_ContextInfo.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_PDP_ContextInfo.h>

@implementation UMGSMMAP_PDP_ContextInfo


@synthesize	operationName;
@synthesize	pdp_ContextIdentifier;
@synthesize	pdp_ContextActive;
@synthesize	pdp_Type;
@synthesize	pdp_Address;
@synthesize	apn_Subscribed;
@synthesize	apn_InUse;
@synthesize	nsapi;
@synthesize	transactionId;
@synthesize	teid_ForGnAndGp;
@synthesize	teid_ForIu;
@synthesize	ggsn_Address;
@synthesize	qos_Subscribed;
@synthesize	qos_Requested;
@synthesize	qos_Negotiated;
@synthesize	chargingId;
@synthesize	chargingCharacteristics;
@synthesize	rnc_Address;
@synthesize	extensionContainer;
@synthesize	qos2_Subscribed;
@synthesize	qos2_Requested;
@synthesize	qos2_Negotiated;
@synthesize	qos3_Subscribed;
@synthesize	qos3_Requested;
@synthesize	qos3_Negotiated;
@synthesize	qos4_Subscribed;
@synthesize	qos4_Requested;
@synthesize	qos4_Negotiated;
@synthesize	ext_pdp_Type;
@synthesize	ext_pdp_Address;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(pdp_ContextIdentifier)
	{
		pdp_ContextIdentifier.asn1_tag.tagNumber = 0;
		pdp_ContextIdentifier.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:pdp_ContextIdentifier];
	}
	if(pdp_ContextActive)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 1;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(pdp_Type)
	{
		pdp_Type.asn1_tag.tagNumber = 2;
		pdp_Type.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:pdp_Type];
	}
	if(pdp_Address)
	{
		pdp_Address.asn1_tag.tagNumber = 3;
		pdp_Address.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:pdp_Address];
	}
	if(apn_Subscribed)
	{
		apn_Subscribed.asn1_tag.tagNumber = 4;
		apn_Subscribed.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:apn_Subscribed];
	}
	if(apn_InUse)
	{
		apn_InUse.asn1_tag.tagNumber = 5;
		apn_InUse.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:apn_InUse];
	}
	if(nsapi)
	{
		nsapi.asn1_tag.tagNumber = 6;
		nsapi.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:nsapi];
	}
	if(transactionId)
	{
		transactionId.asn1_tag.tagNumber = 7;
		transactionId.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:transactionId];
	}
	if(teid_ForGnAndGp)
	{
		teid_ForGnAndGp.asn1_tag.tagNumber = 8;
		teid_ForGnAndGp.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:teid_ForGnAndGp];
	}
	if(teid_ForIu)
	{
		teid_ForIu.asn1_tag.tagNumber = 9;
		teid_ForIu.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:teid_ForIu];
	}
	if(ggsn_Address)
	{
		ggsn_Address.asn1_tag.tagNumber = 10;
		ggsn_Address.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ggsn_Address];
	}
	if(qos_Subscribed)
	{
		qos_Subscribed.asn1_tag.tagNumber = 11;
		qos_Subscribed.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:qos_Subscribed];
	}
	if(qos_Requested)
	{
		qos_Requested.asn1_tag.tagNumber = 12;
		qos_Requested.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:qos_Requested];
	}
	if(qos_Negotiated)
	{
		qos_Negotiated.asn1_tag.tagNumber = 13;
		qos_Negotiated.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:qos_Negotiated];
	}
	if(chargingId)
	{
		chargingId.asn1_tag.tagNumber = 14;
		chargingId.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:chargingId];
	}
	if(chargingCharacteristics)
	{
		chargingCharacteristics.asn1_tag.tagNumber = 15;
		chargingCharacteristics.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:chargingCharacteristics];
	}
	if(rnc_Address)
	{
		rnc_Address.asn1_tag.tagNumber = 16;
		rnc_Address.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:rnc_Address];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 17;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
	if(qos2_Subscribed)
	{
		qos2_Subscribed.asn1_tag.tagNumber = 18;
		qos2_Subscribed.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:qos2_Subscribed];
	}
	if(qos2_Requested)
	{
		qos2_Requested.asn1_tag.tagNumber = 19;
		qos2_Requested.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:qos2_Requested];
	}
	if(qos2_Negotiated)
	{
		qos2_Negotiated.asn1_tag.tagNumber = 20;
		qos2_Negotiated.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:qos2_Negotiated];
	}
	if(qos3_Subscribed)
	{
		qos3_Subscribed.asn1_tag.tagNumber = 21;
		qos3_Subscribed.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:qos3_Subscribed];
	}
	if(qos3_Requested)
	{
		qos3_Requested.asn1_tag.tagNumber = 22;
		qos3_Requested.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:qos3_Requested];
	}
	if(qos3_Negotiated)
	{
		qos3_Negotiated.asn1_tag.tagNumber = 23;
		qos3_Negotiated.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:qos3_Negotiated];
	}
	if(qos4_Subscribed)
	{
		qos4_Subscribed.asn1_tag.tagNumber = 25;
		qos4_Subscribed.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:qos4_Subscribed];
	}
	if(qos4_Requested)
	{
		qos4_Requested.asn1_tag.tagNumber = 26;
		qos4_Requested.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:qos4_Requested];
	}
	if(qos4_Negotiated)
	{
		qos4_Negotiated.asn1_tag.tagNumber = 27;
		qos4_Negotiated.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:qos4_Negotiated];
	}
	if(ext_pdp_Type)
	{
		ext_pdp_Type.asn1_tag.tagNumber = 28;
		ext_pdp_Type.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ext_pdp_Type];
	}
	if(ext_pdp_Address)
	{
		ext_pdp_Address.asn1_tag.tagNumber = 29;
		ext_pdp_Address.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ext_pdp_Address];
	}
}


- (UMGSMMAP_PDP_ContextInfo *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_PDP_ContextInfo"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		pdp_ContextIdentifier = [[UMGSMMAP_ContextId alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		pdp_ContextActive = YES;
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		pdp_Type = [[UMGSMMAP_PDP_Type alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		pdp_Address = [[UMGSMMAP_PDP_Address alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		apn_Subscribed = [[UMGSMMAP_APN alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		apn_InUse = [[UMGSMMAP_APN alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 6) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		nsapi = [[UMGSMMAP_NSAPI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 7) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		transactionId = [[UMGSMMAP_TransactionId alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 8) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		teid_ForGnAndGp = [[UMGSMMAP_TEID alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 9) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		teid_ForIu = [[UMGSMMAP_TEID alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 10) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ggsn_Address = [[UMGSMMAP_GSN_Address alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 11) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		qos_Subscribed = [[UMGSMMAP_Ext_QoS_Subscribed alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 12) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		qos_Requested = [[UMGSMMAP_Ext_QoS_Subscribed alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 13) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		qos_Negotiated = [[UMGSMMAP_Ext_QoS_Subscribed alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 14) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		chargingId = [[UMGSMMAP_GPRSChargingID alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 15) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		chargingCharacteristics = [[UMGSMMAP_ChargingCharacteristics alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 16) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		rnc_Address = [[UMGSMMAP_GSN_Address alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 17) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if((o) && (o.asn1_tag.tagNumber == 18) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			qos2_Subscribed = [[UMGSMMAP_Ext2_QoS_Subscribed alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 19) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			qos2_Requested = [[UMGSMMAP_Ext2_QoS_Subscribed alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 20) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			qos2_Negotiated = [[UMGSMMAP_Ext2_QoS_Subscribed alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 21) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			qos3_Subscribed = [[UMGSMMAP_Ext3_QoS_Subscribed alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 22) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			qos3_Requested = [[UMGSMMAP_Ext3_QoS_Subscribed alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 23) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			qos3_Negotiated = [[UMGSMMAP_Ext3_QoS_Subscribed alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 25) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			qos4_Subscribed = [[UMGSMMAP_Ext4_QoS_Subscribed alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 26) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			qos4_Requested = [[UMGSMMAP_Ext4_QoS_Subscribed alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 27) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			qos4_Negotiated = [[UMGSMMAP_Ext4_QoS_Subscribed alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 28) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			ext_pdp_Type = [[UMGSMMAP_Ext_PDP_Type alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 29) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			ext_pdp_Address = [[UMGSMMAP_PDP_Address alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
	}
	return self;
}

- (NSString *) objectName
{
	return @"PDP-ContextInfo";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(pdp_ContextIdentifier)
	{
		dict[@"pdp-ContextIdentifier"] = pdp_ContextIdentifier.objectValue;
	}
	if(pdp_ContextActive)
	{
		dict[@"pdp-ContextActive"] = @(YES);
	}
	if(pdp_Type)
	{
		dict[@"pdp-Type"] = pdp_Type.objectValue;
	}
	if(pdp_Address)
	{
		dict[@"pdp-Address"] = pdp_Address.objectValue;
	}
	if(apn_Subscribed)
	{
		dict[@"apn-Subscribed"] = apn_Subscribed.objectValue;
	}
	if(apn_InUse)
	{
		dict[@"apn-InUse"] = apn_InUse.objectValue;
	}
	if(nsapi)
	{
		dict[@"nsapi"] = nsapi.objectValue;
	}
	if(transactionId)
	{
		dict[@"transactionId"] = transactionId.objectValue;
	}
	if(teid_ForGnAndGp)
	{
		dict[@"teid-ForGnAndGp"] = teid_ForGnAndGp.objectValue;
	}
	if(teid_ForIu)
	{
		dict[@"teid-ForIu"] = teid_ForIu.objectValue;
	}
	if(ggsn_Address)
	{
		dict[@"ggsn-Address"] = ggsn_Address.objectValue;
	}
	if(qos_Subscribed)
	{
		dict[@"qos-Subscribed"] = qos_Subscribed.objectValue;
	}
	if(qos_Requested)
	{
		dict[@"qos-Requested"] = qos_Requested.objectValue;
	}
	if(qos_Negotiated)
	{
		dict[@"qos-Negotiated"] = qos_Negotiated.objectValue;
	}
	if(chargingId)
	{
		dict[@"chargingId"] = chargingId.objectValue;
	}
	if(chargingCharacteristics)
	{
		dict[@"chargingCharacteristics"] = chargingCharacteristics.objectValue;
	}
	if(rnc_Address)
	{
		dict[@"rnc-Address"] = rnc_Address.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(qos2_Subscribed)
	{
		dict[@"qos2-Subscribed"] = qos2_Subscribed.objectValue;
	}
	if(qos2_Requested)
	{
		dict[@"qos2-Requested"] = qos2_Requested.objectValue;
	}
	if(qos2_Negotiated)
	{
		dict[@"qos2-Negotiated"] = qos2_Negotiated.objectValue;
	}
	if(qos3_Subscribed)
	{
		dict[@"qos3-Subscribed"] = qos3_Subscribed.objectValue;
	}
	if(qos3_Requested)
	{
		dict[@"qos3-Requested"] = qos3_Requested.objectValue;
	}
	if(qos3_Negotiated)
	{
		dict[@"qos3-Negotiated"] = qos3_Negotiated.objectValue;
	}
	if(qos4_Subscribed)
	{
		dict[@"qos4-Subscribed"] = qos4_Subscribed.objectValue;
	}
	if(qos4_Requested)
	{
		dict[@"qos4-Requested"] = qos4_Requested.objectValue;
	}
	if(qos4_Negotiated)
	{
		dict[@"qos4-Negotiated"] = qos4_Negotiated.objectValue;
	}
	if(ext_pdp_Type)
	{
		dict[@"ext-pdp-Type"] = ext_pdp_Type.objectValue;
	}
	if(ext_pdp_Address)
	{
		dict[@"ext-pdp-Address"] = ext_pdp_Address.objectValue;
	}
	return dict;
}

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}


@end


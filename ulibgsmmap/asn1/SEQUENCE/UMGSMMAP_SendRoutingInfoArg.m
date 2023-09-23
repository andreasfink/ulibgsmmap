//
//  UMGSMMAP_SendRoutingInfoArg.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_SendRoutingInfoArg.h>

@implementation UMGSMMAP_SendRoutingInfoArg


@synthesize	operationName;
@synthesize	msisdn;
@synthesize	cug_CheckInfo;
@synthesize	numberOfForwarding;
@synthesize	interrogationType;
@synthesize	or_Interrogation;
@synthesize	or_Capability;
@synthesize	gmsc_Address;
@synthesize	callReferenceNumber;
@synthesize	forwardingReason;
@synthesize	basicServiceGroup;
@synthesize	networkSignalInfo;
@synthesize	camelInfo;
@synthesize	suppressionOfAnnouncement;
@synthesize	extensionContainer;
@synthesize	alertingPattern;
@synthesize	ccbs_Call;
@synthesize	supportedCCBS_Phase;
@synthesize	additionalSignalInfo;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(msisdn)
	{
		msisdn.asn1_tag.tagNumber = 0;
		msisdn.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:msisdn];
	}
	if(cug_CheckInfo)
	{
		cug_CheckInfo.asn1_tag.tagNumber = 1;
		cug_CheckInfo.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:cug_CheckInfo];
	}
	if(numberOfForwarding)
	{
		numberOfForwarding.asn1_tag.tagNumber = 2;
		numberOfForwarding.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:numberOfForwarding];
	}
	if(interrogationType)
	{
		interrogationType.asn1_tag.tagNumber = 3;
		interrogationType.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:interrogationType];
	}
	if(or_Interrogation)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 4;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(or_Capability)
	{
		or_Capability.asn1_tag.tagNumber = 5;
		or_Capability.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:or_Capability];
	}
	if(gmsc_Address)
	{
		gmsc_Address.asn1_tag.tagNumber = 6;
		gmsc_Address.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:gmsc_Address];
	}
	if(callReferenceNumber)
	{
		callReferenceNumber.asn1_tag.tagNumber = 7;
		callReferenceNumber.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:callReferenceNumber];
	}
	if(forwardingReason)
	{
		forwardingReason.asn1_tag.tagNumber = 8;
		forwardingReason.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:forwardingReason];
	}
	if(basicServiceGroup)
	{
		basicServiceGroup.asn1_tag.tagNumber = 9;
		basicServiceGroup.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:basicServiceGroup];
	}
	if(networkSignalInfo)
	{
		networkSignalInfo.asn1_tag.tagNumber = 10;
		networkSignalInfo.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:networkSignalInfo];
	}
	if(camelInfo)
	{
		camelInfo.asn1_tag.tagNumber = 11;
		camelInfo.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:camelInfo];
	}
	if(suppressionOfAnnouncement)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 12;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(extensionContainer)
	{
		[asn1_list addObject:extensionContainer];
	}
	if(alertingPattern)
	{
		alertingPattern.asn1_tag.tagNumber = 14;
		alertingPattern.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:alertingPattern];
	}
	if(ccbs_Call)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 15;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(supportedCCBS_Phase)
	{
		supportedCCBS_Phase.asn1_tag.tagNumber = 16;
		supportedCCBS_Phase.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:supportedCCBS_Phase];
	}
	if(additionalSignalInfo)
	{
		additionalSignalInfo.asn1_tag.tagNumber = 17;
		additionalSignalInfo.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:additionalSignalInfo];
	}
}


- (UMGSMMAP_SendRoutingInfoArg *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_SendRoutingInfoArg"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		msisdn = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		cug_CheckInfo = [[UMGSMMAP_CUG_CheckInfo alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		numberOfForwarding = [[UMGSMMAP_NumberOfForwarding alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		interrogationType = [[UMGSMMAP_InterrogationType alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		or_Interrogation = YES;
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		or_Capability = [[UMGSMMAP_OR_Phase alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 6) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		gmsc_Address = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 7) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		callReferenceNumber = [[UMGSMMAP_CallReferenceNumber alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 8) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		forwardingReason = [[UMGSMMAP_ForwardingReason alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 9) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		basicServiceGroup = [[UMGSMMAP_Ext_BasicServiceCode alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 10) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		networkSignalInfo = [[UMGSMMAP_ExternalSignalInfo alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 11) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		camelInfo = [[UMGSMMAP_CamelInfo alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 12) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		suppressionOfAnnouncement = YES;
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if((o) && (o.asn1_tag.tagNumber == 14) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			alertingPattern = [[UMGSMMAP_AlertingPattern alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 15) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			ccbs_Call = YES;
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 16) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			supportedCCBS_Phase = [[UMGSMMAP_SupportedCCBS_Phase alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 17) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			additionalSignalInfo = [[UMGSMMAP_Ext_ExternalSignalInfo alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
	}
	return self;
}

- (NSString *) objectName
{
	return @"SendRoutingInfoArg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(msisdn)
	{
		dict[@"msisdn"] = msisdn.objectValue;
	}
	if(cug_CheckInfo)
	{
		dict[@"cug-CheckInfo"] = cug_CheckInfo.objectValue;
	}
	if(numberOfForwarding)
	{
		dict[@"numberOfForwarding"] = numberOfForwarding.objectValue;
	}
	if(interrogationType)
	{
		dict[@"interrogationType"] = interrogationType.objectValue;
	}
	if(or_Interrogation)
	{
		dict[@"or-Interrogation"] = @(YES);
	}
	if(or_Capability)
	{
		dict[@"or-Capability"] = or_Capability.objectValue;
	}
	if(gmsc_Address)
	{
		dict[@"gmsc-Address"] = gmsc_Address.objectValue;
	}
	if(callReferenceNumber)
	{
		dict[@"callReferenceNumber"] = callReferenceNumber.objectValue;
	}
	if(forwardingReason)
	{
		dict[@"forwardingReason"] = forwardingReason.objectValue;
	}
	if(basicServiceGroup)
	{
		dict[@"basicServiceGroup"] = basicServiceGroup.objectValue;
	}
	if(networkSignalInfo)
	{
		dict[@"networkSignalInfo"] = networkSignalInfo.objectValue;
	}
	if(camelInfo)
	{
		dict[@"camelInfo"] = camelInfo.objectValue;
	}
	if(suppressionOfAnnouncement)
	{
		dict[@"suppressionOfAnnouncement"] = @(YES);
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(alertingPattern)
	{
		dict[@"alertingPattern"] = alertingPattern.objectValue;
	}
	if(ccbs_Call)
	{
		dict[@"ccbs-Call"] = @(YES);
	}
	if(supportedCCBS_Phase)
	{
		dict[@"supportedCCBS-Phase"] = supportedCCBS_Phase.objectValue;
	}
	if(additionalSignalInfo)
	{
		dict[@"additionalSignalInfo"] = additionalSignalInfo.objectValue;
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


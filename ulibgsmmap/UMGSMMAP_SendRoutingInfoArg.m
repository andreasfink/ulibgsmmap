//
//  UMGSMMAP_SendRoutingInfoArg.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_SendRoutingInfoArg.h"

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
@synthesize	istSupportIndicator;
@synthesize	pre_pagingSupported;
@synthesize	callDiversionTreatmentIndicator;
@synthesize	longFTN_Supported;
@synthesize	suppress_VT_CSI;
@synthesize	suppressIncomingCallBarring;
@synthesize	gsmSCF_InitiatedCall;
@synthesize	basicServiceGroup2;
@synthesize	networkSignalInfo2;
@synthesize	suppressMTSS;
@synthesize	mtRoamingRetrySupported;
@synthesize	callPriority;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	asn1_tag.isConstructed=YES;
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
	if(istSupportIndicator)
	{
		istSupportIndicator.asn1_tag.tagNumber = 18;
		istSupportIndicator.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:istSupportIndicator];
	}
	if(pre_pagingSupported)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 19;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(callDiversionTreatmentIndicator)
	{
		callDiversionTreatmentIndicator.asn1_tag.tagNumber = 20;
		callDiversionTreatmentIndicator.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:callDiversionTreatmentIndicator];
	}
	if(longFTN_Supported)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 21;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(suppress_VT_CSI)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 22;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(suppressIncomingCallBarring)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 23;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(gsmSCF_InitiatedCall)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 24;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(basicServiceGroup2)
	{
		basicServiceGroup2.asn1_tag.tagNumber = 25;
		basicServiceGroup2.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:basicServiceGroup2];
	}
	if(networkSignalInfo2)
	{
		networkSignalInfo2.asn1_tag.tagNumber = 26;
		networkSignalInfo2.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:networkSignalInfo2];
	}
	if(suppressMTSS)
	{
		suppressMTSS.asn1_tag.tagNumber = 27;
		suppressMTSS.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:suppressMTSS];
	}
	if(mtRoamingRetrySupported)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 28;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(callPriority)
	{
		callPriority.asn1_tag.tagNumber = 29;
		callPriority.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:callPriority];
	}
}


- (UMGSMMAP_SendRoutingInfoArg *) processAfterDecodeWithContext:(id)context
{
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
	if((o) && ([UMGSMMAP_ExtensionContainer tagMatches:o.asn1_tag.tagNumber]) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
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
		else if((o) && (o.asn1_tag.tagNumber == 18) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			istSupportIndicator = [[UMGSMMAP_IST_SupportIndicator alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 19) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			pre_pagingSupported = YES;
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 20) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			callDiversionTreatmentIndicator = [[UMGSMMAP_CallDiversionTreatmentIndicator alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 21) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			longFTN_Supported = YES;
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 22) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			suppress_VT_CSI = YES;
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 23) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			suppressIncomingCallBarring = YES;
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 24) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			gsmSCF_InitiatedCall = YES;
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 25) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			basicServiceGroup2 = [[UMGSMMAP_Ext_BasicServiceCode alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 26) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			networkSignalInfo2 = [[UMGSMMAP_ExternalSignalInfo alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 27) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			suppressMTSS = [[UMGSMMAP_SuppressMTSS alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 28) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			mtRoamingRetrySupported = YES;
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 29) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			callPriority = [[UMGSMMAP_EMLPP_Priority alloc]initWithASN1Object:o context:context];
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
	if(istSupportIndicator)
	{
		dict[@"istSupportIndicator"] = istSupportIndicator.objectValue;
	}
	if(pre_pagingSupported)
	{
		dict[@"pre-pagingSupported"] = @(YES);
	}
	if(callDiversionTreatmentIndicator)
	{
		dict[@"callDiversionTreatmentIndicator"] = callDiversionTreatmentIndicator.objectValue;
	}
	if(longFTN_Supported)
	{
		dict[@"longFTN-Supported"] = @(YES);
	}
	if(suppress_VT_CSI)
	{
		dict[@"suppress-VT-CSI"] = @(YES);
	}
	if(suppressIncomingCallBarring)
	{
		dict[@"suppressIncomingCallBarring"] = @(YES);
	}
	if(gsmSCF_InitiatedCall)
	{
		dict[@"gsmSCF-InitiatedCall"] = @(YES);
	}
	if(basicServiceGroup2)
	{
		dict[@"basicServiceGroup2"] = basicServiceGroup2.objectValue;
	}
	if(networkSignalInfo2)
	{
		dict[@"networkSignalInfo2"] = networkSignalInfo2.objectValue;
	}
	if(suppressMTSS)
	{
		dict[@"suppressMTSS"] = suppressMTSS.objectValue;
	}
	if(mtRoamingRetrySupported)
	{
		dict[@"mtRoamingRetrySupported"] = @(YES);
	}
	if(callPriority)
	{
		dict[@"callPriority"] = callPriority.objectValue;
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


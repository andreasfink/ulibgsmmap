//
//  UMGSMMAP_ProvideRoamingNumberArg.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_ProvideRoamingNumberArg.h"

@implementation UMGSMMAP_ProvideRoamingNumberArg


@synthesize	operationName;
@synthesize	imsi;
@synthesize	msc_Number;
@synthesize	msisdn;
@synthesize	lmsi;
@synthesize	gsm_BearerCapability;
@synthesize	networkSignalInfo;
@synthesize	suppressionOfAnnouncement;
@synthesize	gmsc_Address;
@synthesize	callReferenceNumber;
@synthesize	or_Interrogation;
@synthesize	extensionContainer;
@synthesize	alertingPattern;
@synthesize	ccbs_Call;
@synthesize	supportedCamelPhasesInGMSC;
@synthesize	additionalSignalInfo;
@synthesize	orNotSupportedInGMSC;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(imsi)
	{
		imsi.asn1_tag.tagNumber = 0;
		imsi.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:imsi];
	}
	if(msc_Number)
	{
		msc_Number.asn1_tag.tagNumber = 1;
		msc_Number.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:msc_Number];
	}
	if(msisdn)
	{
		msisdn.asn1_tag.tagNumber = 2;
		msisdn.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:msisdn];
	}
	if(lmsi)
	{
		lmsi.asn1_tag.tagNumber = 4;
		lmsi.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:lmsi];
	}
	if(gsm_BearerCapability)
	{
		gsm_BearerCapability.asn1_tag.tagNumber = 5;
		gsm_BearerCapability.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:gsm_BearerCapability];
	}
	if(networkSignalInfo)
	{
		networkSignalInfo.asn1_tag.tagNumber = 6;
		networkSignalInfo.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:networkSignalInfo];
	}
	if(suppressionOfAnnouncement)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 7;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(gmsc_Address)
	{
		gmsc_Address.asn1_tag.tagNumber = 8;
		gmsc_Address.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:gmsc_Address];
	}
	if(callReferenceNumber)
	{
		callReferenceNumber.asn1_tag.tagNumber = 9;
		callReferenceNumber.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:callReferenceNumber];
	}
	if(or_Interrogation)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 10;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 11;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
	if(alertingPattern)
	{
		alertingPattern.asn1_tag.tagNumber = 12;
		alertingPattern.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:alertingPattern];
	}
	if(ccbs_Call)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 13;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(supportedCamelPhasesInGMSC)
	{
		supportedCamelPhasesInGMSC.asn1_tag.tagNumber = 15;
		supportedCamelPhasesInGMSC.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:supportedCamelPhasesInGMSC];
	}
	if(additionalSignalInfo)
	{
		additionalSignalInfo.asn1_tag.tagNumber = 14;
		additionalSignalInfo.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:additionalSignalInfo];
	}
	if(orNotSupportedInGMSC)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 16;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
}


- (UMGSMMAP_ProvideRoamingNumberArg *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		imsi = [[UMASN1OctetString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		msc_Number = [[UMASN1OctetString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		msisdn = [[UMASN1OctetString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		lmsi = [[UMASN1OctetString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		gsm_BearerCapability = [[UMGSMMAP_ExternalSignalInfo alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 6) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		networkSignalInfo = [[UMGSMMAP_ExternalSignalInfo alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 7) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		suppressionOfAnnouncement = YES;
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 8) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		gmsc_Address = [[UMASN1OctetString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 9) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		callReferenceNumber = [[UMASN1OctetString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 10) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		or_Interrogation = YES;
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 11) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if((o) && (o.asn1_tag.tagNumber == 12) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			alertingPattern = [[UMASN1OctetString alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 13) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			ccbs_Call = YES;
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 15) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			supportedCamelPhasesInGMSC = [[UMGSMMAP_SupportedCamelPhases alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 14) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			additionalSignalInfo = [[UMGSMMAP_Ext_ExternalSignalInfo alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 16) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			orNotSupportedInGMSC = YES;
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
	return @"ProvideRoamingNumberArg";
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
	if(msisdn)
	{
		dict[@"msisdn"] = msisdn.objectValue;
	}
	if(lmsi)
	{
		dict[@"lmsi"] = lmsi.objectValue;
	}
	if(gsm_BearerCapability)
	{
		dict[@"gsm-BearerCapability"] = gsm_BearerCapability.objectValue;
	}
	if(networkSignalInfo)
	{
		dict[@"networkSignalInfo"] = networkSignalInfo.objectValue;
	}
	if(suppressionOfAnnouncement)
	{
		dict[@"suppressionOfAnnouncement"] = @(YES);
	}
	if(gmsc_Address)
	{
		dict[@"gmsc-Address"] = gmsc_Address.objectValue;
	}
	if(callReferenceNumber)
	{
		dict[@"callReferenceNumber"] = callReferenceNumber.objectValue;
	}
	if(or_Interrogation)
	{
		dict[@"or-Interrogation"] = @(YES);
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
	if(supportedCamelPhasesInGMSC)
	{
		dict[@"supportedCamelPhasesInGMSC"] = supportedCamelPhasesInGMSC.objectValue;
	}
	if(additionalSignalInfo)
	{
		dict[@"additionalSignalInfo"] = additionalSignalInfo.objectValue;
	}
	if(orNotSupportedInGMSC)
	{
		dict[@"orNotSupportedInGMSC"] = @(YES);
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


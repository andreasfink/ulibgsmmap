//
//  UMGSMMAP_SubscriberInfo.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_SubscriberInfo.h>

@implementation UMGSMMAP_SubscriberInfo


@synthesize	operationName;
@synthesize	locationInformation;
@synthesize	subscriberState;
@synthesize	extensionContainer;
@synthesize	locationInformationGPRS;
@synthesize	ps_SubscriberState;
@synthesize	imei;
@synthesize	ms_Classmark2;
@synthesize	gprs_MS_Class;
@synthesize	mnpInfoRes;
@synthesize	imsVoiceOverPS_SessionsIndication;
@synthesize	lastUE_ActivityTime;
@synthesize	lastRAT_Type;
@synthesize	eps_SubscriberState;
@synthesize	locationInformationEPS;
@synthesize	timeZone;
@synthesize	daylightSavingTime;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(locationInformation)
	{
		locationInformation.asn1_tag.tagNumber = 0;
		locationInformation.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:locationInformation];
	}
	if(subscriberState)
	{
		subscriberState.asn1_tag.tagNumber = 1;
		subscriberState.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:subscriberState];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 2;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:extensionContainer];
	}
	if(locationInformationGPRS)
	{
		locationInformationGPRS.asn1_tag.tagNumber = 3;
		locationInformationGPRS.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:locationInformationGPRS];
	}
	if(ps_SubscriberState)
	{
		ps_SubscriberState.asn1_tag.tagNumber = 4;
		ps_SubscriberState.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:ps_SubscriberState];
	}
	if(imei)
	{
		imei.asn1_tag.tagNumber = 5;
		imei.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:imei];
	}
	if(ms_Classmark2)
	{
		ms_Classmark2.asn1_tag.tagNumber = 6;
		ms_Classmark2.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:ms_Classmark2];
	}
	if(gprs_MS_Class)
	{
		gprs_MS_Class.asn1_tag.tagNumber = 7;
		gprs_MS_Class.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:gprs_MS_Class];
	}
	if(mnpInfoRes)
	{
		mnpInfoRes.asn1_tag.tagNumber = 8;
		mnpInfoRes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:mnpInfoRes];
	}
	if(imsVoiceOverPS_SessionsIndication)
	{
		imsVoiceOverPS_SessionsIndication.asn1_tag.tagNumber = 9;
		imsVoiceOverPS_SessionsIndication.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:imsVoiceOverPS_SessionsIndication];
	}
	if(lastUE_ActivityTime)
	{
		lastUE_ActivityTime.asn1_tag.tagNumber = 10;
		lastUE_ActivityTime.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:lastUE_ActivityTime];
	}
	if(lastRAT_Type)
	{
		lastRAT_Type.asn1_tag.tagNumber = 11;
		lastRAT_Type.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:lastRAT_Type];
	}
	if(eps_SubscriberState)
	{
		eps_SubscriberState.asn1_tag.tagNumber = 12;
		eps_SubscriberState.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:eps_SubscriberState];
	}
	if(locationInformationEPS)
	{
		locationInformationEPS.asn1_tag.tagNumber = 13;
		locationInformationEPS.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:locationInformationEPS];
	}
	if(timeZone)
	{
		timeZone.asn1_tag.tagNumber = 14;
		timeZone.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:timeZone];
	}
	if(daylightSavingTime)
	{
		daylightSavingTime.asn1_tag.tagNumber = 15;
		daylightSavingTime.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:daylightSavingTime];
	}
}


- (UMGSMMAP_SubscriberInfo *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		locationInformation = [[UMGSMMAP_LocationInformation alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		subscriberState = [[UMGSMMAP_SubscriberState alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			locationInformationGPRS = [[UMGSMMAP_LocationInformationGPRS alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			ps_SubscriberState = [[UMGSMMAP_PS_SubscriberState alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			imei = [[UMGSMMAP_IMEI alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 6) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			ms_Classmark2 = [[UMGSMMAP_MS_Classmark2 alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 7) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			gprs_MS_Class = [[UMGSMMAP_GPRSMSClass alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 8) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			mnpInfoRes = [[UMGSMMAP_MNPInfoRes alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 9) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			imsVoiceOverPS_SessionsIndication = [[UMGSMMAP_IMS_VoiceOverPS_SessionsInd alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 10) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			lastUE_ActivityTime = [[UMGSMMAP_ASNTime alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 11) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			lastRAT_Type = [[UMGSMMAP_Used_RAT_Type alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 12) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			eps_SubscriberState = [[UMGSMMAP_PS_SubscriberState alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 13) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			locationInformationEPS = [[UMGSMMAP_LocationInformationEPS alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 14) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			timeZone = [[UMGSMMAP_ASNTimeZone alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 15) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			daylightSavingTime = [[UMGSMMAP_DaylightSavingTime alloc]initWithASN1Object:o context:context];
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
	return @"SubscriberInfo";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(locationInformation)
	{
		dict[@"locationInformation"] = locationInformation.objectValue;
	}
	if(subscriberState)
	{
		dict[@"subscriberState"] = subscriberState.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(locationInformationGPRS)
	{
		dict[@"locationInformationGPRS"] = locationInformationGPRS.objectValue;
	}
	if(ps_SubscriberState)
	{
		dict[@"ps-SubscriberState"] = ps_SubscriberState.objectValue;
	}
	if(imei)
	{
		dict[@"imei"] = imei.objectValue;
	}
	if(ms_Classmark2)
	{
		dict[@"ms-Classmark2"] = ms_Classmark2.objectValue;
	}
	if(gprs_MS_Class)
	{
		dict[@"gprs-MS-Class"] = gprs_MS_Class.objectValue;
	}
	if(mnpInfoRes)
	{
		dict[@"mnpInfoRes"] = mnpInfoRes.objectValue;
	}
	if(imsVoiceOverPS_SessionsIndication)
	{
		dict[@"imsVoiceOverPS-SessionsIndication"] = imsVoiceOverPS_SessionsIndication.objectValue;
	}
	if(lastUE_ActivityTime)
	{
		dict[@"lastUE-ActivityTime"] = lastUE_ActivityTime.objectValue;
	}
	if(lastRAT_Type)
	{
		dict[@"lastRAT-Type"] = lastRAT_Type.objectValue;
	}
	if(eps_SubscriberState)
	{
		dict[@"eps-SubscriberState"] = eps_SubscriberState.objectValue;
	}
	if(locationInformationEPS)
	{
		dict[@"locationInformationEPS"] = locationInformationEPS.objectValue;
	}
	if(timeZone)
	{
		dict[@"timeZone"] = timeZone.objectValue;
	}
	if(daylightSavingTime)
	{
		dict[@"daylightSavingTime"] = daylightSavingTime.objectValue;
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


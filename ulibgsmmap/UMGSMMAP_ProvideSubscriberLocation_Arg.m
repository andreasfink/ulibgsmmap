//
//  UMGSMMAP_ProvideSubscriberLocation_Arg.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_ProvideSubscriberLocation_Arg.h"

@implementation UMGSMMAP_ProvideSubscriberLocation_Arg


@synthesize	operationName;
@synthesize	locationType;
@synthesize	mlc_Number;
@synthesize	lcs_ClientID;
@synthesize	privacyOverride;
@synthesize	imsi;
@synthesize	msisdn;
@synthesize	lmsi;
@synthesize	imei;
@synthesize	lcs_Priority;
@synthesize	lcs_QoS;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(locationType)
	{
		[_asn1_list addObject:locationType];
	}
	if(mlc_Number)
	{
		[_asn1_list addObject:mlc_Number];
	}
	if(lcs_ClientID)
	{
		lcs_ClientID.asn1_tag.tagNumber = 0;
		lcs_ClientID.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:lcs_ClientID];
	}
	if(privacyOverride)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 1;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:n];
	}
	if(imsi)
	{
		imsi.asn1_tag.tagNumber = 2;
		imsi.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:imsi];
	}
	if(msisdn)
	{
		msisdn.asn1_tag.tagNumber = 3;
		msisdn.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:msisdn];
	}
	if(lmsi)
	{
		lmsi.asn1_tag.tagNumber = 4;
		lmsi.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:lmsi];
	}
	if(imei)
	{
		imei.asn1_tag.tagNumber = 5;
		imei.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:imei];
	}
	if(lcs_Priority)
	{
		lcs_Priority.asn1_tag.tagNumber = 6;
		lcs_Priority.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:lcs_Priority];
	}
	if(lcs_QoS)
	{
		lcs_QoS.asn1_tag.tagNumber = 7;
		lcs_QoS.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:lcs_QoS];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 8;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_ProvideSubscriberLocation_Arg *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		locationType = [[UMGSMMAP_LocationType alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		mlc_Number = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		lcs_ClientID = [[UMGSMMAP_LCS_ClientID alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		privacyOverride = YES;
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		imsi = [[UMGSMMAP_IMSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		msisdn = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		lmsi = [[UMGSMMAP_LMSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		imei = [[UMGSMMAP_IMEI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 6) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		lcs_Priority = [[UMGSMMAP_LCS_Priority alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 7) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		lcs_QoS = [[UMGSMMAP_LCS_QoS alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 8) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
        /* ... */
        o = [self getObjectAtPosition:p++];
    }
	return self;
}

- (NSString *) objectName
{
	return @"ProvideSubscriberLocation-Arg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(locationType)
	{
		dict[@"locationType"] = locationType.objectValue;
	}
	if(mlc_Number)
	{
		dict[@"mlc-Number"] = mlc_Number.objectValue;
	}
	if(lcs_ClientID)
	{
		dict[@"lcs-ClientID"] = lcs_ClientID.objectValue;
	}
	if(privacyOverride)
	{
		dict[@"privacyOverride"] = @(YES);
	}
	if(imsi)
	{
		dict[@"imsi"] = imsi.objectValue;
	}
	if(msisdn)
	{
		dict[@"msisdn"] = msisdn.objectValue;
	}
	if(lmsi)
	{
		dict[@"lmsi"] = lmsi.objectValue;
	}
	if(imei)
	{
		dict[@"imei"] = imei.objectValue;
	}
	if(lcs_Priority)
	{
		dict[@"lcs-Priority"] = lcs_Priority.objectValue;
	}
	if(lcs_QoS)
	{
		dict[@"lcs-QoS"] = lcs_QoS.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
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


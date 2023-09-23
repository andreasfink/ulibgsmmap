//
//  UMGSMMAP_GPRS_CSI.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_GPRS_CSI.h>

@implementation UMGSMMAP_GPRS_CSI


@synthesize	operationName;
@synthesize	gprs_CamelTDPDataList;
@synthesize	camelCapabilityHandling;
@synthesize	extensionContainer;
@synthesize	notificationToCSE;
@synthesize	csi_Active;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	_asn1_tag.isConstructed=YES;
	_asn1_list = [[NSMutableArray alloc]init];
	if(gprs_CamelTDPDataList)
	{
		gprs_CamelTDPDataList.asn1_tag.tagNumber = 0;
		gprs_CamelTDPDataList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:gprs_CamelTDPDataList];
	}
	if(camelCapabilityHandling)
	{
		camelCapabilityHandling.asn1_tag.tagNumber = 1;
		camelCapabilityHandling.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:camelCapabilityHandling];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 2;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:extensionContainer];
	}
	if(notificationToCSE)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 3;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:n];
	}
	if(csi_Active)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 3;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:n];
	}
}


- (UMGSMMAP_GPRS_CSI *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		gprs_CamelTDPDataList = [[UMGSMMAP_GPRS_CamelTDPDataList alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		camelCapabilityHandling = [[UMGSMMAP_CamelCapabilityHandling alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		notificationToCSE = YES;
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		csi_Active = YES;
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
	return @"GPRS-CSI";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(gprs_CamelTDPDataList)
	{
		dict[@"gprs-CamelTDPDataList"] = gprs_CamelTDPDataList.objectValue;
	}
	if(camelCapabilityHandling)
	{
		dict[@"camelCapabilityHandling"] = camelCapabilityHandling.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(notificationToCSE)
	{
		dict[@"notificationToCSE"] = @(YES);
	}
	if(csi_Active)
	{
		dict[@"csi-Active"] = @(YES);
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


//
//  UMGSMMAP_MG_CSI.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_MG_CSI.h>

@implementation UMGSMMAP_MG_CSI


@synthesize	operationName;
@synthesize	mobilityTriggers;
@synthesize	serviceKey;
@synthesize	gsmSCF_Address;
@synthesize	extensionContainer;
@synthesize	notificationToCSE;
@synthesize	csi_Active;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	_asn1_tag.isConstructed=YES;
	_asn1_list = [[NSMutableArray alloc]init];
	if(mobilityTriggers)
	{
		[_asn1_list addObject:mobilityTriggers];
	}
	if(serviceKey)
	{
		[_asn1_list addObject:serviceKey];
	}
	if(gsmSCF_Address)
	{
		gsmSCF_Address.asn1_tag.tagNumber = 0;
		gsmSCF_Address.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:gsmSCF_Address];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 1;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:extensionContainer];
	}
	if(notificationToCSE)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 2;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:n];
	}
	if(csi_Active)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 4;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:n];
	}
}


- (UMGSMMAP_MG_CSI *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && ([UMGSMMAP_MobilityTriggers tagMatches:o.asn1_tag.tagNumber]) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
	{
		mobilityTriggers = [[UMGSMMAP_MobilityTriggers alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && ([UMGSMMAP_ServiceKey tagMatches:o.asn1_tag.tagNumber]) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
	{
		serviceKey = [[UMGSMMAP_ServiceKey alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		gsmSCF_Address = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		notificationToCSE = YES;
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
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
	return @"MG-CSI";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(mobilityTriggers)
	{
		dict[@"mobilityTriggers"] = mobilityTriggers.objectValue;
	}
	if(serviceKey)
	{
		dict[@"serviceKey"] = serviceKey.objectValue;
	}
	if(gsmSCF_Address)
	{
		dict[@"gsmSCF-Address"] = gsmSCF_Address.objectValue;
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


//
//  UMGSMMAP_Ss_InvocationNotificationArg.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_Ss_InvocationNotificationArg.h"

@implementation UMGSMMAP_Ss_InvocationNotificationArg


@synthesize	operationName;
@synthesize	imsi;
@synthesize	msisdn;
@synthesize	ss_Event;
@synthesize	ss_EventSpecification;
@synthesize	extensionContainer;


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
	if(msisdn)
	{
		msisdn.asn1_tag.tagNumber = 1;
		msisdn.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:msisdn];
	}
	if(ss_Event)
	{
		ss_Event.asn1_tag.tagNumber = 2;
		ss_Event.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ss_Event];
	}
	if(ss_EventSpecification)
	{
		ss_EventSpecification.asn1_tag.tagNumber = 3;
		ss_EventSpecification.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ss_EventSpecification];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 4;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_Ss_InvocationNotificationArg *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		imsi = [[UMGSMMAP_IMSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		msisdn = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ss_Event = [[UMGSMMAP_SS_Code alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ss_EventSpecification = [[UMGSMMAP_SS_EventSpecification alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
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
	return @"Ss-InvocationNotificationArg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(imsi)
	{
		dict[@"imsi"] = imsi.objectValue;
	}
	if(msisdn)
	{
		dict[@"msisdn"] = msisdn.objectValue;
	}
	if(ss_Event)
	{
		dict[@"ss-Event"] = ss_Event.objectValue;
	}
	if(ss_EventSpecification)
	{
		dict[@"ss-EventSpecification"] = ss_EventSpecification.objectValue;
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


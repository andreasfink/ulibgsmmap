//
//  UMGSMMAP_AnyTimeInterrogationArg.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_AnyTimeInterrogationArg.h"

@implementation UMGSMMAP_AnyTimeInterrogationArg


@synthesize	operationName;
@synthesize	subscriberIdentity;
@synthesize	requestedInfo;
@synthesize	gsmSCF_Address;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(subscriberIdentity)
	{
		subscriberIdentity.asn1_tag.tagNumber = 0;
		subscriberIdentity.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:subscriberIdentity];
	}
	if(requestedInfo)
	{
		requestedInfo.asn1_tag.tagNumber = 1;
		requestedInfo.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:requestedInfo];
	}
	if(gsmSCF_Address)
	{
		gsmSCF_Address.asn1_tag.tagNumber = 3;
		gsmSCF_Address.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:gsmSCF_Address];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 2;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_AnyTimeInterrogationArg *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		subscriberIdentity = [[UMGSMMAP_SubscriberIdentity alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		requestedInfo = [[UMGSMMAP_RequestedInfo alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		gsmSCF_Address = [[UMASN1OctetString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
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
	return @"AnyTimeInterrogationArg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(subscriberIdentity)
	{
		dict[@"subscriberIdentity"] = subscriberIdentity.objectValue;
	}
	if(requestedInfo)
	{
		dict[@"requestedInfo"] = requestedInfo.objectValue;
	}
	if(gsmSCF_Address)
	{
		dict[@"gsmSCF-Address"] = gsmSCF_Address.objectValue;
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


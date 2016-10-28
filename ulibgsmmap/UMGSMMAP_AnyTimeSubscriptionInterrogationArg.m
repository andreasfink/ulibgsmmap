//
//  UMGSMMAP_AnyTimeSubscriptionInterrogationArg.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_AnyTimeSubscriptionInterrogationArg.h"

@implementation UMGSMMAP_AnyTimeSubscriptionInterrogationArg


@synthesize	operationName;
@synthesize	subscriberIdentity;
@synthesize	requestedSubscriptionInfo;
@synthesize	gsmSCF_Address;
@synthesize	extensionContainer;
@synthesize	longFTN_Supported;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	asn1_tag.isConstructed=YES;
	asn1_list = [[NSMutableArray alloc]init];
	if(subscriberIdentity)
	{
		subscriberIdentity.asn1_tag.tagNumber = 0;
		subscriberIdentity.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:subscriberIdentity];
	}
	if(requestedSubscriptionInfo)
	{
		requestedSubscriptionInfo.asn1_tag.tagNumber = 1;
		requestedSubscriptionInfo.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:requestedSubscriptionInfo];
	}
	if(gsmSCF_Address)
	{
		gsmSCF_Address.asn1_tag.tagNumber = 2;
		gsmSCF_Address.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:gsmSCF_Address];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 3;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
	if(longFTN_Supported)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 4;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
}


- (UMGSMMAP_AnyTimeSubscriptionInterrogationArg *) processAfterDecodeWithContext:(id)context
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
		requestedSubscriptionInfo = [[UMGSMMAP_RequestedSubscriptionInfo alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		gsmSCF_Address = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		longFTN_Supported = YES;
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
	return @"AnyTimeSubscriptionInterrogationArg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(subscriberIdentity)
	{
		dict[@"subscriberIdentity"] = subscriberIdentity.objectValue;
	}
	if(requestedSubscriptionInfo)
	{
		dict[@"requestedSubscriptionInfo"] = requestedSubscriptionInfo.objectValue;
	}
	if(gsmSCF_Address)
	{
		dict[@"gsmSCF-Address"] = gsmSCF_Address.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(longFTN_Supported)
	{
		dict[@"longFTN-Supported"] = @(YES);
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


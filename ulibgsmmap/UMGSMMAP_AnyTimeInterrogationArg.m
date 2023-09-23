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
#import <ulibgsmmap/UMGSMMAP_AnyTimeInterrogationArg.h>

@implementation UMGSMMAP_AnyTimeInterrogationArg


@synthesize	operationName;
@synthesize	_subscriberIdentity;
@synthesize	_requestedInfo;
@synthesize	_gsmSCF_Address;
@synthesize	_extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(_subscriberIdentity)
	{
		_subscriberIdentity.asn1_tag.tagNumber = 0;
		_subscriberIdentity.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:_subscriberIdentity];
	}
	if(_requestedInfo)
	{
		_requestedInfo.asn1_tag.tagNumber = 1;
		_requestedInfo.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:_requestedInfo];
	}
	if(_gsmSCF_Address)
	{
		_gsmSCF_Address.asn1_tag.tagNumber = 3;
		_gsmSCF_Address.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:_gsmSCF_Address];
	}
	if(_extensionContainer)
	{
		_extensionContainer.asn1_tag.tagNumber = 2;
		_extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:_extensionContainer];
	}
}


- (UMGSMMAP_AnyTimeInterrogationArg *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		_subscriberIdentity = [[UMGSMMAP_SubscriberIdentity alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		_requestedInfo = [[UMGSMMAP_RequestedInfo alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		_gsmSCF_Address = [[UMASN1OctetString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		_extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
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
	if(_subscriberIdentity)
	{
		dict[@"subscriberIdentity"] = _subscriberIdentity.objectValue;
	}
	if(_requestedInfo)
	{
		dict[@"requestedInfo"] = _requestedInfo.objectValue;
	}
	if(_gsmSCF_Address)
	{
		dict[@"gsmSCF-Address"] = _gsmSCF_Address.objectValue;
	}
	if(_extensionContainer)
	{
		dict[@"extensionContainer"] = _extensionContainer.objectValue;
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


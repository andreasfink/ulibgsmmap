//
//  UMGSMMAP_SendRoutingInfoForGprsRes.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_SendRoutingInfoForGprsRes.h"

@implementation UMGSMMAP_SendRoutingInfoForGprsRes


@synthesize	operationName;
@synthesize	sgsn_Address;
@synthesize	ggsn_Address;
@synthesize	mobileNotReachableReason;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(sgsn_Address)
	{
		sgsn_Address.asn1_tag.tagNumber = 0;
		sgsn_Address.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:sgsn_Address];
	}
	if(ggsn_Address)
	{
		ggsn_Address.asn1_tag.tagNumber = 1;
		ggsn_Address.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:ggsn_Address];
	}
	if(mobileNotReachableReason)
	{
		mobileNotReachableReason.asn1_tag.tagNumber = 2;
		mobileNotReachableReason.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:mobileNotReachableReason];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 3;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_SendRoutingInfoForGprsRes *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		sgsn_Address = [[UMGSMMAP_GSN_Address alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ggsn_Address = [[UMGSMMAP_GSN_Address alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		mobileNotReachableReason = [[UMGSMMAP_AbsentSubscriberDiagnosticSM alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
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
	return @"SendRoutingInfoForGprsRes";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(sgsn_Address)
	{
		dict[@"sgsn-Address"] = sgsn_Address.objectValue;
	}
	if(ggsn_Address)
	{
		dict[@"ggsn-Address"] = ggsn_Address.objectValue;
	}
	if(mobileNotReachableReason)
	{
		dict[@"mobileNotReachableReason"] = mobileNotReachableReason.objectValue;
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


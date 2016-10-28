//
//  UMGSMMAP_ProvideSubscriberInfoArg.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_ProvideSubscriberInfoArg.h"

@implementation UMGSMMAP_ProvideSubscriberInfoArg


@synthesize	operationName;
@synthesize	imsi;
@synthesize	lmsi;
@synthesize	requestedInfo;
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
	if(lmsi)
	{
		lmsi.asn1_tag.tagNumber = 1;
		lmsi.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:lmsi];
	}
	if(requestedInfo)
	{
		requestedInfo.asn1_tag.tagNumber = 2;
		requestedInfo.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:requestedInfo];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 3;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_ProvideSubscriberInfoArg *) processAfterDecodeWithContext:(id)context
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
		lmsi = [[UMGSMMAP_LMSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		requestedInfo = [[UMGSMMAP_RequestedInfo alloc]initWithASN1Object:o context:context];
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
	return @"ProvideSubscriberInfoArg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(imsi)
	{
		dict[@"imsi"] = imsi.objectValue;
	}
	if(lmsi)
	{
		dict[@"lmsi"] = lmsi.objectValue;
	}
	if(requestedInfo)
	{
		dict[@"requestedInfo"] = requestedInfo.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
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


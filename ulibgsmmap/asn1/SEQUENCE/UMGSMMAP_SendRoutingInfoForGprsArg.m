//
//  UMGSMMAP_SendRoutingInfoForGprsArg.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_SendRoutingInfoForGprsArg.h"

@implementation UMGSMMAP_SendRoutingInfoForGprsArg


@synthesize	operationName;
@synthesize	imsi;
@synthesize	ggsn_Address;
@synthesize	ggsn_Number;
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
	if(ggsn_Address)
	{
		ggsn_Address.asn1_tag.tagNumber = 1;
		ggsn_Address.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ggsn_Address];
	}
	if(ggsn_Number)
	{
		ggsn_Number.asn1_tag.tagNumber = 2;
		ggsn_Number.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ggsn_Number];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 3;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_SendRoutingInfoForGprsArg *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_SendRoutingInfoForGprsArg"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		imsi = [[UMGSMMAP_IMSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ggsn_Address = [[UMGSMMAP_GSN_Address alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ggsn_Number = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
	}
	return self;
}

- (NSString *) objectName
{
	return @"SendRoutingInfoForGprsArg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(imsi)
	{
		dict[@"imsi"] = imsi.objectValue;
	}
	if(ggsn_Address)
	{
		dict[@"ggsn-Address"] = ggsn_Address.objectValue;
	}
	if(ggsn_Number)
	{
		dict[@"ggsn-Number"] = ggsn_Number.objectValue;
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


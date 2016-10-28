//
//  UMGSMMAP_RoutingInfoForLCS_Res.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_RoutingInfoForLCS_Res.h"

@implementation UMGSMMAP_RoutingInfoForLCS_Res


@synthesize	operationName;
@synthesize	targetMS;
@synthesize	lcsLocationInfo;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(targetMS)
	{
		targetMS.asn1_tag.tagNumber = 0;
		targetMS.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:targetMS];
	}
	if(lcsLocationInfo)
	{
		lcsLocationInfo.asn1_tag.tagNumber = 1;
		lcsLocationInfo.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:lcsLocationInfo];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 2;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_RoutingInfoForLCS_Res *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_RoutingInfoForLCS_Res"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		targetMS = [[UMGSMMAP_SubscriberIdentity alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		lcsLocationInfo = [[UMGSMMAP_LCSLocationInfo alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
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
	return @"RoutingInfoForLCS-Res";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(targetMS)
	{
		dict[@"targetMS"] = targetMS.objectValue;
	}
	if(lcsLocationInfo)
	{
		dict[@"lcsLocationInfo"] = lcsLocationInfo.objectValue;
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


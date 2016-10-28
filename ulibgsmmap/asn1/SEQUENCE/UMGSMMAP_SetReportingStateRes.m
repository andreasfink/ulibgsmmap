//
//  UMGSMMAP_SetReportingStateRes.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_SetReportingStateRes.h"

@implementation UMGSMMAP_SetReportingStateRes


@synthesize	operationName;
@synthesize	ccbs_SubscriberStatus;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(ccbs_SubscriberStatus)
	{
		ccbs_SubscriberStatus.asn1_tag.tagNumber = 0;
		ccbs_SubscriberStatus.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ccbs_SubscriberStatus];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 1;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_SetReportingStateRes *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_SetReportingStateRes"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ccbs_SubscriberStatus = [[UMGSMMAP_CCBS_SubscriberStatus alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
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
	return @"SetReportingStateRes";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(ccbs_SubscriberStatus)
	{
		dict[@"ccbs-SubscriberStatus"] = ccbs_SubscriberStatus.objectValue;
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


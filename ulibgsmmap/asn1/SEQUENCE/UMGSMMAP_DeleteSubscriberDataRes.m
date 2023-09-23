//
//  UMGSMMAP_DeleteSubscriberDataRes.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_DeleteSubscriberDataRes.h>

@implementation UMGSMMAP_DeleteSubscriberDataRes


@synthesize	operationName;
@synthesize	regionalSubscriptionResponse;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(regionalSubscriptionResponse)
	{
		regionalSubscriptionResponse.asn1_tag.tagNumber = 0;
		regionalSubscriptionResponse.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:regionalSubscriptionResponse];
	}
	if(extensionContainer)
	{
		[asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_DeleteSubscriberDataRes *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_DeleteSubscriberDataRes"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		regionalSubscriptionResponse = [[UMGSMMAP_RegionalSubscriptionResponse alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
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
	return @"DeleteSubscriberDataRes";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(regionalSubscriptionResponse)
	{
		dict[@"regionalSubscriptionResponse"] = regionalSubscriptionResponse.objectValue;
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


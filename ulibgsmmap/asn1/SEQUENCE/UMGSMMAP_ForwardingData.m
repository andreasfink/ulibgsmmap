//
//  UMGSMMAP_ForwardingData.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_ForwardingData.h"

@implementation UMGSMMAP_ForwardingData


@synthesize	operationName;
@synthesize	forwardedToNumber;
@synthesize	forwardedToSubaddress;
@synthesize	forwardingOptions;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(forwardedToNumber)
	{
		forwardedToNumber.asn1_tag.tagNumber = 5;
		forwardedToNumber.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:forwardedToNumber];
	}
	if(forwardedToSubaddress)
	{
		forwardedToSubaddress.asn1_tag.tagNumber = 4;
		forwardedToSubaddress.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:forwardedToSubaddress];
	}
	if(forwardingOptions)
	{
		forwardingOptions.asn1_tag.tagNumber = 6;
		forwardingOptions.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:forwardingOptions];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 7;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_ForwardingData *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_ForwardingData"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		forwardedToNumber = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		forwardedToSubaddress = [[UMGSMMAP_ISDN_SubaddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 6) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		forwardingOptions = [[UMGSMMAP_ForwardingOptions alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 7) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
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
	return @"ForwardingData";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(forwardedToNumber)
	{
		dict[@"forwardedToNumber"] = forwardedToNumber.objectValue;
	}
	if(forwardedToSubaddress)
	{
		dict[@"forwardedToSubaddress"] = forwardedToSubaddress.objectValue;
	}
	if(forwardingOptions)
	{
		dict[@"forwardingOptions"] = forwardingOptions.objectValue;
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


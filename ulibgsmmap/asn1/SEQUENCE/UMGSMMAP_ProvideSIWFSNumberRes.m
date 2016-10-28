//
//  UMGSMMAP_ProvideSIWFSNumberRes.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_ProvideSIWFSNumberRes.h"

@implementation UMGSMMAP_ProvideSIWFSNumberRes


@synthesize	operationName;
@synthesize	sIWFSNumber;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(sIWFSNumber)
	{
		sIWFSNumber.asn1_tag.tagNumber = 0;
		sIWFSNumber.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:sIWFSNumber];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 1;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_ProvideSIWFSNumberRes *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_ProvideSIWFSNumberRes"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		sIWFSNumber = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
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
	return @"ProvideSIWFSNumberRes";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(sIWFSNumber)
	{
		dict[@"sIWFSNumber"] = sIWFSNumber.objectValue;
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


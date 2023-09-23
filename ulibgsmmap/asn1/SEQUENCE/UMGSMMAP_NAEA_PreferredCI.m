//
//  UMGSMMAP_NAEA_PreferredCI.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_NAEA_PreferredCI.h>

@implementation UMGSMMAP_NAEA_PreferredCI


@synthesize	operationName;
@synthesize	naea_PreferredCIC;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(naea_PreferredCIC)
	{
		naea_PreferredCIC.asn1_tag.tagNumber = 0;
		naea_PreferredCIC.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:naea_PreferredCIC];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 1;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_NAEA_PreferredCI *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_NAEA_PreferredCI"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		naea_PreferredCIC = [[UMGSMMAP_NAEA_CIC alloc]initWithASN1Object:o context:context];
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
	return @"NAEA-PreferredCI";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(naea_PreferredCIC)
	{
		dict[@"naea-PreferredCIC"] = naea_PreferredCIC.objectValue;
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


//
//  UMGSMMAP_ExtensibleCallBarredParam.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_ExtensibleCallBarredParam.h>

@implementation UMGSMMAP_ExtensibleCallBarredParam


@synthesize	operationName;
@synthesize	callBarringCause;
@synthesize	extensionContainer;
@synthesize	unauthorisedMessageOriginator;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(callBarringCause)
	{
		[asn1_list addObject:callBarringCause];
	}
	if(extensionContainer)
	{
		[asn1_list addObject:extensionContainer];
	}
	if(unauthorisedMessageOriginator)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 1;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
}


- (UMGSMMAP_ExtensibleCallBarredParam *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_ExtensibleCallBarredParam"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		callBarringCause = [[UMGSMMAP_CallBarringCause alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			unauthorisedMessageOriginator = YES;
			o = [self getObjectAtPosition:p++];
		}
	}
	return self;
}

- (NSString *) objectName
{
	return @"ExtensibleCallBarredParam";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(callBarringCause)
	{
		dict[@"callBarringCause"] = callBarringCause.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(unauthorisedMessageOriginator)
	{
		dict[@"unauthorisedMessageOriginator"] = @(YES);
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


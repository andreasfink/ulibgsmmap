//
//  UMGSMMAP_UnknownSubscriberParam.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_UnknownSubscriberParam.h"

@implementation UMGSMMAP_UnknownSubscriberParam


@synthesize	operationName;
@synthesize	extensionContainer;
@synthesize	unknownSubscriberDiagnostic;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(extensionContainer)
	{
		[asn1_list addObject:extensionContainer];
	}
	if(unknownSubscriberDiagnostic)
	{
		[asn1_list addObject:unknownSubscriberDiagnostic];
	}
}


- (UMGSMMAP_UnknownSubscriberParam *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_UnknownSubscriberParam"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if(o)
		{
			unknownSubscriberDiagnostic = [[UMGSMMAP_UnknownSubscriberDiagnostic alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
	}
	return self;
}

- (NSString *) objectName
{
	return @"UnknownSubscriberParam";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(unknownSubscriberDiagnostic)
	{
		dict[@"unknownSubscriberDiagnostic"] = unknownSubscriberDiagnostic.objectValue;
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


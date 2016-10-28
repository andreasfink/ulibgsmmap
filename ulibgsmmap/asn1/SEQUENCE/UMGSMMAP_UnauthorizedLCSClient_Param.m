//
//  UMGSMMAP_UnauthorizedLCSClient_Param.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_UnauthorizedLCSClient_Param.h"

@implementation UMGSMMAP_UnauthorizedLCSClient_Param


@synthesize	operationName;
@synthesize	unauthorizedLCSClient_Diagnostic;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(unauthorizedLCSClient_Diagnostic)
	{
		unauthorizedLCSClient_Diagnostic.asn1_tag.tagNumber = 0;
		unauthorizedLCSClient_Diagnostic.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:unauthorizedLCSClient_Diagnostic];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 1;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_UnauthorizedLCSClient_Param *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_UnauthorizedLCSClient_Param"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		unauthorizedLCSClient_Diagnostic = [[UMGSMMAP_UnauthorizedLCSClient_Diagnostic alloc]initWithASN1Object:o context:context];
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
	return @"UnauthorizedLCSClient-Param";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(unauthorizedLCSClient_Diagnostic)
	{
		dict[@"unauthorizedLCSClient-Diagnostic"] = unauthorizedLCSClient_Diagnostic.objectValue;
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


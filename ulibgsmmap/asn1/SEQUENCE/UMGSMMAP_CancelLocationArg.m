//
//  UMGSMMAP_CancelLocationArg.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_CancelLocationArg.h>

@implementation UMGSMMAP_CancelLocationArg


@synthesize	operationName;
@synthesize	identity;
@synthesize	cancellationType;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(identity)
	{
		[asn1_list addObject:identity];
	}
	if(cancellationType)
	{
		[asn1_list addObject:cancellationType];
	}
	if(extensionContainer)
	{
		[asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_CancelLocationArg *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_CancelLocationArg"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		identity = [[UMGSMMAP_Identity alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		cancellationType = [[UMGSMMAP_CancellationType alloc]initWithASN1Object:o context:context];
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
	return @"CancelLocationArg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(identity)
	{
		dict[@"identity"] = identity.objectValue;
	}
	if(cancellationType)
	{
		dict[@"cancellationType"] = cancellationType.objectValue;
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


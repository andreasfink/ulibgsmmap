//
//  UMGSMMAP_Eps_AuthenticationSet.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_Eps_AuthenticationSet.h"

@implementation UMGSMMAP_Eps_AuthenticationSet


@synthesize	operationName;
@synthesize	rand;
@synthesize	xres;
@synthesize	autn;
@synthesize	kasme;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(rand)
	{
		[asn1_list addObject:rand];
	}
	if(xres)
	{
		[asn1_list addObject:xres];
	}
	if(autn)
	{
		[asn1_list addObject:autn];
	}
	if(kasme)
	{
		[asn1_list addObject:kasme];
	}
	if(extensionContainer)
	{
		[asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_Eps_AuthenticationSet *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_Eps_AuthenticationSet"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		rand = [[UMASN1OctetString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		xres = [[UMASN1OctetString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		autn = [[UMASN1OctetString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		kasme = [[UMASN1OctetString alloc]initWithASN1Object:o context:context];
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
	return @"Eps-AuthenticationSet";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(rand)
	{
		dict[@"rand"] = rand.objectValue;
	}
	if(xres)
	{
		dict[@"xres"] = xres.objectValue;
	}
	if(autn)
	{
		dict[@"autn"] = autn.objectValue;
	}
	if(kasme)
	{
		dict[@"kasme"] = kasme.objectValue;
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


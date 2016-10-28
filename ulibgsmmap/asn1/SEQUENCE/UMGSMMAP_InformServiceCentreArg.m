//
//  UMGSMMAP_InformServiceCentreArg.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_InformServiceCentreArg.h"

@implementation UMGSMMAP_InformServiceCentreArg


@synthesize	operationName;
@synthesize	storedMSISDN;
@synthesize	mw_Status;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(storedMSISDN)
	{
		[asn1_list addObject:storedMSISDN];
	}
	if(mw_Status)
	{
		[asn1_list addObject:mw_Status];
	}
	if(extensionContainer)
	{
		[asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_InformServiceCentreArg *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_InformServiceCentreArg"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		storedMSISDN = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		mw_Status = [[UMGSMMAP_MW_Status alloc]initWithASN1Object:o context:context];
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
	return @"InformServiceCentreArg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(storedMSISDN)
	{
		dict[@"storedMSISDN"] = storedMSISDN.objectValue;
	}
	if(mw_Status)
	{
		dict[@"mw-Status"] = mw_Status.objectValue;
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


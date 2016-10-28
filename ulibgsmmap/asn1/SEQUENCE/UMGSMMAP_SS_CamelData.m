//
//  UMGSMMAP_SS_CamelData.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_SS_CamelData.h"

@implementation UMGSMMAP_SS_CamelData


@synthesize	operationName;
@synthesize	ss_EventList;
@synthesize	gsmSCF_Address;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(ss_EventList)
	{
		[asn1_list addObject:ss_EventList];
	}
	if(gsmSCF_Address)
	{
		[asn1_list addObject:gsmSCF_Address];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 0;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_SS_CamelData *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_SS_CamelData"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		ss_EventList = [[UMGSMMAP_SS_EventList alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		gsmSCF_Address = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
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
	return @"SS-CamelData";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(ss_EventList)
	{
		dict[@"ss-EventList"] = ss_EventList.objectValue;
	}
	if(gsmSCF_Address)
	{
		dict[@"gsmSCF-Address"] = gsmSCF_Address.objectValue;
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


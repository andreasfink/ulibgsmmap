//
//  UMGSMMAP_ExtensionContainer.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_ExtensionContainer.h"

@implementation UMGSMMAP_ExtensionContainer


@synthesize	operationName;
@synthesize	privateExtensionList;
@synthesize	pcs_Extensions;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(privateExtensionList)
	{
		privateExtensionList.asn1_tag.tagNumber = 0;
		privateExtensionList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:privateExtensionList];
	}
	if(pcs_Extensions)
	{
		pcs_Extensions.asn1_tag.tagNumber = 1;
		pcs_Extensions.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:pcs_Extensions];
	}
}


- (UMGSMMAP_ExtensionContainer *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		privateExtensionList = [[UMGSMMAP_PrivateExtensionList alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		pcs_Extensions = [[UMGSMMAP_PCS_Extensions alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
        /* ... */
        o = [self getObjectAtPosition:p++];
    }
	return self;
}

- (NSString *) objectName
{
	return @"ExtensionContainer";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(privateExtensionList)
	{
		dict[@"privateExtensionList"] = privateExtensionList.objectValue;
	}
	if(pcs_Extensions)
	{
		dict[@"pcs-Extensions"] = pcs_Extensions.objectValue;
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


//
//  UMGSMMAP_SendAuthenticationInfoRes.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_SendAuthenticationInfoRes.h"

@implementation UMGSMMAP_SendAuthenticationInfoRes


@synthesize	operationName;
@synthesize	authenticationSetList;
@synthesize	extensionContainer;
@synthesize	eps_AuthenticationSetList;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(authenticationSetList)
	{
		[asn1_list addObject:authenticationSetList];
	}
	if(extensionContainer)
	{
		[asn1_list addObject:extensionContainer];
	}
	if(eps_AuthenticationSetList)
	{
		eps_AuthenticationSetList.asn1_tag.tagNumber = 2;
		eps_AuthenticationSetList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:eps_AuthenticationSetList];
	}
}


- (UMGSMMAP_SendAuthenticationInfoRes *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		authenticationSetList = [[UMGSMMAP_AuthenticationSetList alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			eps_AuthenticationSetList = [[UMGSMMAP_Eps_AuthenticationSetList alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
        else
        {
            o = [self getObjectAtPosition:p++];
        }
	}
	return self;
}

- (NSString *) objectName
{
	return @"SendAuthenticationInfoRes";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(authenticationSetList)
	{
		dict[@"authenticationSetList"] = authenticationSetList.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(eps_AuthenticationSetList)
	{
		dict[@"eps-AuthenticationSetList"] = eps_AuthenticationSetList.objectValue;
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


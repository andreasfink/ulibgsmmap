//
//  UMGSMMAP_Eps_AuthenticationSet.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
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
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(rand)
	{
		[_asn1_list addObject:rand];
	}
	if(xres)
	{
		[_asn1_list addObject:xres];
	}
	if(autn)
	{
		[_asn1_list addObject:autn];
	}
	if(kasme)
	{
		[_asn1_list addObject:kasme];
	}
	if(extensionContainer)
	{
		[_asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_Eps_AuthenticationSet *) processAfterDecodeWithContext:(id)context
{
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
        /* ... */
        o = [self getObjectAtPosition:p++];
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
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}


@end


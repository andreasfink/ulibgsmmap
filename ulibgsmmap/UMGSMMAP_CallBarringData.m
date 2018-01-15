//
//  UMGSMMAP_CallBarringData.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_CallBarringData.h"

@implementation UMGSMMAP_CallBarringData


@synthesize	operationName;
@synthesize	callBarringFeatureList;
@synthesize	password;
@synthesize	wrongPasswordAttemptsCounter;
@synthesize	notificationToCSE;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	asn1_tag.isConstructed=YES;
	asn1_list = [[NSMutableArray alloc]init];
	if(callBarringFeatureList)
	{
		[asn1_list addObject:callBarringFeatureList];
	}
	if(password)
	{
		[asn1_list addObject:password];
	}
	if(wrongPasswordAttemptsCounter)
	{
		[asn1_list addObject:wrongPasswordAttemptsCounter];
	}
	if(notificationToCSE)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = -1;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(extensionContainer)
	{
		[asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_CallBarringData *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && ([UMGSMMAP_Ext_CallBarFeatureList tagMatches:o.asn1_tag.tagNumber]) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
	{
		callBarringFeatureList = [[UMGSMMAP_Ext_CallBarFeatureList alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && ([UMGSMMAP_Password tagMatches:o.asn1_tag.tagNumber]) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
	{
		password = [[UMGSMMAP_Password alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && ([UMGSMMAP_WrongPasswordAttemptsCounter tagMatches:o.asn1_tag.tagNumber]) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
	{
		wrongPasswordAttemptsCounter = [[UMGSMMAP_WrongPasswordAttemptsCounter alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == UMASN1Primitive_null) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
	{
		notificationToCSE = YES;
		o = [self getObjectAtPosition:p++];
	}
	if((o) && ([UMGSMMAP_ExtensionContainer tagMatches:o.asn1_tag.tagNumber]) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
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
	return @"CallBarringData";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(callBarringFeatureList)
	{
		dict[@"callBarringFeatureList"] = callBarringFeatureList.objectValue;
	}
	if(password)
	{
		dict[@"password"] = password.objectValue;
	}
	if(wrongPasswordAttemptsCounter)
	{
		dict[@"wrongPasswordAttemptsCounter"] = wrongPasswordAttemptsCounter.objectValue;
	}
	if(notificationToCSE)
	{
		dict[@"notificationToCSE"] = @(YES);
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


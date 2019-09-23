//
//  UMGSMMAP_LSAInformation.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_LSAInformation.h"

@implementation UMGSMMAP_LSAInformation


@synthesize	operationName;
@synthesize	completeDataListIncluded;
@synthesize	lsaOnlyAccessIndicator;
@synthesize	lsaDataList;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(completeDataListIncluded)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = -1;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:n];
	}
	if(lsaOnlyAccessIndicator)
	{
		lsaOnlyAccessIndicator.asn1_tag.tagNumber = 1;
		lsaOnlyAccessIndicator.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:lsaOnlyAccessIndicator];
	}
	if(lsaDataList)
	{
		lsaDataList.asn1_tag.tagNumber = 2;
		lsaDataList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:lsaDataList];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 3;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_LSAInformation *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		completeDataListIncluded = YES;
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		lsaOnlyAccessIndicator = [[UMGSMMAP_LSAOnlyAccessIndicator alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		lsaDataList = [[UMGSMMAP_LSADataList alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
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
	return @"LSAInformation";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(completeDataListIncluded)
	{
		dict[@"completeDataListIncluded"] = @(YES);
	}
	if(lsaOnlyAccessIndicator)
	{
		dict[@"lsaOnlyAccessIndicator"] = lsaOnlyAccessIndicator.objectValue;
	}
	if(lsaDataList)
	{
		dict[@"lsaDataList"] = lsaDataList.objectValue;
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

- (UMGSMMAP_LSAInformation *)initWithString:(NSString *)str
{
    self = [super init];
    {
        /* FIXME: do something useful here*/
    }
    return self;
}

@end


//
//  UMGSMMAP_MAP_OpenInfo.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_MAP_OpenInfo.h>

@implementation UMGSMMAP_MAP_OpenInfo


@synthesize	operationName;
@synthesize	destinationReference;
@synthesize	originationReference;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(destinationReference)
	{
		destinationReference.asn1_tag.tagNumber = 0;
		destinationReference.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:destinationReference];
	}
	if(originationReference)
	{
		originationReference.asn1_tag.tagNumber = 1;
		originationReference.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:originationReference];
	}
    if(_unknownMapOpen2)
    {
        _unknownMapOpen2.asn1_tag.tagNumber = 2;
        _unknownMapOpen2.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_unknownMapOpen2];
    }
    if(_unknownMapOpen3)
    {
        _unknownMapOpen3.asn1_tag.tagNumber = 3;
        _unknownMapOpen3.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_unknownMapOpen3];
    }
    
	if(extensionContainer)
	{
		[_asn1_list addObject:extensionContainer];
	}
    _asn1_tag.tagNumber = 0;
    _asn1_tag.tagClass = UMASN1Class_ContextSpecific;
}


- (UMGSMMAP_MAP_OpenInfo *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		destinationReference = [[UMGSMMAP_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		originationReference = [[UMGSMMAP_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
    if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
    {
        _unknownMapOpen2 = [[UMGSMMAP_AddressString alloc]initWithASN1Object:o context:context];
        o = [self getObjectAtPosition:p++];
    }
    if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
    {
        _unknownMapOpen3 = [[UMGSMMAP_AddressString alloc]initWithASN1Object:o context:context];
        o = [self getObjectAtPosition:p++];
    }
	while(o)
	{
        if((o) && (o.asn1_tag.tagNumber == UMASN1Primitive_sequence) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
		{
			extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
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
	return @"MAP-OpenInfo";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(destinationReference)
	{
		dict[@"destinationReference"] = destinationReference.objectValue;
	}
	if(originationReference)
	{
		dict[@"originationReference"] = originationReference.objectValue;
	}
    if(_unknownMapOpen2)
    {
        dict[@"_unknownMapOpen2"] = _unknownMapOpen2.objectValue;
    }
    if(_unknownMapOpen3)
    {
        dict[@"_unknownMapOpen3"] = _unknownMapOpen3.objectValue;
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


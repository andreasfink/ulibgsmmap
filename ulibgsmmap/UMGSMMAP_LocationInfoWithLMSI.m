//
//  UMGSMMAP_LocationInfoWithLMSI.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_LocationInfoWithLMSI.h>

@implementation UMGSMMAP_LocationInfoWithLMSI


@synthesize	operationName;
@synthesize	networkNode_Number;
@synthesize	lmsi;
@synthesize	extensionContainer;
@synthesize	gprsNodeIndicator;
@synthesize	additional_Number;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(networkNode_Number)
	{
		networkNode_Number.asn1_tag.tagNumber = 1;
		networkNode_Number.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:networkNode_Number];
	}
	if(lmsi)
	{
		[_asn1_list addObject:lmsi];
	}
	if(extensionContainer)
	{
		[_asn1_list addObject:extensionContainer];
	}
	if(gprsNodeIndicator)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 5;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:n];
	}
	if(additional_Number)
	{
		additional_Number.asn1_tag.tagNumber = 6;
		additional_Number.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:additional_Number];
	}
}


- (UMGSMMAP_LocationInfoWithLMSI *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		networkNode_Number = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		lmsi = [[UMGSMMAP_LMSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			gprsNodeIndicator = YES;
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 6) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			additional_Number = [[UMGSMMAP_Additional_Number alloc]initWithASN1Object:o context:context];
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
	return @"LocationInfoWithLMSI";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(networkNode_Number)
	{
		dict[@"networkNode-Number"] = networkNode_Number.objectValue;
	}
	if(lmsi)
	{
		dict[@"lmsi"] = lmsi.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(gprsNodeIndicator)
	{
		dict[@"gprsNodeIndicator"] = @(YES);
	}
	if(additional_Number)
	{
		dict[@"additional-Number"] = additional_Number.objectValue;
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


//
//  UMGSMMAP_ReadyForSM_Arg.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_ReadyForSM_Arg.h>

@implementation UMGSMMAP_ReadyForSM_Arg


@synthesize	operationName;

- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(_imsi)
	{
		_imsi.asn1_tag.tagNumber = 0;
        _imsi.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:_imsi];
	}
	if(_alertReason)
	{
        _alertReason.asn1_tag.tagNumber = UMASN1Primitive_enumerated;
        _alertReason.asn1_tag.tagClass = UMASN1Class_Universal;
		[_asn1_list addObject:_alertReason];
	}
	if(_alertReasonIndicator)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
        n.asn1_tag.tagNumber = UMASN1Primitive_null;
		n.asn1_tag.tagClass = UMASN1Class_Universal;
		[_asn1_list addObject:n];
	}
	if(_extensionContainer)
	{
		[_asn1_list addObject:_extensionContainer];
	}
    if(_additionalAlertReasonIndicator)
    {
        UMASN1Null *n = [[UMASN1Null alloc]init];
        n.asn1_tag.tagNumber = 1;
        n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:n];
    }
}

- (UMGSMMAP_ReadyForSM_Arg *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		_imsi = [[UMGSMMAP_IMSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		_alertReason = [[UMGSMMAP_AlertReason alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
    if((o) && (o.asn1_tag.tagNumber == UMASN1Primitive_null) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
	{
		_alertReasonIndicator = YES;
		o = [self getObjectAtPosition:p++];
	}
    if((o) && (o.asn1_tag.tagNumber == UMASN1Primitive_sequence) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
	{
		_extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
    if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
    {
        _additionalAlertReasonIndicator = YES;
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
	return @"ReadyForSM-Arg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(_imsi)
	{
		dict[@"imsi"] = _imsi.objectValue;
	}
	if(_alertReason)
	{
		dict[@"alertReason"] = _alertReason.objectValue;
	}
	if(_alertReasonIndicator)
	{
		dict[@"alertReasonIndicator"] = @(YES);
	}
	if(_extensionContainer)
	{
		dict[@"extensionContainer"] = _extensionContainer.objectValue;
	}
    if(_additionalAlertReasonIndicator)
    {
        dict[@"additionalAlertReasonIndicator"] = @(YES);
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


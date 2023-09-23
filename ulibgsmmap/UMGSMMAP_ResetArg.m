//
//  UMGSMMAP_ResetArg.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_ResetArg.h>

@implementation UMGSMMAP_ResetArg


@synthesize	operationName;

- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(_sendingNodenumber)
	{
		[_asn1_list addObject:_sendingNodenumber];
	}
	if(_hlr_List)
	{
		[_asn1_list addObject:_hlr_List];
	}
    if(_reset_Id_List)
    {
        _reset_Id_List.asn1_tag.tagNumber = 1;
        _reset_Id_List.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_reset_Id_List];
    }
    if(_subscriptionData)
    {
        _subscriptionData.asn1_tag.tagNumber = 2;
        _subscriptionData.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_subscriptionData];
    }
    if(_subscriptionDataDeletion)
    {
        _subscriptionDataDeletion.asn1_tag.tagNumber = 3;
        _subscriptionDataDeletion.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_subscriptionDataDeletion];
    }
}

- (UMGSMMAP_ResetArg *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		_sendingNodenumber = [[UMGSMMAP_SendingNode_Number alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagClass == UMASN1Class_Universal) && (o.asn1_tag.tagNumber == UMASN1Primitive_sequence))
	{
		_hlr_List = [[UMGSMMAP_HLR_List alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
        if((o) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific) && (o.asn1_tag.tagNumber == 1))
        {
            _reset_Id_List = [[UMGSMMAP_Reset_Id_List alloc]initWithASN1Object:o context:context];
        }
        else if((o) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific) && (o.asn1_tag.tagNumber == 2))
        {
            _subscriptionData = [[UMGSMMAP_InsertSubscriberDataArg alloc]initWithASN1Object:o context:context];
        }
        else if((o) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific) && (o.asn1_tag.tagNumber == 3))
        {
            _subscriptionDataDeletion = [[UMGSMMAP_DeleteSubscriberDataArg alloc]initWithASN1Object:o context:context];
        }
        /* ... */
        o = [self getObjectAtPosition:p++];
    }
    
    if(_reset_Id_List)
    {
        _reset_Id_List.asn1_tag.tagNumber = 1;
        _reset_Id_List.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_reset_Id_List];
    }
    if(_subscriptionData)
    {
        _subscriptionData.asn1_tag.tagNumber = 2;
        _subscriptionData.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_subscriptionData];
    }
    if(_subscriptionDataDeletion)
    {
        _subscriptionDataDeletion.asn1_tag.tagNumber = 3;
        _subscriptionDataDeletion.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_subscriptionDataDeletion];
    }
	return self;
}

- (NSString *) objectName
{
	return @"ResetArg";
}

- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(_sendingNodenumber)
	{
		dict[@"sendingNodenumber"] = _sendingNodenumber.objectValue;
	}
	if(_hlr_List)
	{
		dict[@"hlr-List"] = _hlr_List.objectValue;
	}
    if(_reset_Id_List)
    {
        dict[@"reset-Id-List"] = _reset_Id_List.objectValue;
    }
    if(_subscriptionData)
    {
        dict[@"subscriptionData"] = _subscriptionData.objectValue;
    }
    if(_subscriptionDataDeletion)
    {
        dict[@"subscriptionDataDeletion"] = _subscriptionDataDeletion.objectValue;
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


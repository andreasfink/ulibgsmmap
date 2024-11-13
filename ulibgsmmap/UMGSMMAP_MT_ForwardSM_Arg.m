//
//  UMGSMMAP_MT_ForwardSM_Arg.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_MT_ForwardSM_Arg.h>

@implementation UMGSMMAP_MT_ForwardSM_Arg




- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(_sm_RP_DA)
	{
		[_asn1_list addObject:_sm_RP_DA];
	}
	if(_sm_RP_OA)
	{
		[_asn1_list addObject:_sm_RP_OA];
	}
	if(_sm_RP_UI)
	{
		[_asn1_list addObject:_sm_RP_UI];
	}
	if(_moreMessagesToSend)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = -1;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:n];
	}
	if(_extensionContainer)
	{
		[_asn1_list addObject:_extensionContainer];
	}
}


- (UMGSMMAP_MT_ForwardSM_Arg *) processAfterDecodeWithContext:(id)context
{
	int p=0;
    UMASN1Object *o = [self getObjectAtPosition:p++];
    
	if(o)
	{
		_sm_RP_DA = [[UMGSMMAP_SM_RP_DA alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		_sm_RP_OA = [[UMGSMMAP_SM_RP_OA alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		_sm_RP_UI = [[UMGSMMAP_SignalInfo alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		_moreMessagesToSend = YES;
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
        UMASN1Object *o2 = [o getObjectAtPosition:0];
		_extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o2 context:context];
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
	return @"MT-ForwardSM-Arg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(_sm_RP_DA)
	{
		dict[@"sm-RP-DA"] = _sm_RP_DA.objectValue;
	}
	if(_sm_RP_OA)
	{
		dict[@"sm-RP-OA"] = _sm_RP_OA.objectValue;
	}
	if(_sm_RP_UI)
	{
		dict[@"sm-RP-UI"] = _sm_RP_UI.objectValue;
	}
	if(_moreMessagesToSend)
	{
		dict[@"moreMessagesToSend"] = @(YES);
	}
	if(_extensionContainer)
	{
		dict[@"extensionContainer"] = _extensionContainer.objectValue;
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


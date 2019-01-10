//
//  UMGSMMAP_SendParametersArg.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 09.01.19.
//  Copyright © 2019 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMGSMMAP_SendParametersArg.h"
#import "UMGSMMAP_SubscriberIdentity.h"
#import "UMGSMMAP_RequestParameterList.h"

@implementation UMGSMMAP_SendParametersArg

@synthesize operationName;

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}

- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(_subscriberId==NULL)
	{
		@throw([NSException exceptionWithName:@"PARAMETER_MISSING"
									   reason:@"UMGSMMAP_SendParametersArg subscriberId missing"
									 userInfo:NULL]);
	}
	[_asn1_list addObject:_subscriberId];
	if(_requestParameterList==NULL)
	{
		@throw([NSException exceptionWithName:@"PARAMETER_MISSING"
									   reason:@"UMGSMMAP_SendParametersArg requestParameterList missing"
									 userInfo:NULL]);
	}
	[_asn1_list addObject:_requestParameterList];

}


- (UMGSMMAP_SendParametersArg *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		_subscriberId = [[UMGSMMAP_SubscriberIdentity alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		_requestParameterList = [[UMGSMMAP_RequestParameterList alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	return self;
}



- (NSString *) objectName
{
	return @"SendParametersArg";
}

- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(_subscriberId)
	{
		dict[@"subscriberId"] = _subscriberId.objectValue;
	}
	if(_requestParameterList)
	{
		dict[@"requestParameterList"] = _requestParameterList.objectValue;
	}

	return dict;
}

@end


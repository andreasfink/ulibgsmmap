//
//  UMGSMMAP_GPRSSubscriptionDataWithdraw.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_GPRSSubscriptionDataWithdraw.h"

@implementation UMGSMMAP_GPRSSubscriptionDataWithdraw


@synthesize	operationName;
@synthesize	allGPRSData;
@synthesize	contextIdList;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	BOOL isImplicit = YES;
	if(self.asn1_tag.tagClass == UMASN1Class_ContextSpecific)
	{
		isImplicit = NO;
		_asn1_tag.isConstructed=YES;
		_asn1_list = [[NSMutableArray alloc]init];
	}
	if(allGPRSData)
	{
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = -1;
			self.asn1_tag.tagClass = UMASN1Class_Universal;
			self.asn1_tag.isConstructed = NO;
			self.asn1_data = [NSData data];
			self.asn1_list = NULL;
		}
		else
		{
			UMASN1Null *n = [[UMASN1Null alloc]init];
			n.asn1_tag.tagNumber = -1;
			n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:n];
		}
	}
	else if(contextIdList)
	{
		[contextIdList processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = contextIdList.asn1_tag.tagNumber;
			self.asn1_tag.tagClass = contextIdList.asn1_tag.tagClass;
			self.asn1_tag.isConstructed = contextIdList.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_data = [contextIdList.asn1_data copy];
			}
			else
			{
				self.asn1_list = [contextIdList.asn1_list copy];
			}
		}
		else
		{
			[_asn1_list addObject:contextIdList];
		}
	}
	else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_GPRSSubscriptionDataWithdraw choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_GPRSSubscriptionDataWithdraw *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o;
	BOOL isImplicit = YES;
	if(self.asn1_tag.tagClass == UMASN1Class_ContextSpecific)
	{
		isImplicit = NO;
		o = [self getObjectAtPosition:p++];
	}
	else
	{
		o = self;
	}
	
	if((o) && ([UMASN1Null tagMatches:o.asn1_tag.tagNumber]) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
	{
		allGPRSData = YES;
	}
	else if((o) && ([UMGSMMAP_ContextIdList tagMatches:o.asn1_tag.tagNumber]) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
	{
		contextIdList = [[UMGSMMAP_ContextIdList alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"GPRSSubscriptionDataWithdraw";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(allGPRSData)
	{
		dict[@"allGPRSData"] = @(YES);
	}
	if(contextIdList)
	{
		dict[@"contextIdList"] = contextIdList.objectValue;
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


//
//  UMGSMMAP_SubscriberState.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_SubscriberState.h"

@implementation UMGSMMAP_SubscriberState


@synthesize	operationName;
@synthesize	assumedIdle;
@synthesize	camelBusy;
@synthesize	netDetNotReachable;
@synthesize	notProvidedFromVLR;


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
	if(assumedIdle)
	{
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 0;
			self.asn1_tag.tagClass = UMASN1Class_Universal;
			self.asn1_tag.isConstructed = NO;
			self.asn1_data = [NSData data];
			self.asn1_list = NULL;
		}
		else
		{
			UMASN1Null *n = [[UMASN1Null alloc]init];
			n.asn1_tag.tagNumber = 0;
			n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:n];
		}
	}
	else if(camelBusy)
	{
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 1;
			self.asn1_tag.tagClass = UMASN1Class_Universal;
			self.asn1_tag.isConstructed = NO;
			self.asn1_data = [NSData data];
			self.asn1_list = NULL;
		}
		else
		{
			UMASN1Null *n = [[UMASN1Null alloc]init];
			n.asn1_tag.tagNumber = 1;
			n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:n];
		}
	}
	else if(netDetNotReachable)
	{
		[netDetNotReachable processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = netDetNotReachable.asn1_tag.tagNumber;
			self.asn1_tag.tagClass = netDetNotReachable.asn1_tag.tagClass;
			self.asn1_tag.isConstructed = netDetNotReachable.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_data = [netDetNotReachable.asn1_data copy];
			}
			else
			{
				self.asn1_list = [netDetNotReachable.asn1_list copy];
			}
		}
		else
		{
			[_asn1_list addObject:netDetNotReachable];
		}
	}
	else if(notProvidedFromVLR)
	{
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 2;
			self.asn1_tag.tagClass = UMASN1Class_Universal;
			self.asn1_tag.isConstructed = NO;
			self.asn1_data = [NSData data];
			self.asn1_list = NULL;
		}
		else
		{
			UMASN1Null *n = [[UMASN1Null alloc]init];
			n.asn1_tag.tagNumber = 2;
			n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:n];
		}
	}
	else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_SubscriberState choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_SubscriberState *) processAfterDecodeWithContext:(id)context
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
	
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		assumedIdle = YES;
	}
	else if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		camelBusy = YES;
	}
	else if((o) && ([UMGSMMAP_NotReachableReason tagMatches:o.asn1_tag.tagNumber]) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
	{
		netDetNotReachable = [[UMGSMMAP_NotReachableReason alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		notProvidedFromVLR = YES;
	}
	return self;
}

- (NSString *) objectName
{
	return @"SubscriberState";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(assumedIdle)
	{
		dict[@"assumedIdle"] = @(YES);
	}
	if(camelBusy)
	{
		dict[@"camelBusy"] = @(YES);
	}
	if(netDetNotReachable)
	{
		dict[@"netDetNotReachable"] = netDetNotReachable.objectValue;
	}
	if(notProvidedFromVLR)
	{
		dict[@"notProvidedFromVLR"] = @(YES);
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


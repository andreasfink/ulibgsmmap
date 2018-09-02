//
//  UMGSMMAP_PS_SubscriberState.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_PS_SubscriberState.h"

@implementation UMGSMMAP_PS_SubscriberState


@synthesize	operationName;
@synthesize	notProvidedFromSGSNorMME;
@synthesize	ps_Detached;
@synthesize	ps_AttachedNotReachableForPaging;
@synthesize	ps_AttachedReachableForPaging;
@synthesize	ps_PDP_ActiveNotReachableForPaging;
@synthesize	ps_PDP_ActiveReachableForPaging;
@synthesize	netDetNotReachable;


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
	if(notProvidedFromSGSNorMME)
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
	else if(ps_Detached)
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
	else if(ps_AttachedNotReachableForPaging)
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
	else if(ps_AttachedReachableForPaging)
	{
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 3;
			self.asn1_tag.tagClass = UMASN1Class_Universal;
			self.asn1_tag.isConstructed = NO;
			self.asn1_data = [NSData data];
			self.asn1_list = NULL;
		}
		else
		{
			UMASN1Null *n = [[UMASN1Null alloc]init];
			n.asn1_tag.tagNumber = 3;
			n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:n];
		}
	}
	else if(ps_PDP_ActiveNotReachableForPaging)
	{
		[ps_PDP_ActiveNotReachableForPaging processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 4;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = ps_PDP_ActiveNotReachableForPaging.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [ps_PDP_ActiveNotReachableForPaging.asn1_list copy];
			}
			else
			{
				self.asn1_data = [ps_PDP_ActiveNotReachableForPaging.asn1_data copy];
			}
		}
		else
		{
			ps_PDP_ActiveNotReachableForPaging.asn1_tag.tagNumber = 4;
			ps_PDP_ActiveNotReachableForPaging.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:ps_PDP_ActiveNotReachableForPaging];
		}
	}
	else if(ps_PDP_ActiveReachableForPaging)
	{
		[ps_PDP_ActiveReachableForPaging processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 5;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = ps_PDP_ActiveReachableForPaging.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [ps_PDP_ActiveReachableForPaging.asn1_list copy];
			}
			else
			{
				self.asn1_data = [ps_PDP_ActiveReachableForPaging.asn1_data copy];
			}
		}
		else
		{
			ps_PDP_ActiveReachableForPaging.asn1_tag.tagNumber = 5;
			ps_PDP_ActiveReachableForPaging.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:ps_PDP_ActiveReachableForPaging];
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
	else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_PS_SubscriberState choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_PS_SubscriberState *) processAfterDecodeWithContext:(id)context
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
		notProvidedFromSGSNorMME = YES;
	}
	else if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ps_Detached = YES;
	}
	else if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ps_AttachedNotReachableForPaging = YES;
	}
	else if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ps_AttachedReachableForPaging = YES;
	}
	else if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ps_PDP_ActiveNotReachableForPaging = [[UMGSMMAP_PDP_ContextInfoList alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ps_PDP_ActiveReachableForPaging = [[UMGSMMAP_PDP_ContextInfoList alloc]initWithASN1Object:o context:context];
	}
	else if((o) && ([UMGSMMAP_NotReachableReason tagMatches:o.asn1_tag.tagNumber]) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
	{
		netDetNotReachable = [[UMGSMMAP_NotReachableReason alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"PS-SubscriberState";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(notProvidedFromSGSNorMME)
	{
		dict[@"notProvidedFromSGSNorMME"] = @(YES);
	}
	if(ps_Detached)
	{
		dict[@"ps-Detached"] = @(YES);
	}
	if(ps_AttachedNotReachableForPaging)
	{
		dict[@"ps-AttachedNotReachableForPaging"] = @(YES);
	}
	if(ps_AttachedReachableForPaging)
	{
		dict[@"ps-AttachedReachableForPaging"] = @(YES);
	}
	if(ps_PDP_ActiveNotReachableForPaging)
	{
		dict[@"ps-PDP-ActiveNotReachableForPaging"] = ps_PDP_ActiveNotReachableForPaging.objectValue;
	}
	if(ps_PDP_ActiveReachableForPaging)
	{
		dict[@"ps-PDP-ActiveReachableForPaging"] = ps_PDP_ActiveReachableForPaging.objectValue;
	}
	if(netDetNotReachable)
	{
		dict[@"netDetNotReachable"] = netDetNotReachable.objectValue;
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


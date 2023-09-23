//
//  UMGSMMAP_PS_SubscriberState.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_PS_SubscriberState.h>

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
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(notProvidedFromSGSNorMME)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 0;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	else if(ps_Detached)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 1;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	else if(ps_AttachedNotReachableForPaging)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 2;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	else if(ps_AttachedReachableForPaging)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 3;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	else if(ps_PDP_ActiveNotReachableForPaging)
	{
		ps_PDP_ActiveNotReachableForPaging.asn1_tag.tagNumber = 4;
		ps_PDP_ActiveNotReachableForPaging.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ps_PDP_ActiveNotReachableForPaging];
	}
	else if(ps_PDP_ActiveReachableForPaging)
	{
		ps_PDP_ActiveReachableForPaging.asn1_tag.tagNumber = 5;
		ps_PDP_ActiveReachableForPaging.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ps_PDP_ActiveReachableForPaging];
	}
	else if(netDetNotReachable)
	{
		[asn1_list addObject:netDetNotReachable];
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
	[self setMagic:@"UMGSMMAP_PS_SubscriberState"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
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
	else if(o)
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



@end


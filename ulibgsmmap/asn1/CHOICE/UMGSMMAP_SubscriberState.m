//
//  UMGSMMAP_SubscriberState.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_SubscriberState.h>

@implementation UMGSMMAP_SubscriberState


@synthesize	operationName;
@synthesize	assumedIdle;
@synthesize	camelBusy;
@synthesize	netDetNotReachable;
@synthesize	notProvidedFromVLR;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(assumedIdle)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 0;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	else if(camelBusy)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 1;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	else if(netDetNotReachable)
	{
		[asn1_list addObject:netDetNotReachable];
	}
	else if(notProvidedFromVLR)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 2;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
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
	[self setMagic:@"UMGSMMAP_SubscriberState"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		assumedIdle = YES;
	}
	else if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		camelBusy = YES;
	}
	else if(o)
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



@end


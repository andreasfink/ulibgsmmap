//
//  UMGSMMAP_GPRSSubscriptionDataWithdraw.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_GPRSSubscriptionDataWithdraw.h>

@implementation UMGSMMAP_GPRSSubscriptionDataWithdraw


@synthesize	operationName;
@synthesize	allGPRSData;
@synthesize	contextIdList;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(allGPRSData)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = -1;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	else if(contextIdList)
	{
		[asn1_list addObject:contextIdList];
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
	[self setMagic:@"UMGSMMAP_GPRSSubscriptionDataWithdraw"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		allGPRSData = YES;
	}
	else if(o)
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



@end


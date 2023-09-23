//
//  UMGSMMAP_RoutingInfo.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_RoutingInfo.h>

@implementation UMGSMMAP_RoutingInfo


@synthesize	operationName;
@synthesize	roamingNumber;
@synthesize	forwardingData;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(roamingNumber)
	{
		[asn1_list addObject:roamingNumber];
	}
	else if(forwardingData)
	{
		[asn1_list addObject:forwardingData];
	}
	 else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_RoutingInfo choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_RoutingInfo *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_RoutingInfo"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		roamingNumber = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
	}
	else if(o)
	{
		forwardingData = [[UMGSMMAP_ForwardingData alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"RoutingInfo";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(roamingNumber)
	{
		dict[@"roamingNumber"] = roamingNumber.objectValue;
	}
	if(forwardingData)
	{
		dict[@"forwardingData"] = forwardingData.objectValue;
	}
	return dict;
}



@end


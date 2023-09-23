//
//  UMGSMMAP_ExtendedRoutingInfo.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_ExtendedRoutingInfo.h>

@implementation UMGSMMAP_ExtendedRoutingInfo


@synthesize	operationName;
@synthesize	routingInfo;
@synthesize	camelRoutingInfo;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(routingInfo)
	{
		[asn1_list addObject:routingInfo];
	}
	else if(camelRoutingInfo)
	{
		camelRoutingInfo.asn1_tag.tagNumber = 8;
		camelRoutingInfo.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:camelRoutingInfo];
	}
	 else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_ExtendedRoutingInfo choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_ExtendedRoutingInfo *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_ExtendedRoutingInfo"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		routingInfo = [[UMGSMMAP_RoutingInfo alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 8) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		camelRoutingInfo = [[UMGSMMAP_CamelRoutingInfo alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"ExtendedRoutingInfo";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(routingInfo)
	{
		dict[@"routingInfo"] = routingInfo.objectValue;
	}
	if(camelRoutingInfo)
	{
		dict[@"camelRoutingInfo"] = camelRoutingInfo.objectValue;
	}
	return dict;
}



@end


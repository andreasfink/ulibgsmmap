//
//  UMGSMMAP_SystemFailureParam.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_SystemFailureParam.h"

@implementation UMGSMMAP_SystemFailureParam


@synthesize	operationName;
@synthesize	networkResource;
@synthesize	extensibleSystemFailureParam;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(networkResource)
	{
		[asn1_list addObject:networkResource];
	}
	else if(extensibleSystemFailureParam)
	{
		[asn1_list addObject:extensibleSystemFailureParam];
	}
	 else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_SystemFailureParam choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_SystemFailureParam *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_SystemFailureParam"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		networkResource = [[UMGSMMAP_NetworkResource alloc]initWithASN1Object:o context:context];
	}
	else if(o)
	{
		extensibleSystemFailureParam = [[UMGSMMAP_ExtensibleSystemFailureParam alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"SystemFailureParam";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(networkResource)
	{
		dict[@"networkResource"] = networkResource.objectValue;
	}
	if(extensibleSystemFailureParam)
	{
		dict[@"extensibleSystemFailureParam"] = extensibleSystemFailureParam.objectValue;
	}
	return dict;
}



@end


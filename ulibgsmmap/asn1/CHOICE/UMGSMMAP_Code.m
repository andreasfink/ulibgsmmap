//
//  UMGSMMAP_Code.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_Code.h"

@implementation UMGSMMAP_Code


@synthesize	operationName;
@synthesize	local;
@synthesize	global;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(local)
	{
		[asn1_list addObject:local];
	}
	else if(global)
	{
		[asn1_list addObject:global];
	}
	 else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_Code choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_Code *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_Code"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		local = [[UMASN1Integer alloc]initWithASN1Object:o context:context];
	}
	else if(o)
	{
		global = [[UMGSMMAP_OBJECT IDENTIFIER alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"Code";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(local)
	{
		dict[@"local"] = local.objectValue;
	}
	if(global)
	{
		dict[@"global"] = global.objectValue;
	}
	return dict;
}



@end


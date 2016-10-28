//
//  UMGSMMAP_Identity.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_Identity.h"

@implementation UMGSMMAP_Identity


@synthesize	operationName;
@synthesize	imsi;
@synthesize	imsi_WithLMSI;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(imsi)
	{
		[asn1_list addObject:imsi];
	}
	else if(imsi_WithLMSI)
	{
		[asn1_list addObject:imsi_WithLMSI];
	}
	 else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_Identity choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_Identity *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_Identity"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		imsi = [[UMGSMMAP_IMSI alloc]initWithASN1Object:o context:context];
	}
	else if(o)
	{
		imsi_WithLMSI = [[UMGSMMAP_IMSI_WithLMSI alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"Identity";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(imsi)
	{
		dict[@"imsi"] = imsi.objectValue;
	}
	if(imsi_WithLMSI)
	{
		dict[@"imsi-WithLMSI"] = imsi_WithLMSI.objectValue;
	}
	return dict;
}



@end


//
//  UMGSMMAP_CallBarredParam.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_CallBarredParam.h>

@implementation UMGSMMAP_CallBarredParam


@synthesize	operationName;
@synthesize	callBarringCause;
@synthesize	extensibleCallBarredParam;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(callBarringCause)
	{
		[asn1_list addObject:callBarringCause];
	}
	else if(extensibleCallBarredParam)
	{
		[asn1_list addObject:extensibleCallBarredParam];
	}
	 else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_CallBarredParam choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_CallBarredParam *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_CallBarredParam"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		callBarringCause = [[UMGSMMAP_CallBarringCause alloc]initWithASN1Object:o context:context];
	}
	else if(o)
	{
		extensibleCallBarredParam = [[UMGSMMAP_ExtensibleCallBarredParam alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"CallBarredParam";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(callBarringCause)
	{
		dict[@"callBarringCause"] = callBarringCause.objectValue;
	}
	if(extensibleCallBarredParam)
	{
		dict[@"extensibleCallBarredParam"] = extensibleCallBarredParam.objectValue;
	}
	return dict;
}



@end


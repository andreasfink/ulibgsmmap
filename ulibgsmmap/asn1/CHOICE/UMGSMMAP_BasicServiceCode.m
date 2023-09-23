//
//  UMGSMMAP_BasicServiceCode.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_BasicServiceCode.h>

@implementation UMGSMMAP_BasicServiceCode


@synthesize	operationName;
@synthesize	bearerService;
@synthesize	teleservice;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(bearerService)
	{
		bearerService.asn1_tag.tagNumber = 2;
		bearerService.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:bearerService];
	}
	else if(teleservice)
	{
		teleservice.asn1_tag.tagNumber = 3;
		teleservice.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:teleservice];
	}
	 else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_BasicServiceCode choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_BasicServiceCode *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_BasicServiceCode"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		bearerService = [[UMGSMMAP_BearerServiceCode alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		teleservice = [[UMGSMMAP_TeleserviceCode alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"BasicServiceCode";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(bearerService)
	{
		dict[@"bearerService"] = bearerService.objectValue;
	}
	if(teleservice)
	{
		dict[@"teleservice"] = teleservice.objectValue;
	}
	return dict;
}



@end


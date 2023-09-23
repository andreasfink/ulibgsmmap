//
//  UMGSMMAP_Ext_BasicServiceCode.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_Ext_BasicServiceCode.h>

@implementation UMGSMMAP_Ext_BasicServiceCode


@synthesize	operationName;
@synthesize	ext_BearerService;
@synthesize	ext_Teleservice;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(ext_BearerService)
	{
		ext_BearerService.asn1_tag.tagNumber = 2;
		ext_BearerService.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ext_BearerService];
	}
	else if(ext_Teleservice)
	{
		ext_Teleservice.asn1_tag.tagNumber = 3;
		ext_Teleservice.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ext_Teleservice];
	}
	 else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_Ext_BasicServiceCode choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_Ext_BasicServiceCode *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_Ext_BasicServiceCode"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ext_BearerService = [[UMGSMMAP_Ext_BearerServiceCode alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ext_Teleservice = [[UMGSMMAP_Ext_TeleserviceCode alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"Ext-BasicServiceCode";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(ext_BearerService)
	{
		dict[@"ext-BearerService"] = ext_BearerService.objectValue;
	}
	if(ext_Teleservice)
	{
		dict[@"ext-Teleservice"] = ext_Teleservice.objectValue;
	}
	return dict;
}



@end


//
//  UMGSMMAP_SS_SubscriptionOption.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_SS_SubscriptionOption.h"

@implementation UMGSMMAP_SS_SubscriptionOption


@synthesize	operationName;
@synthesize	cliRestrictionOption;
@synthesize	overrideCategory;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(cliRestrictionOption)
	{
		cliRestrictionOption.asn1_tag.tagNumber = 2;
		cliRestrictionOption.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:cliRestrictionOption];
	}
	else if(overrideCategory)
	{
		overrideCategory.asn1_tag.tagNumber = 1;
		overrideCategory.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:overrideCategory];
	}
	 else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_SS_SubscriptionOption choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_SS_SubscriptionOption *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_SS_SubscriptionOption"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		cliRestrictionOption = [[UMGSMMAP_CliRestrictionOption alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		overrideCategory = [[UMGSMMAP_OverrideCategory alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"SS-SubscriptionOption";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(cliRestrictionOption)
	{
		dict[@"cliRestrictionOption"] = cliRestrictionOption.objectValue;
	}
	if(overrideCategory)
	{
		dict[@"overrideCategory"] = overrideCategory.objectValue;
	}
	return dict;
}



@end


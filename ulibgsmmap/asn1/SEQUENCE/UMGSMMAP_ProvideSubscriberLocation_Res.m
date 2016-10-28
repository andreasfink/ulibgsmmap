//
//  UMGSMMAP_ProvideSubscriberLocation_Res.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_ProvideSubscriberLocation_Res.h"

@implementation UMGSMMAP_ProvideSubscriberLocation_Res


@synthesize	operationName;
@synthesize	locationEstimate;
@synthesize	ageOfLocationEstimate;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(locationEstimate)
	{
		[asn1_list addObject:locationEstimate];
	}
	if(ageOfLocationEstimate)
	{
		ageOfLocationEstimate.asn1_tag.tagNumber = 0;
		ageOfLocationEstimate.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ageOfLocationEstimate];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 1;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_ProvideSubscriberLocation_Res *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_ProvideSubscriberLocation_Res"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		locationEstimate = [[UMGSMMAP_Ext_GeographicalInformation alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ageOfLocationEstimate = [[UMGSMMAP_AgeOfLocationInformation alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
	}
	return self;
}

- (NSString *) objectName
{
	return @"ProvideSubscriberLocation-Res";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(locationEstimate)
	{
		dict[@"locationEstimate"] = locationEstimate.objectValue;
	}
	if(ageOfLocationEstimate)
	{
		dict[@"ageOfLocationEstimate"] = ageOfLocationEstimate.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	return dict;
}

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}


@end


//
//  UMGSMMAP_LocationType.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_LocationType.h>

@implementation UMGSMMAP_LocationType


@synthesize	operationName;
@synthesize	locationEstimateType;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(locationEstimateType)
	{
		locationEstimateType.asn1_tag.tagNumber = 0;
		locationEstimateType.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:locationEstimateType];
	}
}


- (UMGSMMAP_LocationType *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_LocationType"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		locationEstimateType = [[UMGSMMAP_LocationEstimateType alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
	}
	return self;
}

- (NSString *) objectName
{
	return @"LocationType";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(locationEstimateType)
	{
		dict[@"locationEstimateType"] = locationEstimateType.objectValue;
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


//
//  UMGSMMAP_DestinationNumberCriteria.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_DestinationNumberCriteria.h>

@implementation UMGSMMAP_DestinationNumberCriteria


@synthesize	operationName;
@synthesize	matchType;
@synthesize	destinationNumberList;
@synthesize	destinationNumberLengthList;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(matchType)
	{
		matchType.asn1_tag.tagNumber = 0;
		matchType.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:matchType];
	}
	if(destinationNumberList)
	{
		destinationNumberList.asn1_tag.tagNumber = 1;
		destinationNumberList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:destinationNumberList];
	}
	if(destinationNumberLengthList)
	{
		destinationNumberLengthList.asn1_tag.tagNumber = 2;
		destinationNumberLengthList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:destinationNumberLengthList];
	}
}


- (UMGSMMAP_DestinationNumberCriteria *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_DestinationNumberCriteria"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		matchType = [[UMGSMMAP_MatchType alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		destinationNumberList = [[UMGSMMAP_DestinationNumberList alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		destinationNumberLengthList = [[UMGSMMAP_DestinationNumberLengthList alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
	}
	return self;
}

- (NSString *) objectName
{
	return @"DestinationNumberCriteria";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(matchType)
	{
		dict[@"matchType"] = matchType.objectValue;
	}
	if(destinationNumberList)
	{
		dict[@"destinationNumberList"] = destinationNumberList.objectValue;
	}
	if(destinationNumberLengthList)
	{
		dict[@"destinationNumberLengthList"] = destinationNumberLengthList.objectValue;
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


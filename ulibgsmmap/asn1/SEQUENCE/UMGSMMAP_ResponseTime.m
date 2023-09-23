//
//  UMGSMMAP_ResponseTime.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_ResponseTime.h>

@implementation UMGSMMAP_ResponseTime


@synthesize	operationName;
@synthesize	responseTimeCategory;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(responseTimeCategory)
	{
		[asn1_list addObject:responseTimeCategory];
	}
}


- (UMGSMMAP_ResponseTime *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_ResponseTime"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		responseTimeCategory = [[UMGSMMAP_ResponseTimeCategory alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
	}
	return self;
}

- (NSString *) objectName
{
	return @"ResponseTime";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(responseTimeCategory)
	{
		dict[@"responseTimeCategory"] = responseTimeCategory.objectValue;
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


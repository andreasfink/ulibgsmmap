//
//  UMGSMMAP_CallBarringInfo.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_CallBarringInfo.h>

@implementation UMGSMMAP_CallBarringInfo


@synthesize	operationName;
@synthesize	ss_Code;
@synthesize	callBarringFeatureList;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(ss_Code)
	{
		[asn1_list addObject:ss_Code];
	}
	if(callBarringFeatureList)
	{
		[asn1_list addObject:callBarringFeatureList];
	}
}


- (UMGSMMAP_CallBarringInfo *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_CallBarringInfo"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		ss_Code = [[UMGSMMAP_SS_Code alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		callBarringFeatureList = [[UMGSMMAP_CallBarringFeatureList alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
	}
	return self;
}

- (NSString *) objectName
{
	return @"CallBarringInfo";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(ss_Code)
	{
		dict[@"ss-Code"] = ss_Code.objectValue;
	}
	if(callBarringFeatureList)
	{
		dict[@"callBarringFeatureList"] = callBarringFeatureList.objectValue;
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


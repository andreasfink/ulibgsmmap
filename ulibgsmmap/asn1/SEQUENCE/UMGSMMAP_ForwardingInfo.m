//
//  UMGSMMAP_ForwardingInfo.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_ForwardingInfo.h"

@implementation UMGSMMAP_ForwardingInfo


@synthesize	operationName;
@synthesize	ss_Code;
@synthesize	forwardingFeatureList;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(ss_Code)
	{
		[asn1_list addObject:ss_Code];
	}
	if(forwardingFeatureList)
	{
		[asn1_list addObject:forwardingFeatureList];
	}
}


- (UMGSMMAP_ForwardingInfo *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_ForwardingInfo"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		ss_Code = [[UMGSMMAP_SS_Code alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		forwardingFeatureList = [[UMGSMMAP_ForwardingFeatureList alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
	}
	return self;
}

- (NSString *) objectName
{
	return @"ForwardingInfo";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(ss_Code)
	{
		dict[@"ss-Code"] = ss_Code.objectValue;
	}
	if(forwardingFeatureList)
	{
		dict[@"forwardingFeatureList"] = forwardingFeatureList.objectValue;
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


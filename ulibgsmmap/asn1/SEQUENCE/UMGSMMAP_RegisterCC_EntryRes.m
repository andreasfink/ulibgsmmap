//
//  UMGSMMAP_RegisterCC_EntryRes.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_RegisterCC_EntryRes.h>

@implementation UMGSMMAP_RegisterCC_EntryRes


@synthesize	operationName;
@synthesize	ccbs_Feature;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(ccbs_Feature)
	{
		ccbs_Feature.asn1_tag.tagNumber = 0;
		ccbs_Feature.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ccbs_Feature];
	}
}


- (UMGSMMAP_RegisterCC_EntryRes *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_RegisterCC_EntryRes"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ccbs_Feature = [[UMGSMMAP_CCBS_Feature alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
	}
	return self;
}

- (NSString *) objectName
{
	return @"RegisterCC-EntryRes";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(ccbs_Feature)
	{
		dict[@"ccbs-Feature"] = ccbs_Feature.objectValue;
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


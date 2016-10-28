//
//  UMGSMMAP_EraseCC_EntryRes.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_EraseCC_EntryRes.h"

@implementation UMGSMMAP_EraseCC_EntryRes


@synthesize	operationName;
@synthesize	ss_Code;
@synthesize	ss_Status;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(ss_Code)
	{
		ss_Code.asn1_tag.tagNumber = 0;
		ss_Code.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ss_Code];
	}
	if(ss_Status)
	{
		ss_Status.asn1_tag.tagNumber = 1;
		ss_Status.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ss_Status];
	}
}


- (UMGSMMAP_EraseCC_EntryRes *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_EraseCC_EntryRes"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ss_Code = [[UMGSMMAP_SS_Code alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ss_Status = [[UMGSMMAP_SS_Status alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
	}
	return self;
}

- (NSString *) objectName
{
	return @"EraseCC-EntryRes";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(ss_Code)
	{
		dict[@"ss-Code"] = ss_Code.objectValue;
	}
	if(ss_Status)
	{
		dict[@"ss-Status"] = ss_Status.objectValue;
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


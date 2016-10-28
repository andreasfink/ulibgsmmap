//
//  UMGSMMAP_RegisterCC_EntryArg.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_RegisterCC_EntryArg.h"

@implementation UMGSMMAP_RegisterCC_EntryArg


@synthesize	operationName;
@synthesize	ss_Code;
@synthesize	ccbs_Data;


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
	if(ccbs_Data)
	{
		ccbs_Data.asn1_tag.tagNumber = 1;
		ccbs_Data.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ccbs_Data];
	}
}


- (UMGSMMAP_RegisterCC_EntryArg *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_RegisterCC_EntryArg"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ss_Code = [[UMGSMMAP_SS_Code alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ccbs_Data = [[UMGSMMAP_CCBS_Data alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
	}
	return self;
}

- (NSString *) objectName
{
	return @"RegisterCC-EntryArg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(ss_Code)
	{
		dict[@"ss-Code"] = ss_Code.objectValue;
	}
	if(ccbs_Data)
	{
		dict[@"ccbs-Data"] = ccbs_Data.objectValue;
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


//
//  UMGSMMAP_EraseCC_EntryArg.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_EraseCC_EntryArg.h"

@implementation UMGSMMAP_EraseCC_EntryArg


@synthesize	operationName;
@synthesize	ss_Code;
@synthesize	ccbs_Index;


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
	if(ccbs_Index)
	{
		ccbs_Index.asn1_tag.tagNumber = 1;
		ccbs_Index.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ccbs_Index];
	}
}


- (UMGSMMAP_EraseCC_EntryArg *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ss_Code = [[UMGSMMAP_SS_Code alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ccbs_Index = [[UMGSMMAP_CCBS_Index alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
        /* ... */
        o = [self getObjectAtPosition:p++];
    }
	return self;
}

- (NSString *) objectName
{
	return @"EraseCC-EntryArg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(ss_Code)
	{
		dict[@"ss-Code"] = ss_Code.objectValue;
	}
	if(ccbs_Index)
	{
		dict[@"ccbs-Index"] = ccbs_Index.objectValue;
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


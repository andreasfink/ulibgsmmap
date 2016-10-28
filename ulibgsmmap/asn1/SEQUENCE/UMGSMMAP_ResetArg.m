//
//  UMGSMMAP_ResetArg.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_ResetArg.h"

@implementation UMGSMMAP_ResetArg


@synthesize	operationName;
@synthesize	hlr_Number;
@synthesize	hlr_List;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(hlr_Number)
	{
		[asn1_list addObject:hlr_Number];
	}
	if(hlr_List)
	{
		[asn1_list addObject:hlr_List];
	}
}


- (UMGSMMAP_ResetArg *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_ResetArg"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		hlr_Number = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		hlr_List = [[UMGSMMAP_HLR_List alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
	}
	return self;
}

- (NSString *) objectName
{
	return @"ResetArg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(hlr_Number)
	{
		dict[@"hlr-Number"] = hlr_Number.objectValue;
	}
	if(hlr_List)
	{
		dict[@"hlr-List"] = hlr_List.objectValue;
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


//
//  UMGSMMAP_PrepareSubsequentHO_Arg.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_PrepareSubsequentHO_Arg.h"

@implementation UMGSMMAP_PrepareSubsequentHO_Arg


@synthesize	operationName;
@synthesize	targetCellId;
@synthesize	targetMSC_Number;
@synthesize	bss_APDU;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(targetCellId)
	{
		[asn1_list addObject:targetCellId];
	}
	if(targetMSC_Number)
	{
		[asn1_list addObject:targetMSC_Number];
	}
	if(bss_APDU)
	{
		[asn1_list addObject:bss_APDU];
	}
}


- (UMGSMMAP_PrepareSubsequentHO_Arg *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		targetCellId = [[UMGSMMAP_GlobalCellId alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		targetMSC_Number = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		bss_APDU = [[UMGSMMAP_ExternalSignalInfo alloc]initWithASN1Object:o context:context];
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
	return @"PrepareSubsequentHO-Arg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(targetCellId)
	{
		dict[@"targetCellId"] = targetCellId.objectValue;
	}
	if(targetMSC_Number)
	{
		dict[@"targetMSC-Number"] = targetMSC_Number.objectValue;
	}
	if(bss_APDU)
	{
		dict[@"bss-APDU"] = bss_APDU.objectValue;
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


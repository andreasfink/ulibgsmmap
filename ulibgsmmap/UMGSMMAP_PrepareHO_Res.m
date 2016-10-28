//
//  UMGSMMAP_PrepareHO_Res.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_PrepareHO_Res.h"

@implementation UMGSMMAP_PrepareHO_Res


@synthesize	operationName;
@synthesize	handoverNumber;
@synthesize	bss_APDU;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(handoverNumber)
	{
		[asn1_list addObject:handoverNumber];
	}
	if(bss_APDU)
	{
		[asn1_list addObject:bss_APDU];
	}
}


- (UMGSMMAP_PrepareHO_Res *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		handoverNumber = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
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
	return @"PrepareHO-Res";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(handoverNumber)
	{
		dict[@"handoverNumber"] = handoverNumber.objectValue;
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


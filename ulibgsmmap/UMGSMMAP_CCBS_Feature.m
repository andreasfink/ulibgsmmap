//
//  UMGSMMAP_CCBS_Feature.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_CCBS_Feature.h"

@implementation UMGSMMAP_CCBS_Feature


@synthesize	operationName;
@synthesize	ccbs_Index;
@synthesize	b_subscriberNumber;
@synthesize	b_subscriberSubaddress;
@synthesize	basicServiceGroup;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(ccbs_Index)
	{
		ccbs_Index.asn1_tag.tagNumber = 0;
		ccbs_Index.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ccbs_Index];
	}
	if(b_subscriberNumber)
	{
		b_subscriberNumber.asn1_tag.tagNumber = 1;
		b_subscriberNumber.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:b_subscriberNumber];
	}
	if(b_subscriberSubaddress)
	{
		b_subscriberSubaddress.asn1_tag.tagNumber = 2;
		b_subscriberSubaddress.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:b_subscriberSubaddress];
	}
	if(basicServiceGroup)
	{
		basicServiceGroup.asn1_tag.tagNumber = 3;
		basicServiceGroup.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:basicServiceGroup];
	}
}


- (UMGSMMAP_CCBS_Feature *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ccbs_Index = [[UMGSMMAP_CCBS_Index alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		b_subscriberNumber = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		b_subscriberSubaddress = [[UMGSMMAP_ISDN_SubaddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		basicServiceGroup = [[UMGSMMAP_BasicServiceCode alloc]initWithASN1Object:o context:context];
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
	return @"CCBS-Feature";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(ccbs_Index)
	{
		dict[@"ccbs-Index"] = ccbs_Index.objectValue;
	}
	if(b_subscriberNumber)
	{
		dict[@"b-subscriberNumber"] = b_subscriberNumber.objectValue;
	}
	if(b_subscriberSubaddress)
	{
		dict[@"b-subscriberSubaddress"] = b_subscriberSubaddress.objectValue;
	}
	if(basicServiceGroup)
	{
		dict[@"basicServiceGroup"] = basicServiceGroup.objectValue;
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


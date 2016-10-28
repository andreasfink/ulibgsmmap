//
//  UMGSMMAP_GPRSMSClass.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_GPRSMSClass.h"

@implementation UMGSMMAP_GPRSMSClass


@synthesize	operationName;
@synthesize	mSNetworkCapability;
@synthesize	mSRadioAccessCapability;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(mSNetworkCapability)
	{
		mSNetworkCapability.asn1_tag.tagNumber = 0;
		mSNetworkCapability.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:mSNetworkCapability];
	}
	if(mSRadioAccessCapability)
	{
		mSRadioAccessCapability.asn1_tag.tagNumber = 1;
		mSRadioAccessCapability.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:mSRadioAccessCapability];
	}
}


- (UMGSMMAP_GPRSMSClass *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_GPRSMSClass"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		mSNetworkCapability = [[UMGSMMAP_MSNetworkCapability alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		mSRadioAccessCapability = [[UMGSMMAP_MSRadioAccessCapability alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	return self;
}

- (NSString *) objectName
{
	return @"GPRSMSClass";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(mSNetworkCapability)
	{
		dict[@"mSNetworkCapability"] = mSNetworkCapability.objectValue;
	}
	if(mSRadioAccessCapability)
	{
		dict[@"mSRadioAccessCapability"] = mSRadioAccessCapability.objectValue;
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


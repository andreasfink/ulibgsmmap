//
//  UMGSMMAP_GPRSMSClass.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_GPRSMSClass.h>

@implementation UMGSMMAP_GPRSMSClass


@synthesize	operationName;
@synthesize	mSNetworkCapability;
@synthesize	mSRadioAccessCapability;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(mSNetworkCapability)
	{
		mSNetworkCapability.asn1_tag.tagNumber = 0;
		mSNetworkCapability.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:mSNetworkCapability];
	}
	if(mSRadioAccessCapability)
	{
		mSRadioAccessCapability.asn1_tag.tagNumber = 1;
		mSRadioAccessCapability.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:mSRadioAccessCapability];
	}
}


- (UMGSMMAP_GPRSMSClass *) processAfterDecodeWithContext:(id)context
{
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
		//o = [self getObjectAtPosition:p++];
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
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}


@end


//
//  UMGSMMAP_SS_Data.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_SS_Data.h>

@implementation UMGSMMAP_SS_Data


@synthesize	operationName;
@synthesize	ss_Code;
@synthesize	ss_Status;
@synthesize	ss_SubscriptionOption;
@synthesize	basicServiceGroupList;
@synthesize	defaultPriority;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(ss_Code)
	{
		[_asn1_list addObject:ss_Code];
	}
	if(ss_Status)
	{
		ss_Status.asn1_tag.tagNumber = 4;
		ss_Status.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:ss_Status];
	}
	if(ss_SubscriptionOption)
	{
		[_asn1_list addObject:ss_SubscriptionOption];
	}
	if(basicServiceGroupList)
	{
		[_asn1_list addObject:basicServiceGroupList];
	}
	if(defaultPriority)
	{
		[_asn1_list addObject:defaultPriority];
	}
}


- (UMGSMMAP_SS_Data *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		ss_Code = [[UMGSMMAP_SS_Code alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ss_Status = [[UMGSMMAP_SS_Status alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		ss_SubscriptionOption = [[UMGSMMAP_SS_SubscriptionOption alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		basicServiceGroupList = [[UMGSMMAP_BasicServiceGroupList alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if(o)
		{
			defaultPriority = [[UMGSMMAP_EMLPP_Priority alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
        else
        {
            o = [self getObjectAtPosition:p++];
        }
	}
	return self;
}

- (NSString *) objectName
{
	return @"SS-Data";
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
	if(ss_SubscriptionOption)
	{
		dict[@"ss-SubscriptionOption"] = ss_SubscriptionOption.objectValue;
	}
	if(basicServiceGroupList)
	{
		dict[@"basicServiceGroupList"] = basicServiceGroupList.objectValue;
	}
	if(defaultPriority)
	{
		dict[@"defaultPriority"] = defaultPriority.objectValue;
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


//
//  UMGSMMAP_GmscCamelSubscriptionInfo.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_GmscCamelSubscriptionInfo.h"

@implementation UMGSMMAP_GmscCamelSubscriptionInfo


@synthesize	operationName;
@synthesize	t_CSI;
@synthesize	o_CSI;
@synthesize	extensionContainer;
@synthesize	o_BcsmCamelTDP_CriteriaList;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(t_CSI)
	{
		t_CSI.asn1_tag.tagNumber = 0;
		t_CSI.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:t_CSI];
	}
	if(o_CSI)
	{
		o_CSI.asn1_tag.tagNumber = 1;
		o_CSI.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:o_CSI];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 2;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
	if(o_BcsmCamelTDP_CriteriaList)
	{
		o_BcsmCamelTDP_CriteriaList.asn1_tag.tagNumber = 3;
		o_BcsmCamelTDP_CriteriaList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:o_BcsmCamelTDP_CriteriaList];
	}
}


- (UMGSMMAP_GmscCamelSubscriptionInfo *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		t_CSI = [[UMGSMMAP_T_CSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		o_CSI = [[UMGSMMAP_O_CSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			o_BcsmCamelTDP_CriteriaList = [[UMGSMMAP_O_BcsmCamelTDPCriteriaList alloc]initWithASN1Object:o context:context];
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
	return @"GmscCamelSubscriptionInfo";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(t_CSI)
	{
		dict[@"t-CSI"] = t_CSI.objectValue;
	}
	if(o_CSI)
	{
		dict[@"o-CSI"] = o_CSI.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(o_BcsmCamelTDP_CriteriaList)
	{
		dict[@"o-BcsmCamelTDP-CriteriaList"] = o_BcsmCamelTDP_CriteriaList.objectValue;
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


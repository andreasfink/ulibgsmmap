//
//  UMGSMMAP_VlrCamelSubscriptionInfo.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_VlrCamelSubscriptionInfo.h"

@implementation UMGSMMAP_VlrCamelSubscriptionInfo


@synthesize	operationName;
@synthesize	o_CSI;
@synthesize	extensionContainer;
@synthesize	ss_CSI;
@synthesize	o_BcsmCamelTDP_CriteriaList;
@synthesize	tif_CSI;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(o_CSI)
	{
		o_CSI.asn1_tag.tagNumber = 0;
		o_CSI.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:o_CSI];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 1;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
	if(ss_CSI)
	{
		ss_CSI.asn1_tag.tagNumber = 2;
		ss_CSI.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ss_CSI];
	}
	if(o_BcsmCamelTDP_CriteriaList)
	{
		o_BcsmCamelTDP_CriteriaList.asn1_tag.tagNumber = 4;
		o_BcsmCamelTDP_CriteriaList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:o_BcsmCamelTDP_CriteriaList];
	}
	if(tif_CSI)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 3;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
}


- (UMGSMMAP_VlrCamelSubscriptionInfo *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		o_CSI = [[UMGSMMAP_O_CSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			ss_CSI = [[UMGSMMAP_SS_CSI alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			o_BcsmCamelTDP_CriteriaList = [[UMGSMMAP_O_BcsmCamelTDPCriteriaList alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			tif_CSI = YES;
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
	return @"VlrCamelSubscriptionInfo";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(o_CSI)
	{
		dict[@"o-CSI"] = o_CSI.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(ss_CSI)
	{
		dict[@"ss-CSI"] = ss_CSI.objectValue;
	}
	if(o_BcsmCamelTDP_CriteriaList)
	{
		dict[@"o-BcsmCamelTDP-CriteriaList"] = o_BcsmCamelTDP_CriteriaList.objectValue;
	}
	if(tif_CSI)
	{
		dict[@"tif-CSI"] = @(YES);
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


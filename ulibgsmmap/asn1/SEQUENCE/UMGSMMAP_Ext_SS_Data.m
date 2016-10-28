//
//  UMGSMMAP_Ext_SS_Data.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_Ext_SS_Data.h"

@implementation UMGSMMAP_Ext_SS_Data


@synthesize	operationName;
@synthesize	ss_Code;
@synthesize	ss_Status;
@synthesize	ss_SubscriptionOption;
@synthesize	basicServiceGroupList;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(ss_Code)
	{
		[asn1_list addObject:ss_Code];
	}
	if(ss_Status)
	{
		ss_Status.asn1_tag.tagNumber = 4;
		ss_Status.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ss_Status];
	}
	if(ss_SubscriptionOption)
	{
		[asn1_list addObject:ss_SubscriptionOption];
	}
	if(basicServiceGroupList)
	{
		[asn1_list addObject:basicServiceGroupList];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 5;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_Ext_SS_Data *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_Ext_SS_Data"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		ss_Code = [[UMGSMMAP_SS_Code alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ss_Status = [[UMGSMMAP_Ext_SS_Status alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		ss_SubscriptionOption = [[UMGSMMAP_SS_SubscriptionOption alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		basicServiceGroupList = [[UMGSMMAP_Ext_BasicServiceGroupList alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
	}
	return self;
}

- (NSString *) objectName
{
	return @"Ext-SS-Data";
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
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
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


//
//  UMGSMMAP_Ext_SS_Info.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_Ext_SS_Info.h"

@implementation UMGSMMAP_Ext_SS_Info


@synthesize	operationName;
@synthesize	forwardingInfo;
@synthesize	callBarringInfo;
@synthesize	cug_Info;
@synthesize	ss_Data;
@synthesize	emlpp_Info;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(forwardingInfo)
	{
		forwardingInfo.asn1_tag.tagNumber = 0;
		forwardingInfo.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:forwardingInfo];
	}
	else if(callBarringInfo)
	{
		callBarringInfo.asn1_tag.tagNumber = 1;
		callBarringInfo.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:callBarringInfo];
	}
	else if(cug_Info)
	{
		cug_Info.asn1_tag.tagNumber = 2;
		cug_Info.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:cug_Info];
	}
	else if(ss_Data)
	{
		ss_Data.asn1_tag.tagNumber = 3;
		ss_Data.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ss_Data];
	}
	else if(emlpp_Info)
	{
		emlpp_Info.asn1_tag.tagNumber = 4;
		emlpp_Info.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:emlpp_Info];
	}
	 else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_Ext_SS_Info choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_Ext_SS_Info *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_Ext_SS_Info"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		forwardingInfo = [[UMGSMMAP_Ext_ForwInfo alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		callBarringInfo = [[UMGSMMAP_Ext_CallBarInfo alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		cug_Info = [[UMGSMMAP_CUG_Info alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ss_Data = [[UMGSMMAP_Ext_SS_Data alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		emlpp_Info = [[UMGSMMAP_EMLPP_Info alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"Ext-SS-Info";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(forwardingInfo)
	{
		dict[@"forwardingInfo"] = forwardingInfo.objectValue;
	}
	if(callBarringInfo)
	{
		dict[@"callBarringInfo"] = callBarringInfo.objectValue;
	}
	if(cug_Info)
	{
		dict[@"cug-Info"] = cug_Info.objectValue;
	}
	if(ss_Data)
	{
		dict[@"ss-Data"] = ss_Data.objectValue;
	}
	if(emlpp_Info)
	{
		dict[@"emlpp-Info"] = emlpp_Info.objectValue;
	}
	return dict;
}



@end


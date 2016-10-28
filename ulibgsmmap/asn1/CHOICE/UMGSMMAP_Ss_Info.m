//
//  UMGSMMAP_Ss_Info.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_Ss_Info.h"

@implementation UMGSMMAP_Ss_Info


@synthesize	operationName;
@synthesize	forwardingInfo;
@synthesize	callBarringInfo;
@synthesize	ss_Data;


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
	else if(ss_Data)
	{
		ss_Data.asn1_tag.tagNumber = 3;
		ss_Data.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ss_Data];
	}
	 else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_Ss_Info choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_Ss_Info *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_Ss_Info"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		forwardingInfo = [[UMGSMMAP_ForwardingInfo alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		callBarringInfo = [[UMGSMMAP_CallBarringInfo alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ss_Data = [[UMGSMMAP_SS_Data alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"Ss-Info";
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
	if(ss_Data)
	{
		dict[@"ss-Data"] = ss_Data.objectValue;
	}
	return dict;
}



@end


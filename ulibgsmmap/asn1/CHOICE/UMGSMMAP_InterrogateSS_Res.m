//
//  UMGSMMAP_InterrogateSS_Res.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_InterrogateSS_Res.h>

@implementation UMGSMMAP_InterrogateSS_Res


@synthesize	operationName;
@synthesize	ss_Status;
@synthesize	basicServiceGroupList;
@synthesize	forwardingFeatureList;
@synthesize	genericServiceInfo;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(ss_Status)
	{
		ss_Status.asn1_tag.tagNumber = 0;
		ss_Status.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ss_Status];
	}
	else if(basicServiceGroupList)
	{
		basicServiceGroupList.asn1_tag.tagNumber = 2;
		basicServiceGroupList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:basicServiceGroupList];
	}
	else if(forwardingFeatureList)
	{
		forwardingFeatureList.asn1_tag.tagNumber = 3;
		forwardingFeatureList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:forwardingFeatureList];
	}
	else if(genericServiceInfo)
	{
		genericServiceInfo.asn1_tag.tagNumber = 4;
		genericServiceInfo.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:genericServiceInfo];
	}
	 else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_InterrogateSS_Res choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_InterrogateSS_Res *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_InterrogateSS_Res"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ss_Status = [[UMGSMMAP_SS_Status alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		basicServiceGroupList = [[UMGSMMAP_BasicServiceGroupList alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		forwardingFeatureList = [[UMGSMMAP_ForwardingFeatureList alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		genericServiceInfo = [[UMGSMMAP_GenericServiceInfo alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"InterrogateSS-Res";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(ss_Status)
	{
		dict[@"ss-Status"] = ss_Status.objectValue;
	}
	if(basicServiceGroupList)
	{
		dict[@"basicServiceGroupList"] = basicServiceGroupList.objectValue;
	}
	if(forwardingFeatureList)
	{
		dict[@"forwardingFeatureList"] = forwardingFeatureList.objectValue;
	}
	if(genericServiceInfo)
	{
		dict[@"genericServiceInfo"] = genericServiceInfo.objectValue;
	}
	return dict;
}



@end


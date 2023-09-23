//
//  UMGSMMAP_GenericServiceInfo.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_GenericServiceInfo.h>

@implementation UMGSMMAP_GenericServiceInfo


@synthesize	operationName;
@synthesize	ss_Status;
@synthesize	cliRestrictionOption;
@synthesize	maximumEntitledPriority;
@synthesize	defaultPriority;
@synthesize	ccbs_FeatureList;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(ss_Status)
	{
		[asn1_list addObject:ss_Status];
	}
	if(cliRestrictionOption)
	{
		[asn1_list addObject:cliRestrictionOption];
	}
	if(maximumEntitledPriority)
	{
		maximumEntitledPriority.asn1_tag.tagNumber = 0;
		maximumEntitledPriority.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:maximumEntitledPriority];
	}
	if(defaultPriority)
	{
		defaultPriority.asn1_tag.tagNumber = 1;
		defaultPriority.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:defaultPriority];
	}
	if(ccbs_FeatureList)
	{
		ccbs_FeatureList.asn1_tag.tagNumber = 2;
		ccbs_FeatureList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ccbs_FeatureList];
	}
}


- (UMGSMMAP_GenericServiceInfo *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_GenericServiceInfo"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		ss_Status = [[UMGSMMAP_SS_Status alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		cliRestrictionOption = [[UMGSMMAP_CliRestrictionOption alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			maximumEntitledPriority = [[UMGSMMAP_EMLPP_Priority alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			defaultPriority = [[UMGSMMAP_EMLPP_Priority alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			ccbs_FeatureList = [[UMGSMMAP_CCBS_FeatureList alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
	}
	return self;
}

- (NSString *) objectName
{
	return @"GenericServiceInfo";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(ss_Status)
	{
		dict[@"ss-Status"] = ss_Status.objectValue;
	}
	if(cliRestrictionOption)
	{
		dict[@"cliRestrictionOption"] = cliRestrictionOption.objectValue;
	}
	if(maximumEntitledPriority)
	{
		dict[@"maximumEntitledPriority"] = maximumEntitledPriority.objectValue;
	}
	if(defaultPriority)
	{
		dict[@"defaultPriority"] = defaultPriority.objectValue;
	}
	if(ccbs_FeatureList)
	{
		dict[@"ccbs-FeatureList"] = ccbs_FeatureList.objectValue;
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


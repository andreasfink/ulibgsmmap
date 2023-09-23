//
//  UMGSMMAP_GenericServiceInfo.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
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
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(ss_Status)
	{
		[_asn1_list addObject:ss_Status];
	}
	if(cliRestrictionOption)
	{
		[_asn1_list addObject:cliRestrictionOption];
	}
	if(maximumEntitledPriority)
	{
		maximumEntitledPriority.asn1_tag.tagNumber = 0;
		maximumEntitledPriority.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:maximumEntitledPriority];
	}
	if(defaultPriority)
	{
		defaultPriority.asn1_tag.tagNumber = 1;
		defaultPriority.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:defaultPriority];
	}
	if(ccbs_FeatureList)
	{
		ccbs_FeatureList.asn1_tag.tagNumber = 2;
		ccbs_FeatureList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:ccbs_FeatureList];
	}
}


- (UMGSMMAP_GenericServiceInfo *) processAfterDecodeWithContext:(id)context
{
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
        else
        {
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
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}


@end


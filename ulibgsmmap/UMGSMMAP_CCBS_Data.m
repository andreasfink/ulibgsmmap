//
//  UMGSMMAP_CCBS_Data.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_CCBS_Data.h"

@implementation UMGSMMAP_CCBS_Data


@synthesize	operationName;
@synthesize	ccbs_Feature;
@synthesize	translatedB_Number;
@synthesize	serviceIndicator;
@synthesize	callInfo;
@synthesize	networkSignalInfo;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(ccbs_Feature)
	{
		ccbs_Feature.asn1_tag.tagNumber = 0;
		ccbs_Feature.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ccbs_Feature];
	}
	if(translatedB_Number)
	{
		translatedB_Number.asn1_tag.tagNumber = 1;
		translatedB_Number.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:translatedB_Number];
	}
	if(serviceIndicator)
	{
		serviceIndicator.asn1_tag.tagNumber = 2;
		serviceIndicator.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:serviceIndicator];
	}
	if(callInfo)
	{
		callInfo.asn1_tag.tagNumber = 3;
		callInfo.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:callInfo];
	}
	if(networkSignalInfo)
	{
		networkSignalInfo.asn1_tag.tagNumber = 4;
		networkSignalInfo.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:networkSignalInfo];
	}
}


- (UMGSMMAP_CCBS_Data *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ccbs_Feature = [[UMGSMMAP_CCBS_Feature alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		translatedB_Number = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		serviceIndicator = [[UMGSMMAP_ServiceIndicator alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		callInfo = [[UMGSMMAP_ExternalSignalInfo alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		networkSignalInfo = [[UMGSMMAP_ExternalSignalInfo alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
        /* ... */
        o = [self getObjectAtPosition:p++];
    }
	return self;
}

- (NSString *) objectName
{
	return @"CCBS-Data";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(ccbs_Feature)
	{
		dict[@"ccbs-Feature"] = ccbs_Feature.objectValue;
	}
	if(translatedB_Number)
	{
		dict[@"translatedB-Number"] = translatedB_Number.objectValue;
	}
	if(serviceIndicator)
	{
		dict[@"serviceIndicator"] = serviceIndicator.objectValue;
	}
	if(callInfo)
	{
		dict[@"callInfo"] = callInfo.objectValue;
	}
	if(networkSignalInfo)
	{
		dict[@"networkSignalInfo"] = networkSignalInfo.objectValue;
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


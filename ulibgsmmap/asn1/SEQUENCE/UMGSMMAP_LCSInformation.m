//
//  UMGSMMAP_LCSInformation.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_LCSInformation.h"

@implementation UMGSMMAP_LCSInformation


@synthesize	operationName;
@synthesize	gmlc_List;
@synthesize	lcs_PrivacyExceptionList;
@synthesize	molr_List;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(gmlc_List)
	{
		gmlc_List.asn1_tag.tagNumber = 0;
		gmlc_List.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:gmlc_List];
	}
	if(lcs_PrivacyExceptionList)
	{
		lcs_PrivacyExceptionList.asn1_tag.tagNumber = 1;
		lcs_PrivacyExceptionList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:lcs_PrivacyExceptionList];
	}
	if(molr_List)
	{
		molr_List.asn1_tag.tagNumber = 2;
		molr_List.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:molr_List];
	}
}


- (UMGSMMAP_LCSInformation *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_LCSInformation"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		gmlc_List = [[UMGSMMAP_GMLC_List alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		lcs_PrivacyExceptionList = [[UMGSMMAP_LCS_PrivacyExceptionList alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		molr_List = [[UMGSMMAP_MOLR_List alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
	}
	return self;
}

- (NSString *) objectName
{
	return @"LCSInformation";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(gmlc_List)
	{
		dict[@"gmlc-List"] = gmlc_List.objectValue;
	}
	if(lcs_PrivacyExceptionList)
	{
		dict[@"lcs-PrivacyExceptionList"] = lcs_PrivacyExceptionList.objectValue;
	}
	if(molr_List)
	{
		dict[@"molr-List"] = molr_List.objectValue;
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


//
//  UMGSMMAP_DeleteSubscriberDataArg.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_DeleteSubscriberDataArg.h>

@implementation UMGSMMAP_DeleteSubscriberDataArg


@synthesize	operationName;
@synthesize	imsi;
@synthesize	basicServiceList;
@synthesize	ss_List;
@synthesize	roamingRestrictionDueToUnsupportedFeature;
@synthesize	regionalSubscriptionIdentifier;
@synthesize	vbsGroupIndication;
@synthesize	vgcsGroupIndication;
@synthesize	camelSubscriptionInfoWithdraw;
@synthesize	extensionContainer;
@synthesize	gprsSubscriptionDataWithdraw;
@synthesize	roamingRestrictedInSgsnDueToUnsuppportedFeature;
@synthesize	lsaInformationWithdraw;
@synthesize	gmlc_ListWithdraw;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(imsi)
	{
		imsi.asn1_tag.tagNumber = 0;
		imsi.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:imsi];
	}
	if(basicServiceList)
	{
		basicServiceList.asn1_tag.tagNumber = 1;
		basicServiceList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:basicServiceList];
	}
	if(ss_List)
	{
		ss_List.asn1_tag.tagNumber = 2;
		ss_List.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ss_List];
	}
	if(roamingRestrictionDueToUnsupportedFeature)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 4;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(regionalSubscriptionIdentifier)
	{
		regionalSubscriptionIdentifier.asn1_tag.tagNumber = 5;
		regionalSubscriptionIdentifier.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:regionalSubscriptionIdentifier];
	}
	if(vbsGroupIndication)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 7;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(vgcsGroupIndication)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 8;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(camelSubscriptionInfoWithdraw)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 9;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 6;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
	if(gprsSubscriptionDataWithdraw)
	{
		gprsSubscriptionDataWithdraw.asn1_tag.tagNumber = 10;
		gprsSubscriptionDataWithdraw.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:gprsSubscriptionDataWithdraw];
	}
	if(roamingRestrictedInSgsnDueToUnsuppportedFeature)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 11;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(lsaInformationWithdraw)
	{
		lsaInformationWithdraw.asn1_tag.tagNumber = 12;
		lsaInformationWithdraw.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:lsaInformationWithdraw];
	}
	if(gmlc_ListWithdraw)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 13;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
}


- (UMGSMMAP_DeleteSubscriberDataArg *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_DeleteSubscriberDataArg"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		imsi = [[UMGSMMAP_IMSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		basicServiceList = [[UMGSMMAP_BasicServiceList alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ss_List = [[UMGSMMAP_SS_List alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		roamingRestrictionDueToUnsupportedFeature = YES;
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		regionalSubscriptionIdentifier = [[UMGSMMAP_ZoneCode alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 7) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		vbsGroupIndication = YES;
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 8) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		vgcsGroupIndication = YES;
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 9) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		camelSubscriptionInfoWithdraw = YES;
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 6) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if((o) && (o.asn1_tag.tagNumber == 10) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			gprsSubscriptionDataWithdraw = [[UMGSMMAP_GPRSSubscriptionDataWithdraw alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 11) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			roamingRestrictedInSgsnDueToUnsuppportedFeature = YES;
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 12) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			lsaInformationWithdraw = [[UMGSMMAP_LSAInformationWithdraw alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 13) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			gmlc_ListWithdraw = YES;
			o = [self getObjectAtPosition:p++];
		}
	}
	return self;
}

- (NSString *) objectName
{
	return @"DeleteSubscriberDataArg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(imsi)
	{
		dict[@"imsi"] = imsi.objectValue;
	}
	if(basicServiceList)
	{
		dict[@"basicServiceList"] = basicServiceList.objectValue;
	}
	if(ss_List)
	{
		dict[@"ss-List"] = ss_List.objectValue;
	}
	if(roamingRestrictionDueToUnsupportedFeature)
	{
		dict[@"roamingRestrictionDueToUnsupportedFeature"] = @(YES);
	}
	if(regionalSubscriptionIdentifier)
	{
		dict[@"regionalSubscriptionIdentifier"] = regionalSubscriptionIdentifier.objectValue;
	}
	if(vbsGroupIndication)
	{
		dict[@"vbsGroupIndication"] = @(YES);
	}
	if(vgcsGroupIndication)
	{
		dict[@"vgcsGroupIndication"] = @(YES);
	}
	if(camelSubscriptionInfoWithdraw)
	{
		dict[@"camelSubscriptionInfoWithdraw"] = @(YES);
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(gprsSubscriptionDataWithdraw)
	{
		dict[@"gprsSubscriptionDataWithdraw"] = gprsSubscriptionDataWithdraw.objectValue;
	}
	if(roamingRestrictedInSgsnDueToUnsuppportedFeature)
	{
		dict[@"roamingRestrictedInSgsnDueToUnsuppportedFeature"] = @(YES);
	}
	if(lsaInformationWithdraw)
	{
		dict[@"lsaInformationWithdraw"] = lsaInformationWithdraw.objectValue;
	}
	if(gmlc_ListWithdraw)
	{
		dict[@"gmlc-ListWithdraw"] = @(YES);
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


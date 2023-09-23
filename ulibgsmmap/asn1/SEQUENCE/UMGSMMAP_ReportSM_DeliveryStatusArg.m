//
//  UMGSMMAP_ReportSM_DeliveryStatusArg.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_ReportSM_DeliveryStatusArg.h>

@implementation UMGSMMAP_ReportSM_DeliveryStatusArg


@synthesize	operationName;
@synthesize	msisdn;
@synthesize	serviceCentreAddress;
@synthesize	sm_DeliveryOutcome;
@synthesize	absentSubscriberDiagnosticSM;
@synthesize	extensionContainer;
@synthesize	gprsSupportIndicator;
@synthesize	deliveryOutcomeIndicator;
@synthesize	additionalSM_DeliveryOutcome;
@synthesize	additionalAbsentSubscriberDiagnosticSM;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(msisdn)
	{
		[asn1_list addObject:msisdn];
	}
	if(serviceCentreAddress)
	{
		[asn1_list addObject:serviceCentreAddress];
	}
	if(sm_DeliveryOutcome)
	{
		[asn1_list addObject:sm_DeliveryOutcome];
	}
	if(absentSubscriberDiagnosticSM)
	{
		absentSubscriberDiagnosticSM.asn1_tag.tagNumber = 0;
		absentSubscriberDiagnosticSM.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:absentSubscriberDiagnosticSM];
	}
	if(extensionContainer)
	{
		[asn1_list addObject:extensionContainer];
	}
	if(gprsSupportIndicator)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 2;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(deliveryOutcomeIndicator)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 3;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(additionalSM_DeliveryOutcome)
	{
		additionalSM_DeliveryOutcome.asn1_tag.tagNumber = 4;
		additionalSM_DeliveryOutcome.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:additionalSM_DeliveryOutcome];
	}
	if(additionalAbsentSubscriberDiagnosticSM)
	{
		additionalAbsentSubscriberDiagnosticSM.asn1_tag.tagNumber = 5;
		additionalAbsentSubscriberDiagnosticSM.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:additionalAbsentSubscriberDiagnosticSM];
	}
}


- (UMGSMMAP_ReportSM_DeliveryStatusArg *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_ReportSM_DeliveryStatusArg"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		msisdn = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		serviceCentreAddress = [[UMGSMMAP_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		sm_DeliveryOutcome = [[UMGSMMAP_SM_DeliveryOutcome alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		absentSubscriberDiagnosticSM = [[UMGSMMAP_AbsentSubscriberDiagnosticSM alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			gprsSupportIndicator = YES;
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			deliveryOutcomeIndicator = YES;
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			additionalSM_DeliveryOutcome = [[UMGSMMAP_SM_DeliveryOutcome alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			additionalAbsentSubscriberDiagnosticSM = [[UMGSMMAP_AbsentSubscriberDiagnosticSM alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
	}
	return self;
}

- (NSString *) objectName
{
	return @"ReportSM-DeliveryStatusArg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(msisdn)
	{
		dict[@"msisdn"] = msisdn.objectValue;
	}
	if(serviceCentreAddress)
	{
		dict[@"serviceCentreAddress"] = serviceCentreAddress.objectValue;
	}
	if(sm_DeliveryOutcome)
	{
		dict[@"sm-DeliveryOutcome"] = sm_DeliveryOutcome.objectValue;
	}
	if(absentSubscriberDiagnosticSM)
	{
		dict[@"absentSubscriberDiagnosticSM"] = absentSubscriberDiagnosticSM.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(gprsSupportIndicator)
	{
		dict[@"gprsSupportIndicator"] = @(YES);
	}
	if(deliveryOutcomeIndicator)
	{
		dict[@"deliveryOutcomeIndicator"] = @(YES);
	}
	if(additionalSM_DeliveryOutcome)
	{
		dict[@"additionalSM-DeliveryOutcome"] = additionalSM_DeliveryOutcome.objectValue;
	}
	if(additionalAbsentSubscriberDiagnosticSM)
	{
		dict[@"additionalAbsentSubscriberDiagnosticSM"] = additionalAbsentSubscriberDiagnosticSM.objectValue;
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


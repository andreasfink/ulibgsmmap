//
//  UMGSMMAP_ReportSM_DeliveryStatusArg.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_ReportSM_DeliveryStatusArg.h>

@implementation UMGSMMAP_ReportSM_DeliveryStatusArg

@synthesize	operationName;

- (void) processBeforeEncode
{
    [super processBeforeEncode];
    [_asn1_tag setTagIsConstructed];
    _asn1_list = [[NSMutableArray alloc]init];
    if(_msisdn == NULL)
    {
        _msisdn = [[UMGSMMAP_ISDN_AddressString alloc]init];
    }
    [_asn1_list addObject:_msisdn];
    if(_serviceCentreAddress ==NULL)
    {
        _serviceCentreAddress = [[UMGSMMAP_AddressString alloc]initWithString:@"+"];
    }
    [_asn1_list addObject:_serviceCentreAddress];
    if(_sm_DeliveryOutcome)
    {
        [_asn1_list addObject:_sm_DeliveryOutcome];
    }
    if(_absentSubscriberDiagnosticSM)
	{
		_absentSubscriberDiagnosticSM.asn1_tag.tagNumber = 0;
		_absentSubscriberDiagnosticSM.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:_absentSubscriberDiagnosticSM];
	}
	if(_extensionContainer)
	{
		[_asn1_list addObject:_extensionContainer];
	}
	if(_gprsSupportIndicator)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 2;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:n];
	}
	if(_deliveryOutcomeIndicator)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 3;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:n];
	}
	if(_additionalSM_DeliveryOutcome)
	{
		_additionalSM_DeliveryOutcome.asn1_tag.tagNumber = 4;
		_additionalSM_DeliveryOutcome.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:_additionalSM_DeliveryOutcome];
	}
	if(_additionalAbsentSubscriberDiagnosticSM)
	{
		_additionalAbsentSubscriberDiagnosticSM.asn1_tag.tagNumber = 5;
		_additionalAbsentSubscriberDiagnosticSM.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:_additionalAbsentSubscriberDiagnosticSM];
	}
}


- (UMGSMMAP_ReportSM_DeliveryStatusArg *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
        _msisdn = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		_serviceCentreAddress = [[UMGSMMAP_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		_sm_DeliveryOutcome = [[UMGSMMAP_SM_DeliveryOutcome alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		_absentSubscriberDiagnosticSM = [[UMGSMMAP_AbsentSubscriberDiagnosticSM alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		_extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			_gprsSupportIndicator = YES;
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			_deliveryOutcomeIndicator = YES;
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			_additionalSM_DeliveryOutcome = [[UMGSMMAP_SM_DeliveryOutcome alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			_additionalAbsentSubscriberDiagnosticSM = [[UMGSMMAP_AbsentSubscriberDiagnosticSM alloc]initWithASN1Object:o context:context];
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
	return @"ReportSM-DeliveryStatusArg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(_msisdn)
	{
		dict[@"msisdn"] = _msisdn.objectValue;
	}
	if(_serviceCentreAddress)
	{
		dict[@"serviceCentreAddress"] = _serviceCentreAddress.objectValue;
	}
	if(_sm_DeliveryOutcome)
	{
		dict[@"sm-DeliveryOutcome"] = _sm_DeliveryOutcome.objectValue;
	}
	if(_absentSubscriberDiagnosticSM)
	{
		dict[@"absentSubscriberDiagnosticSM"] = _absentSubscriberDiagnosticSM.objectValue;
	}
	if(_extensionContainer)
	{
		dict[@"extensionContainer"] = _extensionContainer.objectValue;
	}
	if(_gprsSupportIndicator)
	{
		dict[@"_gprsSupportIndicator"] = @(YES);
	}
	if(_deliveryOutcomeIndicator)
	{
		dict[@"deliveryOutcomeIndicator"] = @(YES);
	}
	if(_additionalSM_DeliveryOutcome)
	{
        dict[@"additionalSM-DeliveryOutcome"] = _additionalSM_DeliveryOutcome.objectValue;
	}
	if(_additionalAbsentSubscriberDiagnosticSM)
	{
		dict[@"additionalAbsentSubscriberDiagnosticSM"] = _additionalAbsentSubscriberDiagnosticSM.objectValue;
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


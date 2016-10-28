//
//  UMGSMMAP_SM_RP_DA.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_SM_RP_DA.h"

@implementation UMGSMMAP_SM_RP_DA


@synthesize	operationName;
@synthesize	imsi;
@synthesize	lmsi;
@synthesize	serviceCentreAddressDA;
@synthesize	noSM_RP_DA;


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
	else if(lmsi)
	{
		lmsi.asn1_tag.tagNumber = 1;
		lmsi.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:lmsi];
	}
	else if(serviceCentreAddressDA)
	{
		serviceCentreAddressDA.asn1_tag.tagNumber = 4;
		serviceCentreAddressDA.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:serviceCentreAddressDA];
	}
	else if(noSM_RP_DA)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 5;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	 else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_SM_RP_DA choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_SM_RP_DA *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_SM_RP_DA"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		imsi = [[UMGSMMAP_IMSI alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		lmsi = [[UMGSMMAP_LMSI alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		serviceCentreAddressDA = [[UMGSMMAP_AddressString alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		noSM_RP_DA = YES;
	}
	return self;
}

- (NSString *) objectName
{
	return @"SM-RP-DA";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(imsi)
	{
		dict[@"imsi"] = imsi.objectValue;
	}
	if(lmsi)
	{
		dict[@"lmsi"] = lmsi.objectValue;
	}
	if(serviceCentreAddressDA)
	{
		dict[@"serviceCentreAddressDA"] = serviceCentreAddressDA.objectValue;
	}
	if(noSM_RP_DA)
	{
		dict[@"noSM-RP-DA"] = @(YES);
	}
	return dict;
}



@end


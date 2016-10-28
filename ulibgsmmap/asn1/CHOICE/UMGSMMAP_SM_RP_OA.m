//
//  UMGSMMAP_SM_RP_OA.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_SM_RP_OA.h"

@implementation UMGSMMAP_SM_RP_OA


@synthesize	operationName;
@synthesize	msisdn;
@synthesize	serviceCentreAddressOA;
@synthesize	noSM_RP_OA;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(msisdn)
	{
		msisdn.asn1_tag.tagNumber = 2;
		msisdn.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:msisdn];
	}
	else if(serviceCentreAddressOA)
	{
		serviceCentreAddressOA.asn1_tag.tagNumber = 4;
		serviceCentreAddressOA.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:serviceCentreAddressOA];
	}
	else if(noSM_RP_OA)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 5;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	 else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_SM_RP_OA choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_SM_RP_OA *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_SM_RP_OA"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		msisdn = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		serviceCentreAddressOA = [[UMGSMMAP_AddressString alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		noSM_RP_OA = YES;
	}
	return self;
}

- (NSString *) objectName
{
	return @"SM-RP-OA";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(msisdn)
	{
		dict[@"msisdn"] = msisdn.objectValue;
	}
	if(serviceCentreAddressOA)
	{
		dict[@"serviceCentreAddressOA"] = serviceCentreAddressOA.objectValue;
	}
	if(noSM_RP_OA)
	{
		dict[@"noSM-RP-OA"] = @(YES);
	}
	return dict;
}



@end


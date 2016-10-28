//
//  UMGSMMAP_RoutingInfoForSM_Arg.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_RoutingInfoForSM_Arg.h"

@implementation UMGSMMAP_RoutingInfoForSM_Arg


@synthesize	operationName;
@synthesize	msisdn;
@synthesize	sm_RP_PRI;
@synthesize	serviceCentreAddress;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(msisdn)
	{
		msisdn.asn1_tag.tagNumber = 0;
		msisdn.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:msisdn];
	}
	if(sm_RP_PRI)
	{
		sm_RP_PRI.asn1_tag.tagNumber = 1;
		sm_RP_PRI.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:sm_RP_PRI];
	}
	if(serviceCentreAddress)
	{
		serviceCentreAddress.asn1_tag.tagNumber = 2;
		serviceCentreAddress.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:serviceCentreAddress];
	}
}


- (UMGSMMAP_RoutingInfoForSM_Arg *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_RoutingInfoForSM_Arg"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		msisdn = [[UMASN1OctetString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		sm_RP_PRI = [[UMASN1Boolean alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		serviceCentreAddress = [[UMASN1OctetString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
	}
	return self;
}

- (NSString *) objectName
{
	return @"RoutingInfoForSM-Arg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(msisdn)
	{
		dict[@"msisdn"] = msisdn.objectValue;
	}
	if(sm_RP_PRI)
	{
		dict[@"sm-RP-PRI"] = sm_RP_PRI.objectValue;
	}
	if(serviceCentreAddress)
	{
		dict[@"serviceCentreAddress"] = serviceCentreAddress.objectValue;
	}
	return dict;
}



@end


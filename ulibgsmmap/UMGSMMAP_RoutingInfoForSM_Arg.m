//
//  UMGSMMAP_RoutingInfoForSM_Arg.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_RoutingInfoForSM_Arg.h"

@implementation UMGSMMAP_RoutingInfoForSM_Arg


@synthesize	operationName;
@synthesize	msisdn;
@synthesize	sm_RP_PRI;
@synthesize	serviceCentreAddress;
@synthesize	extensionContainer;
@synthesize	gprsSupportIndicator;
@synthesize	sm_RP_MTI;
@synthesize	sm_RP_SMEA;


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
	if(sm_RP_PRI == NULL) /* mandatory */
	{
        sm_RP_PRI =  [[UMASN1Boolean alloc]initAsNo];
    }
    sm_RP_PRI.asn1_tag.tagNumber = 1;
    sm_RP_PRI.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
    [asn1_list addObject:sm_RP_PRI];

	if(serviceCentreAddress)
	{
		serviceCentreAddress.asn1_tag.tagNumber = 2;
		serviceCentreAddress.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:serviceCentreAddress];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 6;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
	if(gprsSupportIndicator)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 7;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(sm_RP_MTI)
	{
		sm_RP_MTI.asn1_tag.tagNumber = 8;
		sm_RP_MTI.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:sm_RP_MTI];
	}
	if(sm_RP_SMEA)
	{
		sm_RP_SMEA.asn1_tag.tagNumber = 9;
		sm_RP_SMEA.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:sm_RP_SMEA];
	}
}


- (UMGSMMAP_RoutingInfoForSM_Arg *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		msisdn = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		sm_RP_PRI = [[UMASN1Boolean alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		serviceCentreAddress = [[UMGSMMAP_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 6) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 7) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		gprsSupportIndicator = YES;
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 8) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		sm_RP_MTI = [[UMGSMMAP_SM_RP_MTI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 9) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		sm_RP_SMEA = [[UMGSMMAP_SM_RP_SMEA alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
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
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(gprsSupportIndicator)
	{
		dict[@"gprsSupportIndicator"] = @(YES);
	}
	if(sm_RP_MTI)
	{
		dict[@"sm-RP-MTI"] = sm_RP_MTI.objectValue;
	}
	if(sm_RP_SMEA)
	{
		dict[@"sm-RP-SMEA"] = sm_RP_SMEA.objectValue;
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


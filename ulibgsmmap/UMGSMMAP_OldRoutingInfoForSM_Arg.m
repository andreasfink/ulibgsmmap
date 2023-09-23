//
//  UMGSMMAP_OldRoutingInfoForSM_Arg.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_OldRoutingInfoForSM_Arg.h>

@implementation UMGSMMAP_OldRoutingInfoForSM_Arg


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
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(msisdn)
	{
		msisdn.asn1_tag.tagNumber = 0;
		msisdn.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:msisdn];
	}
	if(sm_RP_PRI)
	{
		sm_RP_PRI.asn1_tag.tagNumber = 1;
		sm_RP_PRI.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:sm_RP_PRI];
	}
	if(serviceCentreAddress)
	{
		serviceCentreAddress.asn1_tag.tagNumber = 2;
		serviceCentreAddress.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:serviceCentreAddress];
	}
	if(extensionContainer)
	{
		[_asn1_list addObject:extensionContainer];
	}
	if(gprsSupportIndicator)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 7;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:n];
	}
	if(sm_RP_MTI)
	{
		sm_RP_MTI.asn1_tag.tagNumber = 8;
		sm_RP_MTI.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:sm_RP_MTI];
	}
	if(sm_RP_SMEA)
	{
		sm_RP_SMEA.asn1_tag.tagNumber = 9;
		sm_RP_SMEA.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:sm_RP_SMEA];
	}
}


- (UMGSMMAP_OldRoutingInfoForSM_Arg *) processAfterDecodeWithContext:(id)context
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
	if(o)
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if((o) && (o.asn1_tag.tagNumber == 7) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			gprsSupportIndicator = YES;
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 8) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			sm_RP_MTI = [[UMGSMMAP_SM_RP_MTI alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 9) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			sm_RP_SMEA = [[UMGSMMAP_SM_RP_SMEA alloc]initWithASN1Object:o context:context];
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
	return @"OldRoutingInfoForSM-Arg";
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
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}


@end


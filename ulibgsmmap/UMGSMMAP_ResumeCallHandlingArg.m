//
//  UMGSMMAP_ResumeCallHandlingArg.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_ResumeCallHandlingArg.h"

@implementation UMGSMMAP_ResumeCallHandlingArg


@synthesize	operationName;
@synthesize	callReferenceNumber;
@synthesize	basicServiceGroup;
@synthesize	forwardingData;
@synthesize	imsi;
@synthesize	cug_CheckInfo;
@synthesize	o_CSI;
@synthesize	extensionContainer;
@synthesize	ccbs_Possible;
@synthesize	msisdn;
@synthesize	uu_Data;
@synthesize	allInformationSent;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(callReferenceNumber)
	{
		callReferenceNumber.asn1_tag.tagNumber = 0;
		callReferenceNumber.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:callReferenceNumber];
	}
	if(basicServiceGroup)
	{
		basicServiceGroup.asn1_tag.tagNumber = 1;
		basicServiceGroup.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:basicServiceGroup];
	}
	if(forwardingData)
	{
		forwardingData.asn1_tag.tagNumber = 2;
		forwardingData.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:forwardingData];
	}
	if(imsi)
	{
		imsi.asn1_tag.tagNumber = 3;
		imsi.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:imsi];
	}
	if(cug_CheckInfo)
	{
		cug_CheckInfo.asn1_tag.tagNumber = 4;
		cug_CheckInfo.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:cug_CheckInfo];
	}
	if(o_CSI)
	{
		o_CSI.asn1_tag.tagNumber = 5;
		o_CSI.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:o_CSI];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 7;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
	if(ccbs_Possible)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 8;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(msisdn)
	{
		msisdn.asn1_tag.tagNumber = 9;
		msisdn.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:msisdn];
	}
	if(uu_Data)
	{
		uu_Data.asn1_tag.tagNumber = 10;
		uu_Data.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:uu_Data];
	}
	if(allInformationSent)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 11;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
}


- (UMGSMMAP_ResumeCallHandlingArg *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		callReferenceNumber = [[UMGSMMAP_CallReferenceNumber alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		basicServiceGroup = [[UMGSMMAP_Ext_BasicServiceCode alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		forwardingData = [[UMGSMMAP_ForwardingData alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		imsi = [[UMGSMMAP_IMSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		cug_CheckInfo = [[UMGSMMAP_CUG_CheckInfo alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		o_CSI = [[UMGSMMAP_O_CSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 7) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 8) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ccbs_Possible = YES;
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 9) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		msisdn = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 10) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		uu_Data = [[UMGSMMAP_UU_Data alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 11) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		allInformationSent = YES;
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
	return @"ResumeCallHandlingArg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(callReferenceNumber)
	{
		dict[@"callReferenceNumber"] = callReferenceNumber.objectValue;
	}
	if(basicServiceGroup)
	{
		dict[@"basicServiceGroup"] = basicServiceGroup.objectValue;
	}
	if(forwardingData)
	{
		dict[@"forwardingData"] = forwardingData.objectValue;
	}
	if(imsi)
	{
		dict[@"imsi"] = imsi.objectValue;
	}
	if(cug_CheckInfo)
	{
		dict[@"cug-CheckInfo"] = cug_CheckInfo.objectValue;
	}
	if(o_CSI)
	{
		dict[@"o-CSI"] = o_CSI.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(ccbs_Possible)
	{
		dict[@"ccbs-Possible"] = @(YES);
	}
	if(msisdn)
	{
		dict[@"msisdn"] = msisdn.objectValue;
	}
	if(uu_Data)
	{
		dict[@"uu-Data"] = uu_Data.objectValue;
	}
	if(allInformationSent)
	{
		dict[@"allInformationSent"] = @(YES);
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


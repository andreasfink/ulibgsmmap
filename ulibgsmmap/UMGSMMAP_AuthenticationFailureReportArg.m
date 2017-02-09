//
//  UMGSMMAP_AuthenticationFailureReportArg.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_AuthenticationFailureReportArg.h"

@implementation UMGSMMAP_AuthenticationFailureReportArg


@synthesize	operationName;
@synthesize	imsi;
@synthesize	failureCause;
@synthesize	extensionContainer;
@synthesize	re_attempt;
@synthesize	accessType;
@synthesize	rand;
@synthesize	vlr_Number;
@synthesize	sgsn_Number;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(imsi)
	{
		[asn1_list addObject:imsi];
	}
	if(failureCause)
	{
		[asn1_list addObject:failureCause];
	}
	if(extensionContainer)
	{
		[asn1_list addObject:extensionContainer];
	}
	if(re_attempt)
	{
		[asn1_list addObject:re_attempt];
	}
	if(accessType)
	{
		[asn1_list addObject:accessType];
	}
	if(rand)
	{
		[asn1_list addObject:rand];
	}
	if(vlr_Number)
	{
		vlr_Number.asn1_tag.tagNumber = 0;
		vlr_Number.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:vlr_Number];
	}
	if(sgsn_Number)
	{
		sgsn_Number.asn1_tag.tagNumber = 1;
		sgsn_Number.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:sgsn_Number];
	}
}


- (UMGSMMAP_AuthenticationFailureReportArg *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		imsi = [[UMGSMMAP_IMSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		failureCause = [[UMASN1Boolean alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if(o)
		{
			re_attempt = [[UMASN1Boolean alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if(o)
		{
			accessType = [[UMASN1Boolean alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if(o)
		{
			rand = [[UMGSMMAP_RAND alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			vlr_Number = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			sgsn_Number = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
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
	return @"AuthenticationFailureReportArg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(imsi)
	{
		dict[@"imsi"] = imsi.objectValue;
	}
	if(failureCause)
	{
		dict[@"failureCause"] = failureCause.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(re_attempt)
	{
		dict[@"re-attempt"] = re_attempt.objectValue;
	}
	if(accessType)
	{
		dict[@"accessType"] = accessType.objectValue;
	}
	if(rand)
	{
		dict[@"rand"] = rand.objectValue;
	}
	if(vlr_Number)
	{
		dict[@"vlr-Number"] = vlr_Number.objectValue;
	}
	if(sgsn_Number)
	{
		dict[@"sgsn-Number"] = sgsn_Number.objectValue;
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


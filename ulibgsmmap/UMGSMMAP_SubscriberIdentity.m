//
//  UMGSMMAP_SubscriberIdentity.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_SubscriberIdentity.h"

@implementation UMGSMMAP_SubscriberIdentity


@synthesize	operationName;
@synthesize	imsi;
@synthesize	msisdn;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	BOOL isImplicit = YES;
	if(self.asn1_tag.tagClass == UMASN1Class_ContextSpecific)
	{
		isImplicit = NO;
		_asn1_tag.isConstructed=YES;
		_asn1_list = [[NSMutableArray alloc]init];
	}
	if(imsi)
	{
		[imsi processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 0;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = imsi.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [imsi.asn1_list copy];
			}
			else
			{
				self.asn1_data = [imsi.asn1_data copy];
			}
		}
		else
		{
			imsi.asn1_tag.tagNumber = 0;
			imsi.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:imsi];
		}
	}
	else if(msisdn)
	{
		[msisdn processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 1;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = msisdn.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [msisdn.asn1_list copy];
			}
			else
			{
				self.asn1_data = [msisdn.asn1_data copy];
			}
		}
		else
		{
			msisdn.asn1_tag.tagNumber = 1;
			msisdn.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:msisdn];
		}
	}
	else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_SubscriberIdentity choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_SubscriberIdentity *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o;
	BOOL isImplicit = YES;
	if(self.asn1_tag.tagClass == UMASN1Class_ContextSpecific)
	{
		isImplicit = NO;
		o = [self getObjectAtPosition:p++];
	}
	else
	{
		o = self;
	}
	
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		imsi = [[UMGSMMAP_IMSI alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		msisdn = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"SubscriberIdentity";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(imsi)
	{
		dict[@"imsi"] = imsi.objectValue;
	}
	if(msisdn)
	{
		dict[@"msisdn"] = msisdn.objectValue;
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


//
//  UMGSMMAP_CurrentSecurityContext.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_CurrentSecurityContext.h"

@implementation UMGSMMAP_CurrentSecurityContext


@synthesize	operationName;
@synthesize	gsm_SecurityContextData;
@synthesize	umts_SecurityContextData;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	BOOL isImplicit = YES;
	if(self.asn1_tag.tagClass == UMASN1Class_ContextSpecific)
	{
		isImplicit = NO;
		asn1_tag.isConstructed=YES;
		asn1_list = [[NSMutableArray alloc]init];
	}
	if(gsm_SecurityContextData)
	{
		[gsm_SecurityContextData processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 0;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = gsm_SecurityContextData.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [gsm_SecurityContextData.asn1_list copy];
			}
			else
			{
				self.asn1_data = [gsm_SecurityContextData.asn1_data copy];
			}
		}
		else
		{
			gsm_SecurityContextData.asn1_tag.tagNumber = 0;
			gsm_SecurityContextData.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[asn1_list addObject:gsm_SecurityContextData];
		}
	}
	else if(umts_SecurityContextData)
	{
		[umts_SecurityContextData processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 1;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = umts_SecurityContextData.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [umts_SecurityContextData.asn1_list copy];
			}
			else
			{
				self.asn1_data = [umts_SecurityContextData.asn1_data copy];
			}
		}
		else
		{
			umts_SecurityContextData.asn1_tag.tagNumber = 1;
			umts_SecurityContextData.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[asn1_list addObject:umts_SecurityContextData];
		}
	}
	else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_CurrentSecurityContext choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_CurrentSecurityContext *) processAfterDecodeWithContext:(id)context
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
		gsm_SecurityContextData = [[UMGSMMAP_GSM_SecurityContextData alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		umts_SecurityContextData = [[UMGSMMAP_UMTS_SecurityContextData alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"CurrentSecurityContext";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(gsm_SecurityContextData)
	{
		dict[@"gsm-SecurityContextData"] = gsm_SecurityContextData.objectValue;
	}
	if(umts_SecurityContextData)
	{
		dict[@"umts-SecurityContextData"] = umts_SecurityContextData.objectValue;
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


//
//  UMGSMMAP_SM_RP_OA.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
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
	BOOL isImplicit = YES;
	if(encodingType == UMASN1EncodingType_implicitlyEncoded)
	{
	    isImplicit = YES;
	}
	else if(encodingType == UMASN1EncodingType_explicitlyEncoded)
	{
	    isImplicit = NO;
	}
	else
	{
		if(self.asn1_tag.tagClass == UMASN1Class_ContextSpecific)
		{
			isImplicit = NO;
			encodingType = UMASN1EncodingType_explicitlyEncoded;
		}
		else
		{
			isImplicit = YES;
			encodingType = UMASN1EncodingType_implicitlyEncoded;
		}
	}
	if(isImplicit)
	{
		asn1_tag.isConstructed=YES;
		asn1_list = [[NSMutableArray alloc]init];
	}
	if(msisdn)
	{
		[msisdn processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 2;
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
			msisdn.asn1_tag.tagNumber = 2;
			msisdn.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[asn1_list addObject:msisdn];
		}
	}
	else if(serviceCentreAddressOA)
	{
		[serviceCentreAddressOA processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 4;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = serviceCentreAddressOA.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [serviceCentreAddressOA.asn1_list copy];
			}
			else
			{
				self.asn1_data = [serviceCentreAddressOA.asn1_data copy];
			}
		}
		else
		{
			serviceCentreAddressOA.asn1_tag.tagNumber = 4;
			serviceCentreAddressOA.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[asn1_list addObject:serviceCentreAddressOA];
		}
	}
	else if(noSM_RP_OA)
	{
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 5;
			self.asn1_tag.tagClass = UMASN1Class_Universal;
			self.asn1_tag.isConstructed = NO;
			self.asn1_data = [NSData data];
			self.asn1_list = NULL;
		}
		else
		{
			UMASN1Null *n = [[UMASN1Null alloc]init];
			n.asn1_tag.tagNumber = 5;
			n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[asn1_list addObject:n];
		}
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
	int p=0;
    UMASN1Object *o;
	BOOL isImplicit = YES;
	if(encodingType == UMASN1EncodingType_implicitlyEncoded)
	{
	    isImplicit = YES;
	}
	else if(encodingType == UMASN1EncodingType_explicitlyEncoded)
	{
	    isImplicit = NO;
	}
	else
	{
	    if(self.asn1_tag.tagClass == UMASN1Class_ContextSpecific)
	    {
	        isImplicit = NO;
	        encodingType = UMASN1EncodingType_explicitlyEncoded;
	    }
	    else
	    {
	        isImplicit = YES;
	        encodingType = UMASN1EncodingType_implicitlyEncoded;
	    }
	}
	if(isImplicit)
	{
        o = self;
	}
	else
	{
        o = [self getObjectAtPosition:p++];
	}
	
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
        //UMASN1Object *o2 = [o getObjectAtPosition:0];
		msisdn = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
        //UMASN1Object *o2 = [o getObjectAtPosition:0];
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

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}


@end


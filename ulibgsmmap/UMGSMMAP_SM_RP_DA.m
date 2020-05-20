//
//  UMGSMMAP_SM_RP_DA.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
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
	BOOL isImplicit = YES;
	if(_encodingType == UMASN1EncodingType_implicitlyEncoded)
	{
	    isImplicit = YES;
	}
	else if(_encodingType == UMASN1EncodingType_explicitlyEncoded)
	{
	    isImplicit = NO;
	}
	else
	{
		if(self.asn1_tag.tagClass == UMASN1Class_ContextSpecific)
		{
			isImplicit = NO;
			_encodingType = UMASN1EncodingType_explicitlyEncoded;
		}
		else
		{
			isImplicit = YES;
			_encodingType = UMASN1EncodingType_implicitlyEncoded;
		}
	}
	if(isImplicit)
	{
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
	else if(lmsi)
	{
		[lmsi processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 1;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = lmsi.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [lmsi.asn1_list copy];
			}
			else
			{
				self.asn1_data = [lmsi.asn1_data copy];
			}
		}
		else
		{
			lmsi.asn1_tag.tagNumber = 1;
			lmsi.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:lmsi];
		}
	}
	else if(serviceCentreAddressDA)
	{
		[serviceCentreAddressDA processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 4;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = serviceCentreAddressDA.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [serviceCentreAddressDA.asn1_list copy];
			}
			else
			{
				self.asn1_data = [serviceCentreAddressDA.asn1_data copy];
			}
		}
		else
		{
			serviceCentreAddressDA.asn1_tag.tagNumber = 4;
			serviceCentreAddressDA.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:serviceCentreAddressDA];
		}
	}
	else if(noSM_RP_DA)
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
			[_asn1_list addObject:n];
		}
	}
	else
	{
        NSLog(@"UMGSMMAP_SM_RP_DA choice missing");
	}
}


- (UMGSMMAP_SM_RP_DA *) processAfterDecodeWithContext:(id)context
{
	int p=0;
    UMASN1Object *o;
	BOOL isImplicit = YES;
	if(_encodingType == UMASN1EncodingType_implicitlyEncoded)
	{
	    isImplicit = YES;
	}
	else if(_encodingType == UMASN1EncodingType_explicitlyEncoded)
	{
	    isImplicit = NO;
	}
	else
	{
	    if(self.asn1_tag.tagClass == UMASN1Class_ContextSpecific)
	    {
	        isImplicit = NO;
	        _encodingType = UMASN1EncodingType_explicitlyEncoded;
	    }
	    else
	    {
	        isImplicit = YES;
	        _encodingType = UMASN1EncodingType_implicitlyEncoded;
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

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}


@end


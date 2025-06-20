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
#import <ulibgsmmap/UMGSMMAP_SM_RP_DA.h>

@implementation UMGSMMAP_SM_RP_DA


@synthesize	operationName;

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
	if(_imsi)
	{
		[_imsi processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 0;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed =_imsi.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [_imsi.asn1_list copy];
			}
			else
			{
				self.asn1_data = [_imsi.asn1_data copy];
			}
		}
		else
		{
			_imsi.asn1_tag.tagNumber = 0;
            _imsi.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:_imsi];
		}
	}
	else if(_lmsi)
	{
		[_lmsi processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 1;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = _lmsi.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [_lmsi.asn1_list copy];
			}
			else
			{
				self.asn1_data = [_lmsi.asn1_data copy];
			}
		}
		else
		{
			_lmsi.asn1_tag.tagNumber = 1;
            _lmsi.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:_lmsi];
		}
	}
	else if(_serviceCentreAddressDA)
	{
		[_serviceCentreAddressDA processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 4;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = _serviceCentreAddressDA.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [_serviceCentreAddressDA.asn1_list copy];
			}
			else
			{
				self.asn1_data = [_serviceCentreAddressDA.asn1_data copy];
			}
		}
		else
		{
            _serviceCentreAddressDA.asn1_tag.tagNumber = 4;
            _serviceCentreAddressDA.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:_serviceCentreAddressDA];
		}
        if(_serviceCentreAddressDA2)
        {
            [_serviceCentreAddressDA2 processBeforeEncode];
            if(isImplicit)
            {
                self.asn1_tag.tagNumber = 4;
                self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
                self.asn1_tag.isConstructed = _serviceCentreAddressDA2.asn1_tag.isConstructed;
                if(self.asn1_tag.isConstructed)
                {
                    self.asn1_list = [_serviceCentreAddressDA2.asn1_list copy];
                }
                else
                {
                    self.asn1_data = [_serviceCentreAddressDA2.asn1_data copy];
                }
            }
            else
            {
                _serviceCentreAddressDA2.asn1_tag.tagNumber = 4;
                _serviceCentreAddressDA2.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
                [_asn1_list addObject:_serviceCentreAddressDA2];
            }
        }
	}
	else if(_noSM_RP_DA)
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
		_imsi = [[UMGSMMAP_IMSI alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		_lmsi = [[UMGSMMAP_LMSI alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		_serviceCentreAddressDA = [[UMGSMMAP_AddressString alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		_noSM_RP_DA = YES;
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
	if(_imsi)
	{
		dict[@"imsi"] = _imsi.objectValue;
	}
	if(_lmsi)
	{
		dict[@"lmsi"] = _lmsi.objectValue;
	}
	if(_serviceCentreAddressDA)
	{
		dict[@"serviceCentreAddressDA"] = _serviceCentreAddressDA.objectValue;
	}
	if(_noSM_RP_DA)
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


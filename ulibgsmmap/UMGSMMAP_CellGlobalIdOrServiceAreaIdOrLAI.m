//
//  UMGSMMAP_CellGlobalIdOrServiceAreaIdOrLAI.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_CellGlobalIdOrServiceAreaIdOrLAI.h"

@implementation UMGSMMAP_CellGlobalIdOrServiceAreaIdOrLAI


@synthesize	operationName;
@synthesize	cellGlobalIdOrServiceAreaIdFixedLength;
@synthesize	laiFixedLength;


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
	if(cellGlobalIdOrServiceAreaIdFixedLength)
	{
		[cellGlobalIdOrServiceAreaIdFixedLength processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 0;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = cellGlobalIdOrServiceAreaIdFixedLength.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [cellGlobalIdOrServiceAreaIdFixedLength.asn1_list copy];
			}
			else
			{
				self.asn1_data = [cellGlobalIdOrServiceAreaIdFixedLength.asn1_data copy];
			}
		}
		else
		{
			cellGlobalIdOrServiceAreaIdFixedLength.asn1_tag.tagNumber = 0;
			cellGlobalIdOrServiceAreaIdFixedLength.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[asn1_list addObject:cellGlobalIdOrServiceAreaIdFixedLength];
		}
	}
	else if(laiFixedLength)
	{
		[laiFixedLength processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 1;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = laiFixedLength.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [laiFixedLength.asn1_list copy];
			}
			else
			{
				self.asn1_data = [laiFixedLength.asn1_data copy];
			}
		}
		else
		{
			laiFixedLength.asn1_tag.tagNumber = 1;
			laiFixedLength.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[asn1_list addObject:laiFixedLength];
		}
	}
	else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_CellGlobalIdOrServiceAreaIdOrLAI choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_CellGlobalIdOrServiceAreaIdOrLAI *) processAfterDecodeWithContext:(id)context
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
		cellGlobalIdOrServiceAreaIdFixedLength = [[UMASN1OctetString alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		laiFixedLength = [[UMASN1OctetString alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"CellGlobalIdOrServiceAreaIdOrLAI";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(cellGlobalIdOrServiceAreaIdFixedLength)
	{
		dict[@"cellGlobalIdOrServiceAreaIdFixedLength"] = [self extractCellGlobalIdOrServiceAreaIdFixedLength];
	}
	if(laiFixedLength)
	{
        dict[@"laiFixedLength"] = [self extractLaiFixedLength];
	}
	return dict;
}

-(UMSynchronizedSortedDictionary *)extractCellGlobalIdOrServiceAreaIdFixedLength
{
    UMASN1Object *o =cellGlobalIdOrServiceAreaIdFixedLength;
    /*
     CellGlobalIdOrServiceAreaIdFixedLength ::= OCTET STRING (SIZE (7))
     -- Refers to Cell Global Identification or Service Are Identification -- defined in 3GPP TS 23.003.
     -- The internal structure is defined as follows:
     -- octet 1 bits 4321 Mobile Country Code 1st digit
     bits 8765 Mobile Country Code 2st digit
     -- octet 2 bits 4321 Mobile Country Code 3rd digit
     bits 8765 Mobile Network Code 3rd digit
     or filler (1111) for 2 digits MNCs
     -- octet 3 bits 4321 Mobile Network Code 1st digit
     bits 8765 Mobile Network Code 2nd digit
     
     -- octets 4 and 5 Location Area Code according to 3GPP TS 24.008
     -- octets 6 and 7 Cell Identity (CI) value or Service Area Code (SAC) value according to 3GPP TS 23.003
     */
    
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    NSData *data = o.asn1_data;
    int mnc;
    int mcc;
    int mnc_len;
    
    if(data)
    {
        dict[@"rawData"] = [data hexString];
    }
    
    if(data.length >= 7)
    {
        unsigned const char *b = [data bytes];
        mcc = ( b[0] & 0x0F ) * 100 + ( b[0] >> 4 & 0x0F ) * 10 +  ( b[1] & 0x0F ) * 1;
        dict[@"mcc"] = [NSString stringWithFormat:@"%03d",mcc];
        
        if( (b[1] & 0xF0) == 0xF0)
        {
            mnc_len=2;
        }
        else
        {
            mnc_len=3;
        }
        if(mnc_len==2)
        {
            mnc = ( b[2] & 0x0F ) * 10 + ( b[2] >> 4 & 0x0F ) * 1;
            dict[@"mnc"] = [NSString stringWithFormat:@"%02d",mnc];
            
        }
        else
        {
            mnc = ( b[2] & 0x0F ) * 100 + ( b[2] >> 4 & 0x0F ) * 10 +  ( (b[1] & 0xF0) >> 4) * 1;
            dict[@"mnc"] = [NSString stringWithFormat:@"%03d",mnc];
        }
        dict[@"lac"] = [NSString stringWithFormat:@"%d",((int)b[3])*256+b[4]];
        dict[@"ci"] = [NSString stringWithFormat:@"%d",((int)b[5])*256+b[6]];
    }

    return dict;
}

-(UMSynchronizedSortedDictionary *)extractLaiFixedLength
{
    UMASN1Object *o = laiFixedLength;
    /*
     LAIFixedLength ::= OCTET STRING (SIZE (5))
     -- Refers to Location Area Identification defined in TS 3GPP TS 23.003 [17].
     -- The internal structure is defined as follows:
     -- octet 1 bits 4321 Mobile Country Code 1st digit
     bits 8765 Mobile Country Code 2st digit
     -- octet 2 bits 4321 Mobile Country Code 3rd digit
     bits 8765 Mobile Network Code 3rd digit
     or filler (1111) for 2 digits MNCs
     -- octet 3 bits 4321 Mobile Network Code 1st digit
     bits 8765 Mobile Network Code 2nd digit
     
     -- octet 3 bits 4321 Mobile Network Code 1st digit
     bits 8765 Mobile Network Code 2nd digit
     -- octets 4 and 5  Location Area Code according to TS 3GPP TS 24.008
     */
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    NSData *data = o.asn1_data;
    int mnc;
    int mcc;
    int mnc_len;
    
    if(data)
    {
        dict[@"rawData"] = [data hexString];
    }

    if(data.length >= 5)
    {
        unsigned const char *b = [data bytes];
        mcc = ( b[0] & 0x0F ) * 100 + ( b[0] >> 4 & 0x0F ) * 10 +  ( b[1] & 0x0F ) * 1;
        dict[@"mcc"] = [NSString stringWithFormat:@"%03d",mcc];
        
        if( (b[1] & 0xF0) == 0xF0)
        {
            mnc_len=2;
        }
        else
        {
            mnc_len=3;
        }
        if(mnc_len==2)
        {
            mnc = ( b[2] & 0x0F ) * 10 + ( b[2] >> 4 & 0x0F ) * 1;
            dict[@"mnc"] = [NSString stringWithFormat:@"%02d",mnc];
            
        }
        else
        {
            mnc = ( b[2] & 0x0F ) * 100 + ( b[2] >> 4 & 0x0F ) * 10 +  ( (b[1] & 0xF0) >> 4) * 1;
            dict[@"mnc"] = [NSString stringWithFormat:@"%03d",mnc];
        }
        dict[@"lai"] = [NSString stringWithFormat:@"0x%02X%02X",b[3],b[4]];
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


//
//  UMGSMMAP_LocationInformation.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_LocationInformation.h"

@implementation UMGSMMAP_LocationInformation


@synthesize	operationName;
@synthesize	ageOfLocationInformation;
@synthesize	geographicalInformation;
@synthesize	vlr_number;
@synthesize	locationNumber;
@synthesize	cellGlobalIdOrServiceAreaIdOrLAI;
@synthesize	extensionContainer;
@synthesize	selectedLSA_Id;
@synthesize	msc_Number;
@synthesize	geodeticInformation;
@synthesize	currentLocationRetrieved;
@synthesize	sai_Present;
@synthesize	locationInformationEPS;
@synthesize	userCSGInformation;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(ageOfLocationInformation)
	{
		[asn1_list addObject:ageOfLocationInformation];
	}
	if(geographicalInformation)
	{
		geographicalInformation.asn1_tag.tagNumber = 0;
		geographicalInformation.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:geographicalInformation];
	}
	if(vlr_number)
	{
		vlr_number.asn1_tag.tagNumber = 1;
		vlr_number.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:vlr_number];
	}
	if(locationNumber)
	{
		locationNumber.asn1_tag.tagNumber = 2;
		locationNumber.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:locationNumber];
	}
	if(cellGlobalIdOrServiceAreaIdOrLAI)
	{
		cellGlobalIdOrServiceAreaIdOrLAI.asn1_tag.tagNumber = 3;
		cellGlobalIdOrServiceAreaIdOrLAI.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:cellGlobalIdOrServiceAreaIdOrLAI];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 4;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
	if(selectedLSA_Id)
	{
		selectedLSA_Id.asn1_tag.tagNumber = 5;
		selectedLSA_Id.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:selectedLSA_Id];
	}
	if(msc_Number)
	{
		msc_Number.asn1_tag.tagNumber = 6;
		msc_Number.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:msc_Number];
	}
	if(geodeticInformation)
	{
		geodeticInformation.asn1_tag.tagNumber = 7;
		geodeticInformation.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:geodeticInformation];
	}
	if(currentLocationRetrieved)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 8;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(sai_Present)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 9;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(locationInformationEPS)
	{
		locationInformationEPS.asn1_tag.tagNumber = 10;
		locationInformationEPS.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:locationInformationEPS];
	}
	if(userCSGInformation)
	{
		userCSGInformation.asn1_tag.tagNumber = 11;
		userCSGInformation.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:userCSGInformation];
	}
}


- (UMGSMMAP_LocationInformation *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == UMASN1Primitive_integer) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
	{
		ageOfLocationInformation = [[UMASN1Integer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		geographicalInformation = [[UMGSMMAP_GeographicalInformation alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		vlr_number = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		locationNumber = [[UMGSMMAP_LocationNumber alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		cellGlobalIdOrServiceAreaIdOrLAI = [[UMGSMMAP_CellGlobalIdOrServiceAreaIdOrLAI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			selectedLSA_Id = [[UMGSMMAP_LSAIdentity alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 6) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			msc_Number = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 7) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			geodeticInformation = [[UMGSMMAP_GeodeticInformation alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 8) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			currentLocationRetrieved = YES;
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 9) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			sai_Present = YES;
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 10) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			locationInformationEPS = [[UMGSMMAP_LocationInformationEPS alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 11) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			userCSGInformation = [[UMGSMMAP_UserCSGInformation alloc]initWithASN1Object:o context:context];
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
	return @"LocationInformation";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(ageOfLocationInformation)
	{
		dict[@"ageOfLocationInformation"] = ageOfLocationInformation.objectValue;
	}
	if(geographicalInformation)
	{
		dict[@"geographicalInformation"] = geographicalInformation.objectValue;
	}
	if(vlr_number)
	{
		dict[@"vlr-number"] = vlr_number.objectValue;
	}
	if(locationNumber)
	{
		dict[@"locationNumber"] = locationNumber.objectValue;
	}
	if(cellGlobalIdOrServiceAreaIdOrLAI)
	{
		dict[@"cellGlobalIdOrServiceAreaIdOrLAI"] = cellGlobalIdOrServiceAreaIdOrLAI.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(selectedLSA_Id)
	{
		dict[@"selectedLSA-Id"] = selectedLSA_Id.objectValue;
	}
	if(msc_Number)
	{
		dict[@"msc-Number"] = msc_Number.objectValue;
	}
	if(geodeticInformation)
	{
		dict[@"geodeticInformation"] = geodeticInformation.objectValue;
	}
	if(currentLocationRetrieved)
	{
		dict[@"currentLocationRetrieved"] = @(YES);
	}
	if(sai_Present)
	{
		dict[@"sai-Present"] = @(YES);
	}
	if(locationInformationEPS)
	{
		dict[@"locationInformationEPS"] = locationInformationEPS.objectValue;
	}
	if(userCSGInformation)
	{
		dict[@"userCSGInformation"] = userCSGInformation.objectValue;
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


//
//  UMGSMMAP_LocationInformationEPS.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_LocationInformationEPS.h>

@implementation UMGSMMAP_LocationInformationEPS


@synthesize	operationName;
@synthesize	e_utranCellGlobalIdentity;
@synthesize	trackingAreaIdentity;
@synthesize	extensionContainer;
@synthesize	geographicalInformation;
@synthesize	geodeticInformation;
@synthesize	currentLocationRetrieved;
@synthesize	ageOfLocationInformation;
@synthesize	mme_Name;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(e_utranCellGlobalIdentity)
	{
		e_utranCellGlobalIdentity.asn1_tag.tagNumber = 0;
		e_utranCellGlobalIdentity.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:e_utranCellGlobalIdentity];
	}
	if(trackingAreaIdentity)
	{
		trackingAreaIdentity.asn1_tag.tagNumber = 1;
		trackingAreaIdentity.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:trackingAreaIdentity];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 2;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:extensionContainer];
	}
	if(geographicalInformation)
	{
		geographicalInformation.asn1_tag.tagNumber = 3;
		geographicalInformation.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:geographicalInformation];
	}
	if(geodeticInformation)
	{
		geodeticInformation.asn1_tag.tagNumber = 4;
		geodeticInformation.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:geodeticInformation];
	}
	if(currentLocationRetrieved)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 5;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:n];
	}
	if(ageOfLocationInformation)
	{
		ageOfLocationInformation.asn1_tag.tagNumber = 6;
		ageOfLocationInformation.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:ageOfLocationInformation];
	}
	if(mme_Name)
	{
		mme_Name.asn1_tag.tagNumber = 7;
		mme_Name.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:mme_Name];
	}
}


- (UMGSMMAP_LocationInformationEPS *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		e_utranCellGlobalIdentity = [[UMGSMMAP_E_UTRAN_CGI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		trackingAreaIdentity = [[UMGSMMAP_TA_Id alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		geographicalInformation = [[UMGSMMAP_GeographicalInformation alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		geodeticInformation = [[UMGSMMAP_GeodeticInformation alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		currentLocationRetrieved = YES;
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 6) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ageOfLocationInformation = [[UMGSMMAP_AgeOfLocationInformation alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if((o) && (o.asn1_tag.tagNumber == 7) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			mme_Name = [[UMGSMMAP_DiameterIdentity alloc]initWithASN1Object:o context:context];
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
	return @"LocationInformationEPS";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(e_utranCellGlobalIdentity)
	{
		dict[@"e-utranCellGlobalIdentity"] = e_utranCellGlobalIdentity.objectValue;
	}
	if(trackingAreaIdentity)
	{
		dict[@"trackingAreaIdentity"] = trackingAreaIdentity.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(geographicalInformation)
	{
		dict[@"geographicalInformation"] = geographicalInformation.objectValue;
	}
	if(geodeticInformation)
	{
		dict[@"geodeticInformation"] = geodeticInformation.objectValue;
	}
	if(currentLocationRetrieved)
	{
		dict[@"currentLocationRetrieved"] = @(YES);
	}
	if(ageOfLocationInformation)
	{
		dict[@"ageOfLocationInformation"] = ageOfLocationInformation.objectValue;
	}
	if(mme_Name)
	{
		dict[@"mme-Name"] = mme_Name.objectValue;
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


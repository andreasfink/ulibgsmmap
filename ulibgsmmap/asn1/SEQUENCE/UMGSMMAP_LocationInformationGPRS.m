//
//  UMGSMMAP_LocationInformationGPRS.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_LocationInformationGPRS.h>

@implementation UMGSMMAP_LocationInformationGPRS


@synthesize	operationName;
@synthesize	cellGlobalIdOrServiceAreaIdOrLAI;
@synthesize	routeingAreaIdentity;
@synthesize	geographicalInformation;
@synthesize	sgsn_Number;
@synthesize	selectedLSAIdentity;
@synthesize	extensionContainer;
@synthesize	sai_Present;
@synthesize	geodeticInformation;
@synthesize	currentLocationRetrieved;
@synthesize	ageOfLocationInformation;
@synthesize	userCSGInformation;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(cellGlobalIdOrServiceAreaIdOrLAI)
	{
		cellGlobalIdOrServiceAreaIdOrLAI.asn1_tag.tagNumber = 0;
		cellGlobalIdOrServiceAreaIdOrLAI.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:cellGlobalIdOrServiceAreaIdOrLAI];
	}
	if(routeingAreaIdentity)
	{
		routeingAreaIdentity.asn1_tag.tagNumber = 1;
		routeingAreaIdentity.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:routeingAreaIdentity];
	}
	if(geographicalInformation)
	{
		geographicalInformation.asn1_tag.tagNumber = 2;
		geographicalInformation.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:geographicalInformation];
	}
	if(sgsn_Number)
	{
		sgsn_Number.asn1_tag.tagNumber = 3;
		sgsn_Number.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:sgsn_Number];
	}
	if(selectedLSAIdentity)
	{
		selectedLSAIdentity.asn1_tag.tagNumber = 4;
		selectedLSAIdentity.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:selectedLSAIdentity];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 5;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
	if(sai_Present)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 6;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
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
	if(ageOfLocationInformation)
	{
		ageOfLocationInformation.asn1_tag.tagNumber = 9;
		ageOfLocationInformation.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ageOfLocationInformation];
	}
	if(userCSGInformation)
	{
		userCSGInformation.asn1_tag.tagNumber = 10;
		userCSGInformation.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:userCSGInformation];
	}
}


- (UMGSMMAP_LocationInformationGPRS *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_LocationInformationGPRS"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		cellGlobalIdOrServiceAreaIdOrLAI = [[UMGSMMAP_CellGlobalIdOrServiceAreaIdOrLAI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		routeingAreaIdentity = [[UMGSMMAP_RAIdentity alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		geographicalInformation = [[UMGSMMAP_GeographicalInformation alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		sgsn_Number = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		selectedLSAIdentity = [[UMGSMMAP_LSAIdentity alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if((o) && (o.asn1_tag.tagNumber == 6) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			sai_Present = YES;
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
			ageOfLocationInformation = [[UMGSMMAP_AgeOfLocationInformation alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 10) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			userCSGInformation = [[UMGSMMAP_UserCSGInformation alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
	}
	return self;
}

- (NSString *) objectName
{
	return @"LocationInformationGPRS";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(cellGlobalIdOrServiceAreaIdOrLAI)
	{
		dict[@"cellGlobalIdOrServiceAreaIdOrLAI"] = cellGlobalIdOrServiceAreaIdOrLAI.objectValue;
	}
	if(routeingAreaIdentity)
	{
		dict[@"routeingAreaIdentity"] = routeingAreaIdentity.objectValue;
	}
	if(geographicalInformation)
	{
		dict[@"geographicalInformation"] = geographicalInformation.objectValue;
	}
	if(sgsn_Number)
	{
		dict[@"sgsn-Number"] = sgsn_Number.objectValue;
	}
	if(selectedLSAIdentity)
	{
		dict[@"selectedLSAIdentity"] = selectedLSAIdentity.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(sai_Present)
	{
		dict[@"sai-Present"] = @(YES);
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
	if(userCSGInformation)
	{
		dict[@"userCSGInformation"] = userCSGInformation.objectValue;
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


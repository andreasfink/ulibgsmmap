//
//  UMGSMMAP_MySubscriberInfo.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_MySubscriberInfo.h>

@implementation UMGSMMAP_MySubscriberInfo


@synthesize	operationName;
@synthesize	locationInformation;
@synthesize	geographicalInformation;
@synthesize	vlr_number;
@synthesize	locationNumber;
@synthesize	cellGlobalIdOrServiceAreaIdOrLAI;
@synthesize	laiFixedLength;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(locationInformation)
	{
		locationInformation.asn1_tag.tagNumber = 0;
		locationInformation.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:locationInformation];
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
	if(laiFixedLength)
	{
		laiFixedLength.asn1_tag.tagNumber = 1;
		laiFixedLength.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:laiFixedLength];
	}
}


- (UMGSMMAP_MySubscriberInfo *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_MySubscriberInfo"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		locationInformation = [[UMASN1Integer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		geographicalInformation = [[UMASN1OctetString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		vlr_number = [[UMASN1OctetString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		locationNumber = [[UMASN1OctetString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		cellGlobalIdOrServiceAreaIdOrLAI = [[UMASN1OctetString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		laiFixedLength = [[UMASN1OctetString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	return self;
}

- (NSString *) objectName
{
	return @"MySubscriberInfo";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(locationInformation)
	{
		dict[@"locationInformation"] = locationInformation.objectValue;
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
	if(laiFixedLength)
	{
		dict[@"laiFixedLength"] = laiFixedLength.objectValue;
	}
	return dict;
}



@end


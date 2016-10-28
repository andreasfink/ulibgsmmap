//
//  UMGSMMAP_ProvideSubscriberLocation_Res.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_ProvideSubscriberLocation_Res.h"

@implementation UMGSMMAP_ProvideSubscriberLocation_Res


@synthesize	operationName;
@synthesize	locationEstimate;
@synthesize	ageOfLocationEstimate;
@synthesize	extensionContainer;
@synthesize	add_LocationEstimate;
@synthesize	deferredmt_lrResponseIndicator;
@synthesize	geranPositioningData;
@synthesize	utranPositioningData;
@synthesize	cellIdOrSai;
@synthesize	sai_Present;
@synthesize	accuracyFulfilmentIndicator;
@synthesize	velocityEstimate;
@synthesize	mo_lrShortCircuitIndicator;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(locationEstimate)
	{
		[asn1_list addObject:locationEstimate];
	}
	if(ageOfLocationEstimate)
	{
		ageOfLocationEstimate.asn1_tag.tagNumber = 0;
		ageOfLocationEstimate.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ageOfLocationEstimate];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 1;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
	if(add_LocationEstimate)
	{
		add_LocationEstimate.asn1_tag.tagNumber = 2;
		add_LocationEstimate.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:add_LocationEstimate];
	}
	if(deferredmt_lrResponseIndicator)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 3;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(geranPositioningData)
	{
		geranPositioningData.asn1_tag.tagNumber = 4;
		geranPositioningData.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:geranPositioningData];
	}
	if(utranPositioningData)
	{
		utranPositioningData.asn1_tag.tagNumber = 5;
		utranPositioningData.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:utranPositioningData];
	}
	if(cellIdOrSai)
	{
		cellIdOrSai.asn1_tag.tagNumber = 6;
		cellIdOrSai.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:cellIdOrSai];
	}
	if(sai_Present)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 7;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(accuracyFulfilmentIndicator)
	{
		accuracyFulfilmentIndicator.asn1_tag.tagNumber = 8;
		accuracyFulfilmentIndicator.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:accuracyFulfilmentIndicator];
	}
	if(velocityEstimate)
	{
		velocityEstimate.asn1_tag.tagNumber = 9;
		velocityEstimate.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:velocityEstimate];
	}
	if(mo_lrShortCircuitIndicator)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 10;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
}


- (UMGSMMAP_ProvideSubscriberLocation_Res *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		locationEstimate = [[UMGSMMAP_Ext_GeographicalInformation alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ageOfLocationEstimate = [[UMGSMMAP_AgeOfLocationInformation alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			add_LocationEstimate = [[UMGSMMAP_Add_GeographicalInformation alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			deferredmt_lrResponseIndicator = YES;
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			geranPositioningData = [[UMGSMMAP_PositioningDataInformation alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			utranPositioningData = [[UMGSMMAP_UtranPositioningDataInfo alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 6) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			cellIdOrSai = [[UMGSMMAP_CellGlobalIdOrServiceAreaIdOrLAI alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 7) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			sai_Present = YES;
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 8) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			accuracyFulfilmentIndicator = [[UMGSMMAP_AccuracyFulfilmentIndicator alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 9) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			velocityEstimate = [[UMGSMMAP_VelocityEstimate alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 10) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			mo_lrShortCircuitIndicator = YES;
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
	return @"ProvideSubscriberLocation-Res";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(locationEstimate)
	{
		dict[@"locationEstimate"] = locationEstimate.objectValue;
	}
	if(ageOfLocationEstimate)
	{
		dict[@"ageOfLocationEstimate"] = ageOfLocationEstimate.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(add_LocationEstimate)
	{
		dict[@"add-LocationEstimate"] = add_LocationEstimate.objectValue;
	}
	if(deferredmt_lrResponseIndicator)
	{
		dict[@"deferredmt-lrResponseIndicator"] = @(YES);
	}
	if(geranPositioningData)
	{
		dict[@"geranPositioningData"] = geranPositioningData.objectValue;
	}
	if(utranPositioningData)
	{
		dict[@"utranPositioningData"] = utranPositioningData.objectValue;
	}
	if(cellIdOrSai)
	{
		dict[@"cellIdOrSai"] = cellIdOrSai.objectValue;
	}
	if(sai_Present)
	{
		dict[@"sai-Present"] = @(YES);
	}
	if(accuracyFulfilmentIndicator)
	{
		dict[@"accuracyFulfilmentIndicator"] = accuracyFulfilmentIndicator.objectValue;
	}
	if(velocityEstimate)
	{
		dict[@"velocityEstimate"] = velocityEstimate.objectValue;
	}
	if(mo_lrShortCircuitIndicator)
	{
		dict[@"mo-lrShortCircuitIndicator"] = @(YES);
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


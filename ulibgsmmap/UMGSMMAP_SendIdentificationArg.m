//
//  UMGSMMAP_SendIdentificationArg.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_SendIdentificationArg.h"

@implementation UMGSMMAP_SendIdentificationArg


@synthesize	operationName;
@synthesize	tmsi;
@synthesize	numberOfRequestedVectors;
@synthesize	segmentationProhibited;
@synthesize	extensionContainer;
@synthesize	msc_Number;
@synthesize	previous_LAI;
@synthesize	hopCounter;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(tmsi)
	{
		[_asn1_list addObject:tmsi];
	}
	if(numberOfRequestedVectors)
	{
		[_asn1_list addObject:numberOfRequestedVectors];
	}
	if(segmentationProhibited)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = -1;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:n];
	}
	if(extensionContainer)
	{
		[_asn1_list addObject:extensionContainer];
	}
	if(msc_Number)
	{
		[_asn1_list addObject:msc_Number];
	}
	if(previous_LAI)
	{
		previous_LAI.asn1_tag.tagNumber = 0;
		previous_LAI.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:previous_LAI];
	}
	if(hopCounter)
	{
		hopCounter.asn1_tag.tagNumber = 1;
		hopCounter.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:hopCounter];
	}
}


- (UMGSMMAP_SendIdentificationArg *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		tmsi = [[UMGSMMAP_Tmsi alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		numberOfRequestedVectors = [[UMGSMMAP_NumberOfRequestedVectors alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		segmentationProhibited = YES;
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if(o)
		{
			msc_Number = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			previous_LAI = [[UMGSMMAP_LAIFixedLength alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			hopCounter = [[UMASN1Integer alloc]initWithASN1Object:o context:context];
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
	return @"SendIdentificationArg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(tmsi)
	{
		dict[@"tmsi"] = tmsi.objectValue;
	}
	if(numberOfRequestedVectors)
	{
		dict[@"numberOfRequestedVectors"] = numberOfRequestedVectors.objectValue;
	}
	if(segmentationProhibited)
	{
		dict[@"segmentationProhibited"] = @(YES);
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(msc_Number)
	{
		dict[@"msc-Number"] = msc_Number.objectValue;
	}
	if(previous_LAI)
	{
		dict[@"previous-LAI"] = previous_LAI.objectValue;
	}
	if(hopCounter)
	{
		dict[@"hopCounter"] = hopCounter.objectValue;
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


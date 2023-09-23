//
//  UMGSMMAP_SendAuthenticationInfoArg.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_SendAuthenticationInfoArg.h>

@implementation UMGSMMAP_SendAuthenticationInfoArg


@synthesize	operationName;
@synthesize	imsi;
@synthesize	numberOfRequestedVectors;
@synthesize	segmentationProhibited;
@synthesize	immediateResponsePreferred;
@synthesize	re_synchronisationInfo;
@synthesize	extensionContainer;
@synthesize	requestingNodeType;
@synthesize	requestingPLMN_Id;
@synthesize	numberOfRequestedAdditional_Vectors;
@synthesize	additionalVectorsAreForEPS;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(imsi)
	{
		imsi.asn1_tag.tagNumber = 0;
		imsi.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:imsi];
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
	if(immediateResponsePreferred)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 1;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:n];
	}
	if(re_synchronisationInfo)
	{
		[_asn1_list addObject:re_synchronisationInfo];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 2;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:extensionContainer];
	}
	if(requestingNodeType)
	{
		requestingNodeType.asn1_tag.tagNumber = 3;
		requestingNodeType.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:requestingNodeType];
	}
	if(requestingPLMN_Id)
	{
		requestingPLMN_Id.asn1_tag.tagNumber = 4;
		requestingPLMN_Id.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:requestingPLMN_Id];
	}
	if(numberOfRequestedAdditional_Vectors)
	{
		numberOfRequestedAdditional_Vectors.asn1_tag.tagNumber = 5;
		numberOfRequestedAdditional_Vectors.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:numberOfRequestedAdditional_Vectors];
	}
	if(additionalVectorsAreForEPS)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 6;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:n];
	}
}


- (UMGSMMAP_SendAuthenticationInfoArg *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		imsi = [[UMGSMMAP_IMSI alloc]initWithASN1Object:o context:context];
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
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		immediateResponsePreferred = YES;
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		re_synchronisationInfo = [[UMGSMMAP_Re_SynchronisationInfo alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			requestingNodeType = [[UMGSMMAP_RequestingNodeType alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			requestingPLMN_Id = [[UMASN1OctetString alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			numberOfRequestedAdditional_Vectors = [[UMGSMMAP_NumberOfRequestedVectors alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 6) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			additionalVectorsAreForEPS = YES;
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
	return @"SendAuthenticationInfoArg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(imsi)
	{
		dict[@"imsi"] = imsi.objectValue;
	}
	if(numberOfRequestedVectors)
	{
		dict[@"numberOfRequestedVectors"] = numberOfRequestedVectors.objectValue;
	}
	if(segmentationProhibited)
	{
		dict[@"segmentationProhibited"] = @(YES);
	}
	if(immediateResponsePreferred)
	{
		dict[@"immediateResponsePreferred"] = @(YES);
	}
	if(re_synchronisationInfo)
	{
		dict[@"re-synchronisationInfo"] = re_synchronisationInfo.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(requestingNodeType)
	{
		dict[@"requestingNodeType"] = requestingNodeType.objectValue;
	}
	if(requestingPLMN_Id)
	{
		dict[@"requestingPLMN-Id"] = requestingPLMN_Id.objectValue;
	}
	if(numberOfRequestedAdditional_Vectors)
	{
		dict[@"numberOfRequestedAdditional-Vectors"] = numberOfRequestedAdditional_Vectors.objectValue;
	}
	if(additionalVectorsAreForEPS)
	{
		dict[@"additionalVectorsAreForEPS"] = @(YES);
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


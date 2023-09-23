//
//  UMGSMMAP_MO_ForwardSM_Arg.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_MO_ForwardSM_Arg.h>

@implementation UMGSMMAP_MO_ForwardSM_Arg


@synthesize	operationName;
@synthesize	sm_RP_DA;
@synthesize	sm_RP_OA;
@synthesize	sm_RP_UI;
@synthesize	extensionContainer;
@synthesize	imsi;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	_asn1_tag.isConstructed=YES;
	_asn1_list = [[NSMutableArray alloc]init];
	if(sm_RP_DA)
	{
		sm_RP_DA.encodingType = UMASN1EncodingType_implicitlyEncoded;
		[_asn1_list addObject:sm_RP_DA];
	}
	if(sm_RP_OA)
	{
		sm_RP_OA.encodingType = UMASN1EncodingType_implicitlyEncoded;
		[_asn1_list addObject:sm_RP_OA];
	}
	if(sm_RP_UI)
	{
		sm_RP_UI.encodingType = UMASN1EncodingType_implicitlyEncoded;
		[_asn1_list addObject:sm_RP_UI];
	}
	if(extensionContainer)
	{
		extensionContainer.encodingType = UMASN1EncodingType_implicitlyEncoded;
		[_asn1_list addObject:extensionContainer];
	}
	if(imsi)
	{
		imsi.encodingType = UMASN1EncodingType_implicitlyEncoded;
		[_asn1_list addObject:imsi];
	}
}


- (UMGSMMAP_MO_ForwardSM_Arg *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o) /* implicit mandatory field of type UMGSMMAP_SM_RP_DA */
	{
		sm_RP_DA = [[UMGSMMAP_SM_RP_DA alloc]initWithASN1Object:o context:context encoding:UMASN1EncodingType_implicitlyEncoded];
		o = [self getObjectAtPosition:p++];
	}
	if(o) /* implicit mandatory field of type UMGSMMAP_SM_RP_OA */
	{
		sm_RP_OA = [[UMGSMMAP_SM_RP_OA alloc]initWithASN1Object:o context:context encoding:UMASN1EncodingType_implicitlyEncoded];
		o = [self getObjectAtPosition:p++];
	}
	if(o) /* implicit mandatory field of type UMGSMMAP_SignalInfo */
	{
		sm_RP_UI = [[UMGSMMAP_SignalInfo alloc]initWithASN1Object:o context:context encoding:UMASN1EncodingType_implicitlyEncoded];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && ([UMGSMMAP_ExtensionContainer tagMatch:o.asn1_tag])) /* implicit optional field of type UMGSMMAP_ExtensionContainer */
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context encoding:UMASN1EncodingType_implicitlyEncoded];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if((o) && ([UMGSMMAP_IMSI tagMatch:o.asn1_tag])) /* implicit optional field of type UMGSMMAP_IMSI */
		{
			imsi = [[UMGSMMAP_IMSI alloc]initWithASN1Object:o context:context encoding:UMASN1EncodingType_implicitlyEncoded];
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
	return @"MO-ForwardSM-Arg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(sm_RP_DA)
	{
		dict[@"sm-RP-DA"] = sm_RP_DA.objectValue;
	}
	if(sm_RP_OA)
	{
		dict[@"sm-RP-OA"] = sm_RP_OA.objectValue;
	}
	if(sm_RP_UI)
	{
		dict[@"sm-RP-UI"] = sm_RP_UI.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(imsi)
	{
		dict[@"imsi"] = imsi.objectValue;
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


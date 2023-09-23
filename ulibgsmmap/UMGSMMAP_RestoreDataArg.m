//
//  UMGSMMAP_RestoreDataArg.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_RestoreDataArg.h>

@implementation UMGSMMAP_RestoreDataArg


@synthesize	operationName;
@synthesize	imsi;
@synthesize	lmsi;
@synthesize	extensionContainer;
@synthesize	vlr_Capability;

- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(imsi)
	{
		[_asn1_list addObject:imsi];
	}
	if(lmsi)
	{
		[_asn1_list addObject:lmsi];
	}
	if(extensionContainer)
	{
		[_asn1_list addObject:extensionContainer];
	}
	if(vlr_Capability)
	{
		vlr_Capability.asn1_tag.tagNumber = 6;
		vlr_Capability.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:vlr_Capability];
	}
    if(_restorationIndicator)
    {
        UMASN1Null *ri = [[UMASN1Null alloc]init];
        ri.asn1_tag.tagNumber = 6;
        ri.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:ri];
    }
}


- (UMGSMMAP_RestoreDataArg *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		imsi = [[UMGSMMAP_IMSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		lmsi = [[UMGSMMAP_LMSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if((o) && (o.asn1_tag.tagNumber == 6) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			vlr_Capability = [[UMGSMMAP_VLR_Capability alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
        else if((o) && (o.asn1_tag.tagNumber == 7) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
        {
            _restorationIndicator = YES;
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
	return @"RestoreDataArg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(imsi)
	{
		dict[@"imsi"] = imsi.objectValue;
	}
	if(lmsi)
	{
		dict[@"lmsi"] = lmsi.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(vlr_Capability)
	{
		dict[@"vlr-Capability"] = vlr_Capability.objectValue;
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


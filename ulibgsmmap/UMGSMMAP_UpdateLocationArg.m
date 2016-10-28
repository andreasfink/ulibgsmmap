//
//  UMGSMMAP_UpdateLocationArg.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_UpdateLocationArg.h"

@implementation UMGSMMAP_UpdateLocationArg


@synthesize	operationName;
@synthesize	imsi;
@synthesize	msc_Number;
@synthesize	vlr_Number;
@synthesize	lmsi;
@synthesize	extensionContainer;
@synthesize	vlr_Capability;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(imsi)
	{
		[asn1_list addObject:imsi];
	}
	if(msc_Number)
	{
		msc_Number.asn1_tag.tagNumber = 1;
		msc_Number.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:msc_Number];
	}
	if(vlr_Number)
	{
		[asn1_list addObject:vlr_Number];
	}
	if(lmsi)
	{
		lmsi.asn1_tag.tagNumber = 10;
		lmsi.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:lmsi];
	}
	if(extensionContainer)
	{
		[asn1_list addObject:extensionContainer];
	}
	if(vlr_Capability)
	{
		vlr_Capability.asn1_tag.tagNumber = 6;
		vlr_Capability.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:vlr_Capability];
	}
}


- (UMGSMMAP_UpdateLocationArg *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		imsi = [[UMGSMMAP_IMSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		msc_Number = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		vlr_Number = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 10) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
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
        else
        {
            o = [self getObjectAtPosition:p++];
        }
	}
	return self;
}

- (NSString *) objectName
{
	return @"UpdateLocationArg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(imsi)
	{
		dict[@"imsi"] = imsi.objectValue;
	}
	if(msc_Number)
	{
		dict[@"msc-Number"] = msc_Number.objectValue;
	}
	if(vlr_Number)
	{
		dict[@"vlr-Number"] = vlr_Number.objectValue;
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
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}


@end


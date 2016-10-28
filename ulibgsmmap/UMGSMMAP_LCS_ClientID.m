//
//  UMGSMMAP_LCS_ClientID.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_LCS_ClientID.h"

@implementation UMGSMMAP_LCS_ClientID


@synthesize	operationName;
@synthesize	lcsClientType;
@synthesize	lcsClientExternalID;
@synthesize	lcsClientDialedByMS;
@synthesize	lcsClientInternalID;
@synthesize	lcsClientName;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(lcsClientType)
	{
		lcsClientType.asn1_tag.tagNumber = 0;
		lcsClientType.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:lcsClientType];
	}
	if(lcsClientExternalID)
	{
		lcsClientExternalID.asn1_tag.tagNumber = 1;
		lcsClientExternalID.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:lcsClientExternalID];
	}
	if(lcsClientDialedByMS)
	{
		lcsClientDialedByMS.asn1_tag.tagNumber = 2;
		lcsClientDialedByMS.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:lcsClientDialedByMS];
	}
	if(lcsClientInternalID)
	{
		lcsClientInternalID.asn1_tag.tagNumber = 3;
		lcsClientInternalID.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:lcsClientInternalID];
	}
	if(lcsClientName)
	{
		lcsClientName.asn1_tag.tagNumber = 4;
		lcsClientName.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:lcsClientName];
	}
}


- (UMGSMMAP_LCS_ClientID *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		lcsClientType = [[UMGSMMAP_LCSClientType alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		lcsClientExternalID = [[UMGSMMAP_LCSClientExternalID alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		lcsClientDialedByMS = [[UMGSMMAP_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		lcsClientInternalID = [[UMGSMMAP_LCSClientInternalID alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		lcsClientName = [[UMGSMMAP_LCSClientName alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
        /* ... */
        o = [self getObjectAtPosition:p++];
    }
	return self;
}

- (NSString *) objectName
{
	return @"LCS-ClientID";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(lcsClientType)
	{
		dict[@"lcsClientType"] = lcsClientType.objectValue;
	}
	if(lcsClientExternalID)
	{
		dict[@"lcsClientExternalID"] = lcsClientExternalID.objectValue;
	}
	if(lcsClientDialedByMS)
	{
		dict[@"lcsClientDialedByMS"] = lcsClientDialedByMS.objectValue;
	}
	if(lcsClientInternalID)
	{
		dict[@"lcsClientInternalID"] = lcsClientInternalID.objectValue;
	}
	if(lcsClientName)
	{
		dict[@"lcsClientName"] = lcsClientName.objectValue;
	}
	return dict;
}


- (UMGSMMAP_LCS_ClientID *)initWithClientTypeString:(NSString *)s
{
    self = [super init];
    if(self)
    {
        lcsClientType = [[UMGSMMAP_LCSClientType alloc]initWithString:s];
    }
    return self;
}


- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}

@end


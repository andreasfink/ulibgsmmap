//
//  UMGSMMAP_LCS_ClientID.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_LCS_ClientID.h>

@implementation UMGSMMAP_LCS_ClientID


@synthesize	operationName;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(_lcsClientType)
	{
		_lcsClientType.asn1_tag.tagNumber = 0;
		_lcsClientType.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:_lcsClientType];
	}
	if(_lcsClientExternalID)
	{
		_lcsClientExternalID.asn1_tag.tagNumber = 1;
		_lcsClientExternalID.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:_lcsClientExternalID];
	}
	if(_lcsClientDialedByMS)
	{
		_lcsClientDialedByMS.asn1_tag.tagNumber = 2;
		_lcsClientDialedByMS.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:_lcsClientDialedByMS];
	}
	if(_lcsClientInternalID)
	{
		_lcsClientInternalID.asn1_tag.tagNumber = 3;
		_lcsClientInternalID.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:_lcsClientInternalID];
	}
	if(_lcsClientName)
	{
		_lcsClientName.asn1_tag.tagNumber = 4;
		_lcsClientName.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:_lcsClientName];
	}
    if(_lcsAPN)
    {
        _lcsAPN.asn1_tag.tagNumber = 5;
        _lcsAPN.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_lcsAPN];
    }
    if(_lcsRequestorID)
    {
        _lcsRequestorID.asn1_tag.tagNumber = 6;
        _lcsRequestorID.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_lcsRequestorID];
    }

}


- (UMGSMMAP_LCS_ClientID *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		_lcsClientType = [[UMGSMMAP_LCSClientType alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		_lcsClientExternalID = [[UMGSMMAP_LCSClientExternalID alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		_lcsClientDialedByMS = [[UMGSMMAP_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		_lcsClientInternalID = [[UMGSMMAP_LCSClientInternalID alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		_lcsClientName = [[UMGSMMAP_LCSClientName alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
        if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
        {
            _lcsAPN = [[UMGSMMAP_APN alloc]initWithASN1Object:o context:context];
            o = [self getObjectAtPosition:p++];
        }
        if((o) && (o.asn1_tag.tagNumber == 6) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
        {
            _lcsRequestorID = [[UMGSMMAP_LCSRequestorID alloc]initWithASN1Object:o context:context];
            o = [self getObjectAtPosition:p++];
        }
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
	if(_lcsClientType)
	{
		dict[@"lcsClientType"] = _lcsClientType.objectValue;
	}
	if(_lcsClientExternalID)
	{
		dict[@"lcsClientExternalID"] = _lcsClientExternalID.objectValue;
	}
	if(_lcsClientDialedByMS)
	{
		dict[@"lcsClientDialedByMS"] = _lcsClientDialedByMS.objectValue;
	}
	if(_lcsClientInternalID)
	{
		dict[@"lcsClientInternalID"] = _lcsClientInternalID.objectValue;
	}
	if(_lcsClientName)
	{
		dict[@"lcsClientName"] = _lcsClientName.objectValue;
	}
    if(_lcsAPN)
    {
        dict[@"lcsAPN"] = _lcsAPN.objectValue;
    }
    if(_lcsRequestorID)
    {
        dict[@"lcsRequestorID"] = _lcsRequestorID.objectValue;
    }
	return dict;
}


- (UMGSMMAP_LCS_ClientID *)initWithClientTypeString:(NSString *)s
{
    self = [super init];
    if(self)
    {
        _lcsClientType = [[UMGSMMAP_LCSClientType alloc]initWithString:s];
    }
    return self;
}


- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}

@end


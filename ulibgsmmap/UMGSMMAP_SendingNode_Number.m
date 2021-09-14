//
//  UMGSMMAP_SendIdentificationRes.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_SendingNode_Number.h"
#import "UMGSMMAP_ISDN_AddressString.h"

@implementation UMGSMMAP_SendingNode_Number

- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(_hlr_Number)
	{
		[_asn1_list addObject:_hlr_Number];
	}
	else if(_css_Number)
	{
        _css_Number.asn1_tag.tagNumber = 1;
        _css_Number.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:_css_Number];
	}
}


- (UMGSMMAP_SendingNode_Number *) processAfterDecodeWithContext:(id)context
{
    if((self.asn1_tag.tagClass == UMASN1Class_ContextSpecific) && (self.asn1_tag.tagNumber == 1))
    {
        _css_Number = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:self context:context];
    }
    else
    {
        _hlr_Number = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:self context:context];
    }

	return self;
}

- (NSString *) objectName
{
	return @"SendingNode-Number";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(_css_Number)
	{
		dict[@"css-Number"] = _css_Number.objectValue;
	}
	else if(_hlr_Number)
	{
		dict[@"hlr-Number"] = _hlr_Number.objectValue;
	}
	return dict;
}


@end


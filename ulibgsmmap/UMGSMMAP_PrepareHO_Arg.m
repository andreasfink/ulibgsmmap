//
//  UMGSMMAP_PrepareHO_Arg.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_PrepareHO_Arg.h>

@implementation UMGSMMAP_PrepareHO_Arg


@synthesize	operationName;
@synthesize	targetCellId;
@synthesize	ho_NumberNotRequired;
@synthesize	bss_APDU;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[_asn1_tag setTagIsConstructed];
	_asn1_list = [[NSMutableArray alloc]init];
	if(targetCellId)
	{
		[_asn1_list addObject:targetCellId];
	}
	if(ho_NumberNotRequired)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = -1;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[_asn1_list addObject:n];
	}
	if(bss_APDU)
	{
		[_asn1_list addObject:bss_APDU];
	}
}


- (UMGSMMAP_PrepareHO_Arg *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		targetCellId = [[UMGSMMAP_GlobalCellId alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		ho_NumberNotRequired = YES;
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		bss_APDU = [[UMGSMMAP_ExternalSignalInfo alloc]initWithASN1Object:o context:context];
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
	return @"PrepareHO-Arg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(targetCellId)
	{
		dict[@"targetCellId"] = targetCellId.objectValue;
	}
	if(ho_NumberNotRequired)
	{
		dict[@"ho-NumberNotRequired"] = @(YES);
	}
	if(bss_APDU)
	{
		dict[@"bss-APDU"] = bss_APDU.objectValue;
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


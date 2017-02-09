//
//  UMGSMMAP_Sm_DeliveryFailureCause.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_Sm_DeliveryFailureCause.h"

@implementation UMGSMMAP_Sm_DeliveryFailureCause


@synthesize	operationName;
@synthesize	sm_EnumeratedDeliveryFailureCause;
@synthesize	diagnosticInfo;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(sm_EnumeratedDeliveryFailureCause)
	{
		[asn1_list addObject:sm_EnumeratedDeliveryFailureCause];
	}
	if(diagnosticInfo)
	{
		[asn1_list addObject:diagnosticInfo];
	}
	if(extensionContainer)
	{
		[asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_Sm_DeliveryFailureCause *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		sm_EnumeratedDeliveryFailureCause = [[UMGSMMAP_SM_EnumeratedDeliveryFailureCause alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		diagnosticInfo = [[UMGSMMAP_SignalInfo alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
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
	return @"Sm-DeliveryFailureCause";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(sm_EnumeratedDeliveryFailureCause)
	{
		dict[@"sm-EnumeratedDeliveryFailureCause"] = sm_EnumeratedDeliveryFailureCause.objectValue;
	}
	if(diagnosticInfo)
	{
		dict[@"diagnosticInfo"] = diagnosticInfo.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
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


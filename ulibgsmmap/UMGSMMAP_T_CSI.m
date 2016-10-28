//
//  UMGSMMAP_T_CSI.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_T_CSI.h"

@implementation UMGSMMAP_T_CSI


@synthesize	operationName;
@synthesize	t_BcsmCamelTDPDataList;
@synthesize	extensionContainer;
@synthesize	camelCapabilityHandling;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(t_BcsmCamelTDPDataList)
	{
		[asn1_list addObject:t_BcsmCamelTDPDataList];
	}
	if(extensionContainer)
	{
		[asn1_list addObject:extensionContainer];
	}
	if(camelCapabilityHandling)
	{
		camelCapabilityHandling.asn1_tag.tagNumber = 0;
		camelCapabilityHandling.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:camelCapabilityHandling];
	}
}


- (UMGSMMAP_T_CSI *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		t_BcsmCamelTDPDataList = [[UMGSMMAP_T_BcsmCamelTDPDataList alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			camelCapabilityHandling = [[UMGSMMAP_CamelCapabilityHandling alloc]initWithASN1Object:o context:context];
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
	return @"T-CSI";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(t_BcsmCamelTDPDataList)
	{
		dict[@"t-BcsmCamelTDPDataList"] = t_BcsmCamelTDPDataList.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(camelCapabilityHandling)
	{
		dict[@"camelCapabilityHandling"] = camelCapabilityHandling.objectValue;
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


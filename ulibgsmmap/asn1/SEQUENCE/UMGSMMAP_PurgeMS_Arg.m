//
//  UMGSMMAP_PurgeMS_Arg.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_PurgeMS_Arg.h"

@implementation UMGSMMAP_PurgeMS_Arg


@synthesize	operationName;
@synthesize	imsi;
@synthesize	vlr_Number;
@synthesize	sgsn_Number;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(imsi)
	{
		[asn1_list addObject:imsi];
	}
	if(vlr_Number)
	{
		vlr_Number.asn1_tag.tagNumber = 0;
		vlr_Number.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:vlr_Number];
	}
	if(sgsn_Number)
	{
		sgsn_Number.asn1_tag.tagNumber = 1;
		sgsn_Number.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:sgsn_Number];
	}
	if(extensionContainer)
	{
		[asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_PurgeMS_Arg *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_PurgeMS_Arg"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		imsi = [[UMGSMMAP_IMSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		vlr_Number = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		sgsn_Number = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
	}
	return self;
}

- (NSString *) objectName
{
	return @"PurgeMS-Arg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(imsi)
	{
		dict[@"imsi"] = imsi.objectValue;
	}
	if(vlr_Number)
	{
		dict[@"vlr-Number"] = vlr_Number.objectValue;
	}
	if(sgsn_Number)
	{
		dict[@"sgsn-Number"] = sgsn_Number.objectValue;
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


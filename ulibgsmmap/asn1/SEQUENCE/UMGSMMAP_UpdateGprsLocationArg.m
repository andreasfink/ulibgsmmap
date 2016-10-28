//
//  UMGSMMAP_UpdateGprsLocationArg.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_UpdateGprsLocationArg.h"

@implementation UMGSMMAP_UpdateGprsLocationArg


@synthesize	operationName;
@synthesize	imsi;
@synthesize	sgsn_Number;
@synthesize	sgsn_Address;
@synthesize	extensionContainer;
@synthesize	sgsn_Capability;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(imsi)
	{
		[asn1_list addObject:imsi];
	}
	if(sgsn_Number)
	{
		[asn1_list addObject:sgsn_Number];
	}
	if(sgsn_Address)
	{
		[asn1_list addObject:sgsn_Address];
	}
	if(extensionContainer)
	{
		[asn1_list addObject:extensionContainer];
	}
	if(sgsn_Capability)
	{
		sgsn_Capability.asn1_tag.tagNumber = 0;
		sgsn_Capability.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:sgsn_Capability];
	}
}


- (UMGSMMAP_UpdateGprsLocationArg *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_UpdateGprsLocationArg"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		imsi = [[UMGSMMAP_IMSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		sgsn_Number = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		sgsn_Address = [[UMGSMMAP_GSN_Address alloc]initWithASN1Object:o context:context];
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
			sgsn_Capability = [[UMGSMMAP_SGSN_Capability alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
	}
	return self;
}

- (NSString *) objectName
{
	return @"UpdateGprsLocationArg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(imsi)
	{
		dict[@"imsi"] = imsi.objectValue;
	}
	if(sgsn_Number)
	{
		dict[@"sgsn-Number"] = sgsn_Number.objectValue;
	}
	if(sgsn_Address)
	{
		dict[@"sgsn-Address"] = sgsn_Address.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(sgsn_Capability)
	{
		dict[@"sgsn-Capability"] = sgsn_Capability.objectValue;
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


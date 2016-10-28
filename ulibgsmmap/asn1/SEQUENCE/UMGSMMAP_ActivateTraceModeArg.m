//
//  UMGSMMAP_ActivateTraceModeArg.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_ActivateTraceModeArg.h"

@implementation UMGSMMAP_ActivateTraceModeArg


@synthesize	operationName;
@synthesize	imsi;
@synthesize	traceReference;
@synthesize	traceType;
@synthesize	omc_Id;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(imsi)
	{
		imsi.asn1_tag.tagNumber = 0;
		imsi.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:imsi];
	}
	if(traceReference)
	{
		traceReference.asn1_tag.tagNumber = 1;
		traceReference.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:traceReference];
	}
	if(traceType)
	{
		traceType.asn1_tag.tagNumber = 2;
		traceType.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:traceType];
	}
	if(omc_Id)
	{
		omc_Id.asn1_tag.tagNumber = 3;
		omc_Id.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:omc_Id];
	}
	if(extensionContainer)
	{
		[asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_ActivateTraceModeArg *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_ActivateTraceModeArg"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		imsi = [[UMGSMMAP_IMSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		traceReference = [[UMGSMMAP_TraceReference alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		traceType = [[UMGSMMAP_TraceType alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		omc_Id = [[UMGSMMAP_AddressString alloc]initWithASN1Object:o context:context];
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
	return @"ActivateTraceModeArg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(imsi)
	{
		dict[@"imsi"] = imsi.objectValue;
	}
	if(traceReference)
	{
		dict[@"traceReference"] = traceReference.objectValue;
	}
	if(traceType)
	{
		dict[@"traceType"] = traceType.objectValue;
	}
	if(omc_Id)
	{
		dict[@"omc-Id"] = omc_Id.objectValue;
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


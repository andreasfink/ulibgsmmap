//
//  UMGSMMAP_RestoreDataArg.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_RestoreDataArg.h>

@implementation UMGSMMAP_RestoreDataArg


@synthesize	operationName;
@synthesize	imsi;
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
	if(lmsi)
	{
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


- (UMGSMMAP_RestoreDataArg *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_RestoreDataArg"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		imsi = [[UMGSMMAP_IMSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
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
	}
	return self;
}

- (NSString *) objectName
{
	return @"RestoreDataArg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(imsi)
	{
		dict[@"imsi"] = imsi.objectValue;
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


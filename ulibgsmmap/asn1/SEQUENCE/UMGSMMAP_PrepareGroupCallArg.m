//
//  UMGSMMAP_PrepareGroupCallArg.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_PrepareGroupCallArg.h>

@implementation UMGSMMAP_PrepareGroupCallArg


@synthesize	operationName;
@synthesize	teleservice;
@synthesize	asciCallReference;
@synthesize	codec_Info;
@synthesize	cipheringAlgorithm;
@synthesize	groupKeyNumber;
@synthesize	groupKey;
@synthesize	priority;
@synthesize	uplinkFree;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(teleservice)
	{
		[asn1_list addObject:teleservice];
	}
	if(asciCallReference)
	{
		[asn1_list addObject:asciCallReference];
	}
	if(codec_Info)
	{
		[asn1_list addObject:codec_Info];
	}
	if(cipheringAlgorithm)
	{
		[asn1_list addObject:cipheringAlgorithm];
	}
	if(groupKeyNumber)
	{
		groupKeyNumber.asn1_tag.tagNumber = 0;
		groupKeyNumber.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:groupKeyNumber];
	}
	if(groupKey)
	{
		groupKey.asn1_tag.tagNumber = 1;
		groupKey.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:groupKey];
	}
	if(priority)
	{
		priority.asn1_tag.tagNumber = 2;
		priority.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:priority];
	}
	if(uplinkFree)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 3;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 4;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_PrepareGroupCallArg *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_PrepareGroupCallArg"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		teleservice = [[UMGSMMAP_Ext_TeleserviceCode alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		asciCallReference = [[UMGSMMAP_ASCI_CallReference alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		codec_Info = [[UMGSMMAP_CODEC_Info alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		cipheringAlgorithm = [[UMGSMMAP_CipheringAlgorithm alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		groupKeyNumber = [[UMGSMMAP_GroupKeyNumber alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		groupKey = [[UMGSMMAP_Kc alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		priority = [[UMGSMMAP_EMLPP_Priority alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		uplinkFree = YES;
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
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
	return @"PrepareGroupCallArg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(teleservice)
	{
		dict[@"teleservice"] = teleservice.objectValue;
	}
	if(asciCallReference)
	{
		dict[@"asciCallReference"] = asciCallReference.objectValue;
	}
	if(codec_Info)
	{
		dict[@"codec-Info"] = codec_Info.objectValue;
	}
	if(cipheringAlgorithm)
	{
		dict[@"cipheringAlgorithm"] = cipheringAlgorithm.objectValue;
	}
	if(groupKeyNumber)
	{
		dict[@"groupKeyNumber"] = groupKeyNumber.objectValue;
	}
	if(groupKey)
	{
		dict[@"groupKey"] = groupKey.objectValue;
	}
	if(priority)
	{
		dict[@"priority"] = priority.objectValue;
	}
	if(uplinkFree)
	{
		dict[@"uplinkFree"] = @(YES);
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


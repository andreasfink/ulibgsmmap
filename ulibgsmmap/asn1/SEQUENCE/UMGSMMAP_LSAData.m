//
//  UMGSMMAP_LSAData.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_LSAData.h"

@implementation UMGSMMAP_LSAData


@synthesize	operationName;
@synthesize	lsaIdentity;
@synthesize	lsaAttributes;
@synthesize	lsaActiveModeIndicator;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(lsaIdentity)
	{
		lsaIdentity.asn1_tag.tagNumber = 0;
		lsaIdentity.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:lsaIdentity];
	}
	if(lsaAttributes)
	{
		lsaAttributes.asn1_tag.tagNumber = 1;
		lsaAttributes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:lsaAttributes];
	}
	if(lsaActiveModeIndicator)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 2;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 3;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_LSAData *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_LSAData"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		lsaIdentity = [[UMGSMMAP_LSAIdentity alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		lsaAttributes = [[UMGSMMAP_LSAAttributes alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		lsaActiveModeIndicator = YES;
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
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
	return @"LSAData";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(lsaIdentity)
	{
		dict[@"lsaIdentity"] = lsaIdentity.objectValue;
	}
	if(lsaAttributes)
	{
		dict[@"lsaAttributes"] = lsaAttributes.objectValue;
	}
	if(lsaActiveModeIndicator)
	{
		dict[@"lsaActiveModeIndicator"] = @(YES);
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


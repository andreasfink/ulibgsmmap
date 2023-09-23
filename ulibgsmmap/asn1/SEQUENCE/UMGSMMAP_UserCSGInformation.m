//
//  UMGSMMAP_UserCSGInformation.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_UserCSGInformation.h>

@implementation UMGSMMAP_UserCSGInformation


@synthesize	operationName;
@synthesize	csg_Id;
@synthesize	extensionContainer;
@synthesize	accessMode;
@synthesize	cmi;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(csg_Id)
	{
		csg_Id.asn1_tag.tagNumber = 0;
		csg_Id.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:csg_Id];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 1;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
	if(accessMode)
	{
		accessMode.asn1_tag.tagNumber = 2;
		accessMode.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:accessMode];
	}
	if(cmi)
	{
		cmi.asn1_tag.tagNumber = 3;
		cmi.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:cmi];
	}
}


- (UMGSMMAP_UserCSGInformation *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_UserCSGInformation"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		csg_Id = [[UMGSMMAP_CSG_Id alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			accessMode = [[UMASN1OctetString alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			cmi = [[UMASN1OctetString alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
	}
	return self;
}

- (NSString *) objectName
{
	return @"UserCSGInformation";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(csg_Id)
	{
		dict[@"csg-Id"] = csg_Id.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(accessMode)
	{
		dict[@"accessMode"] = accessMode.objectValue;
	}
	if(cmi)
	{
		dict[@"cmi"] = cmi.objectValue;
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


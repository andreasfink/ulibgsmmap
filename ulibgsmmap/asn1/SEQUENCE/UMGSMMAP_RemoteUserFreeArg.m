//
//  UMGSMMAP_RemoteUserFreeArg.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_RemoteUserFreeArg.h>

@implementation UMGSMMAP_RemoteUserFreeArg


@synthesize	operationName;
@synthesize	imsi;
@synthesize	callInfo;
@synthesize	ccbs_Feature;
@synthesize	translatedB_Number;
@synthesize	replaceB_Number;
@synthesize	alertingPattern;
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
	if(callInfo)
	{
		callInfo.asn1_tag.tagNumber = 1;
		callInfo.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:callInfo];
	}
	if(ccbs_Feature)
	{
		ccbs_Feature.asn1_tag.tagNumber = 2;
		ccbs_Feature.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:ccbs_Feature];
	}
	if(translatedB_Number)
	{
		translatedB_Number.asn1_tag.tagNumber = 3;
		translatedB_Number.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:translatedB_Number];
	}
	if(replaceB_Number)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 4;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(alertingPattern)
	{
		alertingPattern.asn1_tag.tagNumber = 5;
		alertingPattern.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:alertingPattern];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 6;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_RemoteUserFreeArg *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_RemoteUserFreeArg"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		imsi = [[UMGSMMAP_IMSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		callInfo = [[UMGSMMAP_ExternalSignalInfo alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ccbs_Feature = [[UMGSMMAP_CCBS_Feature alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		translatedB_Number = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		replaceB_Number = YES;
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		alertingPattern = [[UMGSMMAP_AlertingPattern alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 6) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
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
	return @"RemoteUserFreeArg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(imsi)
	{
		dict[@"imsi"] = imsi.objectValue;
	}
	if(callInfo)
	{
		dict[@"callInfo"] = callInfo.objectValue;
	}
	if(ccbs_Feature)
	{
		dict[@"ccbs-Feature"] = ccbs_Feature.objectValue;
	}
	if(translatedB_Number)
	{
		dict[@"translatedB-Number"] = translatedB_Number.objectValue;
	}
	if(replaceB_Number)
	{
		dict[@"replaceB-Number"] = @(YES);
	}
	if(alertingPattern)
	{
		dict[@"alertingPattern"] = alertingPattern.objectValue;
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


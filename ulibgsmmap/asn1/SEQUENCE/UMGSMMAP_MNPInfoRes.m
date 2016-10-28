//
//  UMGSMMAP_MNPInfoRes.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_MNPInfoRes.h"

@implementation UMGSMMAP_MNPInfoRes


@synthesize	operationName;
@synthesize	routeingNumber;
@synthesize	imsi;
@synthesize	msisdn;
@synthesize	numberPortabilityStatus;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(routeingNumber)
	{
		routeingNumber.asn1_tag.tagNumber = 0;
		routeingNumber.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:routeingNumber];
	}
	if(imsi)
	{
		imsi.asn1_tag.tagNumber = 1;
		imsi.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:imsi];
	}
	if(msisdn)
	{
		msisdn.asn1_tag.tagNumber = 2;
		msisdn.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:msisdn];
	}
	if(numberPortabilityStatus)
	{
		numberPortabilityStatus.asn1_tag.tagNumber = 3;
		numberPortabilityStatus.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:numberPortabilityStatus];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 4;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_MNPInfoRes *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_MNPInfoRes"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		routeingNumber = [[UMGSMMAP_RouteingNumber alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		imsi = [[UMGSMMAP_IMSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		msisdn = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		numberPortabilityStatus = [[UMGSMMAP_NumberPortabilityStatus alloc]initWithASN1Object:o context:context];
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
	return @"MNPInfoRes";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(routeingNumber)
	{
		dict[@"routeingNumber"] = routeingNumber.objectValue;
	}
	if(imsi)
	{
		dict[@"imsi"] = imsi.objectValue;
	}
	if(msisdn)
	{
		dict[@"msisdn"] = msisdn.objectValue;
	}
	if(numberPortabilityStatus)
	{
		dict[@"numberPortabilityStatus"] = numberPortabilityStatus.objectValue;
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


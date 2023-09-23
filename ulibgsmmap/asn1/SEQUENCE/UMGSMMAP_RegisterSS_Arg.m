//
//  UMGSMMAP_RegisterSS_Arg.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_RegisterSS_Arg.h>

@implementation UMGSMMAP_RegisterSS_Arg


@synthesize	operationName;
@synthesize	ss_Code;
@synthesize	basicService;
@synthesize	forwardedToNumber;
@synthesize	forwardedToSubaddress;
@synthesize	noReplyConditionTime;
@synthesize	defaultPriority;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(ss_Code)
	{
		[asn1_list addObject:ss_Code];
	}
	if(basicService)
	{
		[asn1_list addObject:basicService];
	}
	if(forwardedToNumber)
	{
		forwardedToNumber.asn1_tag.tagNumber = 4;
		forwardedToNumber.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:forwardedToNumber];
	}
	if(forwardedToSubaddress)
	{
		forwardedToSubaddress.asn1_tag.tagNumber = 6;
		forwardedToSubaddress.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:forwardedToSubaddress];
	}
	if(noReplyConditionTime)
	{
		noReplyConditionTime.asn1_tag.tagNumber = 5;
		noReplyConditionTime.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:noReplyConditionTime];
	}
	if(defaultPriority)
	{
		defaultPriority.asn1_tag.tagNumber = 7;
		defaultPriority.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:defaultPriority];
	}
}


- (UMGSMMAP_RegisterSS_Arg *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_RegisterSS_Arg"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		ss_Code = [[UMGSMMAP_SS_Code alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		basicService = [[UMGSMMAP_BasicServiceCode alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		forwardedToNumber = [[UMGSMMAP_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 6) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		forwardedToSubaddress = [[UMGSMMAP_ISDN_SubaddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		noReplyConditionTime = [[UMGSMMAP_NoReplyConditionTime alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if((o) && (o.asn1_tag.tagNumber == 7) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			defaultPriority = [[UMGSMMAP_EMLPP_Priority alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
	}
	return self;
}

- (NSString *) objectName
{
	return @"RegisterSS-Arg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(ss_Code)
	{
		dict[@"ss-Code"] = ss_Code.objectValue;
	}
	if(basicService)
	{
		dict[@"basicService"] = basicService.objectValue;
	}
	if(forwardedToNumber)
	{
		dict[@"forwardedToNumber"] = forwardedToNumber.objectValue;
	}
	if(forwardedToSubaddress)
	{
		dict[@"forwardedToSubaddress"] = forwardedToSubaddress.objectValue;
	}
	if(noReplyConditionTime)
	{
		dict[@"noReplyConditionTime"] = noReplyConditionTime.objectValue;
	}
	if(defaultPriority)
	{
		dict[@"defaultPriority"] = defaultPriority.objectValue;
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


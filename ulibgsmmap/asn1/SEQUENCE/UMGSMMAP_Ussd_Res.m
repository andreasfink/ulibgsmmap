//
//  UMGSMMAP_Ussd_Res.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_Ussd_Res.h>

@implementation UMGSMMAP_Ussd_Res


@synthesize	operationName;
@synthesize	ussd_DataCodingScheme;
@synthesize	ussd_String;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(ussd_DataCodingScheme)
	{
		[asn1_list addObject:ussd_DataCodingScheme];
	}
	if(ussd_String)
	{
		[asn1_list addObject:ussd_String];
	}
}


- (UMGSMMAP_Ussd_Res *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_Ussd_Res"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		ussd_DataCodingScheme = [[UMGSMMAP_USSD_DataCodingScheme alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		ussd_String = [[UMGSMMAP_USSD_String alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
	}
	return self;
}

- (NSString *) objectName
{
	return @"Ussd-Res";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(ussd_DataCodingScheme)
	{
		dict[@"ussd-DataCodingScheme"] = ussd_DataCodingScheme.objectValue;
	}
	if(ussd_String)
	{
		dict[@"ussd-String"] = ussd_String.objectValue;
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


//
//  UMGSMMAP_IMSI_WithLMSI.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_IMSI_WithLMSI.h"

@implementation UMGSMMAP_IMSI_WithLMSI


@synthesize	operationName;
@synthesize	imsi;
@synthesize	lmsi;


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
}


- (UMGSMMAP_IMSI_WithLMSI *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_IMSI_WithLMSI"];
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
	while(o)
	{
	}
	return self;
}

- (NSString *) objectName
{
	return @"IMSI-WithLMSI";
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


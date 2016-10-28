//
//  UMGSMMAP_UMTS_SecurityContextData.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_UMTS_SecurityContextData.h"

@implementation UMGSMMAP_UMTS_SecurityContextData


@synthesize	operationName;
@synthesize	ck;
@synthesize	ik;
@synthesize	ksi;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(ck)
	{
		[asn1_list addObject:ck];
	}
	if(ik)
	{
		[asn1_list addObject:ik];
	}
	if(ksi)
	{
		[asn1_list addObject:ksi];
	}
}


- (UMGSMMAP_UMTS_SecurityContextData *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_UMTS_SecurityContextData"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		ck = [[UMGSMMAP_CK alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		ik = [[UMGSMMAP_IK alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		ksi = [[UMGSMMAP_KSI alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
	}
	return self;
}

- (NSString *) objectName
{
	return @"UMTS_SecurityContextData";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(ck)
	{
		dict[@"ck"] = ck.objectValue;
	}
	if(ik)
	{
		dict[@"ik"] = ik.objectValue;
	}
	if(ksi)
	{
		dict[@"ksi"] = ksi.objectValue;
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


//
//  UMGSMMAP_GSM_SecurityContextData.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_GSM_SecurityContextData.h>

@implementation UMGSMMAP_GSM_SecurityContextData


@synthesize	operationName;
@synthesize	kc;
@synthesize	cksn;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(kc)
	{
		[asn1_list addObject:kc];
	}
	if(cksn)
	{
		[asn1_list addObject:cksn];
	}
}


- (UMGSMMAP_GSM_SecurityContextData *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_GSM_SecurityContextData"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		kc = [[UMGSMMAP_Kc alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		cksn = [[UMGSMMAP_CKSN alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
	}
	return self;
}

- (NSString *) objectName
{
	return @"GSM-SecurityContextData";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(kc)
	{
		dict[@"kc"] = kc.objectValue;
	}
	if(cksn)
	{
		dict[@"cksn"] = cksn.objectValue;
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


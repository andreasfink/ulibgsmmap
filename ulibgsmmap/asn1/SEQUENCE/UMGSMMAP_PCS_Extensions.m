//
//  UMGSMMAP_PCS_Extensions.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_PCS_Extensions.h>

@implementation UMGSMMAP_PCS_Extensions


@synthesize	operationName;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
}


- (UMGSMMAP_PCS_Extensions *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_PCS_Extensions"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	while(o)
	{
	}
	return self;
}

- (NSString *) objectName
{
	return @"PCS-Extensions";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
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


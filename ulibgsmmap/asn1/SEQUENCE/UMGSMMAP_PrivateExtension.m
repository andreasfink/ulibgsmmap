//
//  UMGSMMAP_PrivateExtension.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_PrivateExtension.h>

@implementation UMGSMMAP_PrivateExtension


@synthesize	operationName;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
}


- (UMGSMMAP_PrivateExtension *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_PrivateExtension"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	while(o)
	{
	}
	return self;
}

- (NSString *) objectName
{
	return @"PrivateExtension";
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


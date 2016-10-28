//
//  UMGSMMAP_AbsentSubscriberParam.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_AbsentSubscriberParam.h"

@implementation UMGSMMAP_AbsentSubscriberParam


@synthesize	operationName;
@synthesize	extensionContainer;
@synthesize	absentSubscriberReason;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(extensionContainer)
	{
		[asn1_list addObject:extensionContainer];
	}
	if(absentSubscriberReason)
	{
		absentSubscriberReason.asn1_tag.tagNumber = 0;
		absentSubscriberReason.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:absentSubscriberReason];
	}
}


- (UMGSMMAP_AbsentSubscriberParam *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_AbsentSubscriberParam"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			absentSubscriberReason = [[UMGSMMAP_AbsentSubscriberReason alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
	}
	return self;
}

- (NSString *) objectName
{
	return @"AbsentSubscriberParam";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(absentSubscriberReason)
	{
		dict[@"absentSubscriberReason"] = absentSubscriberReason.objectValue;
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


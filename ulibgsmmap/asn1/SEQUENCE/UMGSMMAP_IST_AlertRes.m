//
//  UMGSMMAP_IST_AlertRes.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_IST_AlertRes.h"

@implementation UMGSMMAP_IST_AlertRes


@synthesize	operationName;
@synthesize	istAlertTimer;
@synthesize	istInformationWithdraw;
@synthesize	callTerminationIndicator;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(istAlertTimer)
	{
		istAlertTimer.asn1_tag.tagNumber = 0;
		istAlertTimer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:istAlertTimer];
	}
	if(istInformationWithdraw)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 1;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(callTerminationIndicator)
	{
		callTerminationIndicator.asn1_tag.tagNumber = 2;
		callTerminationIndicator.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:callTerminationIndicator];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 3;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_IST_AlertRes *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_IST_AlertRes"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		istAlertTimer = [[UMASN1Integer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		istInformationWithdraw = YES;
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		callTerminationIndicator = [[UMASN1Boolean alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
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
	return @"IST-AlertRes";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(istAlertTimer)
	{
		dict[@"istAlertTimer"] = istAlertTimer.objectValue;
	}
	if(istInformationWithdraw)
	{
		dict[@"istInformationWithdraw"] = @(YES);
	}
	if(callTerminationIndicator)
	{
		dict[@"callTerminationIndicator"] = callTerminationIndicator.objectValue;
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


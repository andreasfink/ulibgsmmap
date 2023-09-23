//
//  UMGSMMAP_LCS_QoS.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_LCS_QoS.h>

@implementation UMGSMMAP_LCS_QoS


@synthesize	operationName;
@synthesize	horizontal_accuracy;
@synthesize	verticalCoordinateRequest;
@synthesize	vertical_accuracy;
@synthesize	responseTime;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(horizontal_accuracy)
	{
		horizontal_accuracy.asn1_tag.tagNumber = 0;
		horizontal_accuracy.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:horizontal_accuracy];
	}
	if(verticalCoordinateRequest)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 1;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(vertical_accuracy)
	{
		vertical_accuracy.asn1_tag.tagNumber = 2;
		vertical_accuracy.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:vertical_accuracy];
	}
	if(responseTime)
	{
		responseTime.asn1_tag.tagNumber = 3;
		responseTime.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:responseTime];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 4;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_LCS_QoS *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_LCS_QoS"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		horizontal_accuracy = [[UMGSMMAP_Horizontal_Accuracy alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		verticalCoordinateRequest = YES;
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		vertical_accuracy = [[UMGSMMAP_Vertical_Accuracy alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		responseTime = [[UMGSMMAP_ResponseTime alloc]initWithASN1Object:o context:context];
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
	return @"LCS-QoS";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(horizontal_accuracy)
	{
		dict[@"horizontal-accuracy"] = horizontal_accuracy.objectValue;
	}
	if(verticalCoordinateRequest)
	{
		dict[@"verticalCoordinateRequest"] = @(YES);
	}
	if(vertical_accuracy)
	{
		dict[@"vertical-accuracy"] = vertical_accuracy.objectValue;
	}
	if(responseTime)
	{
		dict[@"responseTime"] = responseTime.objectValue;
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


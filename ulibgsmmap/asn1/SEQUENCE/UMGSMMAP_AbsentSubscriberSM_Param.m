//
//  UMGSMMAP_AbsentSubscriberSM_Param.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_AbsentSubscriberSM_Param.h>

@implementation UMGSMMAP_AbsentSubscriberSM_Param


@synthesize	operationName;
@synthesize	absentSubscriberDiagnosticSM;
@synthesize	extensionContainer;
@synthesize	additionalAbsentSubscriberDiagnosticSM;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(absentSubscriberDiagnosticSM)
	{
		[asn1_list addObject:absentSubscriberDiagnosticSM];
	}
	if(extensionContainer)
	{
		[asn1_list addObject:extensionContainer];
	}
	if(additionalAbsentSubscriberDiagnosticSM)
	{
		additionalAbsentSubscriberDiagnosticSM.asn1_tag.tagNumber = 0;
		additionalAbsentSubscriberDiagnosticSM.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:additionalAbsentSubscriberDiagnosticSM];
	}
}


- (UMGSMMAP_AbsentSubscriberSM_Param *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_AbsentSubscriberSM_Param"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		absentSubscriberDiagnosticSM = [[UMGSMMAP_AbsentSubscriberDiagnosticSM alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			additionalAbsentSubscriberDiagnosticSM = [[UMGSMMAP_AbsentSubscriberDiagnosticSM alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
	}
	return self;
}

- (NSString *) objectName
{
	return @"AbsentSubscriberSM-Param";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(absentSubscriberDiagnosticSM)
	{
		dict[@"absentSubscriberDiagnosticSM"] = absentSubscriberDiagnosticSM.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(additionalAbsentSubscriberDiagnosticSM)
	{
		dict[@"additionalAbsentSubscriberDiagnosticSM"] = additionalAbsentSubscriberDiagnosticSM.objectValue;
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


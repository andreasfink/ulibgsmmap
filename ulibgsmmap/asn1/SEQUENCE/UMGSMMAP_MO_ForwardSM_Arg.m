//
//  UMGSMMAP_MO_ForwardSM_Arg.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_MO_ForwardSM_Arg.h>

@implementation UMGSMMAP_MO_ForwardSM_Arg


@synthesize	operationName;
@synthesize	sm_RP_DA;
@synthesize	sm_RP_OA;
@synthesize	sm_RP_UI;
@synthesize	extensionContainer;
@synthesize	imsi;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(sm_RP_DA)
	{
		[asn1_list addObject:sm_RP_DA];
	}
	if(sm_RP_OA)
	{
		[asn1_list addObject:sm_RP_OA];
	}
	if(sm_RP_UI)
	{
		[asn1_list addObject:sm_RP_UI];
	}
	if(extensionContainer)
	{
		[asn1_list addObject:extensionContainer];
	}
	if(imsi)
	{
		[asn1_list addObject:imsi];
	}
}


- (UMGSMMAP_MO_ForwardSM_Arg *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_MO_ForwardSM_Arg"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		sm_RP_DA = [[UMGSMMAP_SM_RP_DA alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		sm_RP_OA = [[UMGSMMAP_SM_RP_OA alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		sm_RP_UI = [[UMGSMMAP_SignalInfo alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if(o)
		{
			imsi = [[UMGSMMAP_IMSI alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
	}
	return self;
}

- (NSString *) objectName
{
	return @"MO-ForwardSM-Arg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(sm_RP_DA)
	{
		dict[@"sm-RP-DA"] = sm_RP_DA.objectValue;
	}
	if(sm_RP_OA)
	{
		dict[@"sm-RP-OA"] = sm_RP_OA.objectValue;
	}
	if(sm_RP_UI)
	{
		dict[@"sm-RP-UI"] = sm_RP_UI.objectValue;
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(imsi)
	{
		dict[@"imsi"] = imsi.objectValue;
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


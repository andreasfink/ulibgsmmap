//
//  UMGSMMAP_PrepareHO_Arg.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_PrepareHO_Arg.h"

@implementation UMGSMMAP_PrepareHO_Arg


@synthesize	operationName;
@synthesize	targetCellId;
@synthesize	ho_NumberNotRequired;
@synthesize	bss_APDU;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(targetCellId)
	{
		[asn1_list addObject:targetCellId];
	}
	if(ho_NumberNotRequired)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = -1;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(bss_APDU)
	{
		[asn1_list addObject:bss_APDU];
	}
}


- (UMGSMMAP_PrepareHO_Arg *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_PrepareHO_Arg"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		targetCellId = [[UMGSMMAP_GlobalCellId alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		ho_NumberNotRequired = YES;
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		bss_APDU = [[UMGSMMAP_ExternalSignalInfo alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
	}
	return self;
}

- (NSString *) objectName
{
	return @"PrepareHO-Arg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(targetCellId)
	{
		dict[@"targetCellId"] = targetCellId.objectValue;
	}
	if(ho_NumberNotRequired)
	{
		dict[@"ho-NumberNotRequired"] = @(YES);
	}
	if(bss_APDU)
	{
		dict[@"bss-APDU"] = bss_APDU.objectValue;
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


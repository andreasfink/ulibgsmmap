//
//  UMGSMMAP_ODB_Data.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_ODB_Data.h"

@implementation UMGSMMAP_ODB_Data


@synthesize	operationName;
@synthesize	odb_GeneralData;
@synthesize	odb_HPLMN_Data;
@synthesize	extensionContainer;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(odb_GeneralData)
	{
		[asn1_list addObject:odb_GeneralData];
	}
	if(odb_HPLMN_Data)
	{
		[asn1_list addObject:odb_HPLMN_Data];
	}
	if(extensionContainer)
	{
		[asn1_list addObject:extensionContainer];
	}
}


- (UMGSMMAP_ODB_Data *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_ODB_Data"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		odb_GeneralData = [[UMGSMMAP_ODB_GeneralData alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		odb_HPLMN_Data = [[UMGSMMAP_ODB_HPLMN_Data alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
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
	return @"ODB-Data";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(odb_GeneralData)
	{
		dict[@"odb-GeneralData"] = odb_GeneralData.objectValue;
	}
	if(odb_HPLMN_Data)
	{
		dict[@"odb-HPLMN-Data"] = odb_HPLMN_Data.objectValue;
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


//
//  UMGSMMAP_CellIdOrLAI.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_CellIdOrLAI.h"

@implementation UMGSMMAP_CellIdOrLAI


@synthesize	operationName;
@synthesize	cellIdFixedLength;
@synthesize	laiFixedLength;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(cellIdFixedLength)
	{
		cellIdFixedLength.asn1_tag.tagNumber = 0;
		cellIdFixedLength.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:cellIdFixedLength];
	}
	else if(laiFixedLength)
	{
		laiFixedLength.asn1_tag.tagNumber = 1;
		laiFixedLength.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:laiFixedLength];
	}
	 else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_CellIdOrLAI choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_CellIdOrLAI *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_CellIdOrLAI"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		cellIdFixedLength = [[UMGSMMAP_CellIdFixedLength alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		laiFixedLength = [[UMGSMMAP_LAIFixedLength alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"CellIdOrLAI";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(cellIdFixedLength)
	{
		dict[@"cellIdFixedLength"] = cellIdFixedLength.objectValue;
	}
	if(laiFixedLength)
	{
		dict[@"laiFixedLength"] = laiFixedLength.objectValue;
	}
	return dict;
}



@end


//
//  UMGSMMAP_Additional_Number.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_Additional_Number.h>

@implementation UMGSMMAP_Additional_Number


@synthesize	operationName;
@synthesize	msc_Number;
@synthesize	sgsn_Number;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(msc_Number)
	{
		msc_Number.asn1_tag.tagNumber = 0;
		msc_Number.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:msc_Number];
	}
	else if(sgsn_Number)
	{
		sgsn_Number.asn1_tag.tagNumber = 1;
		sgsn_Number.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:sgsn_Number];
	}
	 else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_Additional_Number choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_Additional_Number *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_Additional_Number"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		msc_Number = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		sgsn_Number = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"Additional-Number";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(msc_Number)
	{
		dict[@"msc-Number"] = msc_Number.objectValue;
	}
	if(sgsn_Number)
	{
		dict[@"sgsn-Number"] = sgsn_Number.objectValue;
	}
	return dict;
}



@end


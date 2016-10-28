//
//  UMGSMMAP_AuthenticationSetList.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_AuthenticationSetList.h"

@implementation UMGSMMAP_AuthenticationSetList


@synthesize	operationName;
@synthesize	tripletList;
@synthesize	quintupletList;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(tripletList)
	{
		tripletList.asn1_tag.tagNumber = 0;
		tripletList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:tripletList];
	}
	else if(quintupletList)
	{
		quintupletList.asn1_tag.tagNumber = 1;
		quintupletList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:quintupletList];
	}
	 else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_AuthenticationSetList choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_AuthenticationSetList *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_AuthenticationSetList"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		tripletList = [[UMGSMMAP_AuthenticationTripletList alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		quintupletList = [[UMGSMMAP_AuthenticationQuintupletList alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"AuthenticationSetList";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(tripletList)
	{
		dict[@"tripletList"] = tripletList.objectValue;
	}
	if(quintupletList)
	{
		dict[@"quintupletList"] = quintupletList.objectValue;
	}
	return dict;
}



@end


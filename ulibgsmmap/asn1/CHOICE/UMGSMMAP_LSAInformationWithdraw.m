//
//  UMGSMMAP_LSAInformationWithdraw.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibgsmmap/UMGSMMAP_LSAInformationWithdraw.h>

@implementation UMGSMMAP_LSAInformationWithdraw


@synthesize	operationName;
@synthesize	allLSAData;
@synthesize	lsaIdentityList;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(allLSAData)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = -1;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	else if(lsaIdentityList)
	{
		[asn1_list addObject:lsaIdentityList];
	}
	 else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_LSAInformationWithdraw choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_LSAInformationWithdraw *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_LSAInformationWithdraw"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		allLSAData = YES;
	}
	else if(o)
	{
		lsaIdentityList = [[UMGSMMAP_LSAIdentityList alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"LSAInformationWithdraw";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(allLSAData)
	{
		dict[@"allLSAData"] = @(YES);
	}
	if(lsaIdentityList)
	{
		dict[@"lsaIdentityList"] = lsaIdentityList.objectValue;
	}
	return dict;
}



@end


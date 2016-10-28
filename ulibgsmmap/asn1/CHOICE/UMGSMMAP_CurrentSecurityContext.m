//
//  UMGSMMAP_CurrentSecurityContext.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_CurrentSecurityContext.h"

@implementation UMGSMMAP_CurrentSecurityContext


@synthesize	operationName;
@synthesize	gsm_SecurityContextData;
@synthesize	umts_SecurityContextData;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(gsm_SecurityContextData)
	{
		gsm_SecurityContextData.asn1_tag.tagNumber = 0;
		gsm_SecurityContextData.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:gsm_SecurityContextData];
	}
	else if(umts_SecurityContextData)
	{
		umts_SecurityContextData.asn1_tag.tagNumber = 1;
		umts_SecurityContextData.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:umts_SecurityContextData];
	}
	 else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_CurrentSecurityContext choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_CurrentSecurityContext *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_CurrentSecurityContext"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		gsm_SecurityContextData = [[UMGSMMAP_GSM_SecurityContextData alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		umts_SecurityContextData = [[UMGSMMAP_UMTS_SecurityContextData alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"CurrentSecurityContext";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(gsm_SecurityContextData)
	{
		dict[@"gsm-SecurityContextData"] = gsm_SecurityContextData.objectValue;
	}
	if(umts_SecurityContextData)
	{
		dict[@"umts-SecurityContextData"] = umts_SecurityContextData.objectValue;
	}
	return dict;
}



@end


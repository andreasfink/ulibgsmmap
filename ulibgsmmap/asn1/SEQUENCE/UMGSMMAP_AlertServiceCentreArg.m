//
//  UMGSMMAP_AlertServiceCentreArg.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import "UMGSMMAP_AlertServiceCentreArg.h"

@implementation UMGSMMAP_AlertServiceCentreArg


@synthesize	operationName;
@synthesize	msisdn;
@synthesize	serviceCentreAddress;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(msisdn)
	{
		[asn1_list addObject:msisdn];
	}
	if(serviceCentreAddress)
	{
		[asn1_list addObject:serviceCentreAddress];
	}
}


- (UMGSMMAP_AlertServiceCentreArg *) processAfterDecodeWithContext:(id)context
{
	[self setMagic:@"UMGSMMAP_AlertServiceCentreArg"];
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if(o)
	{
		msisdn = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	if(o)
	{
		serviceCentreAddress = [[UMGSMMAP_AddressString alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
	}
	return self;
}

- (NSString *) objectName
{
	return @"AlertServiceCentreArg";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(msisdn)
	{
		dict[@"msisdn"] = msisdn.objectValue;
	}
	if(serviceCentreAddress)
	{
		dict[@"serviceCentreAddress"] = serviceCentreAddress.objectValue;
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


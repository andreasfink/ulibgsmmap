//
//  UMGSMMAP_BasicServiceCode.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_BasicServiceCode.h"

@implementation UMGSMMAP_BasicServiceCode


@synthesize	operationName;
@synthesize	bearerService;
@synthesize	teleservice;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	BOOL isImplicit = YES;
	if(self.asn1_tag.tagClass == UMASN1Class_ContextSpecific)
	{
		isImplicit = NO;
		asn1_tag.isConstructed=YES;
		asn1_list = [[NSMutableArray alloc]init];
	}
	if(bearerService)
	{
		[bearerService processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 2;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = bearerService.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [bearerService.asn1_list copy];
			}
			else
			{
				self.asn1_data = [bearerService.asn1_data copy];
			}
		}
		else
		{
			bearerService.asn1_tag.tagNumber = 2;
			bearerService.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[asn1_list addObject:bearerService];
		}
	}
	else if(teleservice)
	{
		[teleservice processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 3;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = teleservice.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [teleservice.asn1_list copy];
			}
			else
			{
				self.asn1_data = [teleservice.asn1_data copy];
			}
		}
		else
		{
			teleservice.asn1_tag.tagNumber = 3;
			teleservice.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[asn1_list addObject:teleservice];
		}
	}
	else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_BasicServiceCode choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_BasicServiceCode *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o;
	BOOL isImplicit = YES;
	if(self.asn1_tag.tagClass == UMASN1Class_ContextSpecific)
	{
		isImplicit = NO;
		o = [self getObjectAtPosition:p++];
	}
	else
	{
		o = self;
	}
	
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		bearerService = [[UMGSMMAP_BearerServiceCode alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		teleservice = [[UMGSMMAP_TeleserviceCode alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"BasicServiceCode";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(bearerService)
	{
		dict[@"bearerService"] = bearerService.objectValue;
	}
	if(teleservice)
	{
		dict[@"teleservice"] = teleservice.objectValue;
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


//
//  UMGSMMAP_Additional_Number.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_Additional_Number.h"

@implementation UMGSMMAP_Additional_Number


@synthesize	operationName;
@synthesize	msc_Number;
@synthesize	sgsn_Number;


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
	if(msc_Number)
	{
		[msc_Number processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 0;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = msc_Number.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [msc_Number.asn1_list copy];
			}
			else
			{
				self.asn1_data = [msc_Number.asn1_data copy];
			}
		}
		else
		{
			msc_Number.asn1_tag.tagNumber = 0;
			msc_Number.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[asn1_list addObject:msc_Number];
		}
	}
	else if(sgsn_Number)
	{
		[sgsn_Number processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 1;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = sgsn_Number.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [sgsn_Number.asn1_list copy];
			}
			else
			{
				self.asn1_data = [sgsn_Number.asn1_data copy];
			}
		}
		else
		{
			sgsn_Number.asn1_tag.tagNumber = 1;
			sgsn_Number.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[asn1_list addObject:sgsn_Number];
		}
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

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}


@end


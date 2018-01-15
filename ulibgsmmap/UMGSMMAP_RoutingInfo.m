//
//  UMGSMMAP_RoutingInfo.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_RoutingInfo.h"

@implementation UMGSMMAP_RoutingInfo


@synthesize	operationName;
@synthesize	roamingNumber;
@synthesize	forwardingData;


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
	if(roamingNumber)
	{
		[roamingNumber processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = roamingNumber.asn1_tag.tagNumber;
			self.asn1_tag.tagClass = roamingNumber.asn1_tag.tagClass;
			self.asn1_tag.isConstructed = roamingNumber.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_data = [roamingNumber.asn1_data copy];
			}
			else
			{
				self.asn1_list = [roamingNumber.asn1_list copy];
			}
		}
		else
		{
			[asn1_list addObject:roamingNumber];
		}
	}
	else if(forwardingData)
	{
		[forwardingData processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = forwardingData.asn1_tag.tagNumber;
			self.asn1_tag.tagClass = forwardingData.asn1_tag.tagClass;
			self.asn1_tag.isConstructed = forwardingData.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_data = [forwardingData.asn1_data copy];
			}
			else
			{
				self.asn1_list = [forwardingData.asn1_list copy];
			}
		}
		else
		{
			[asn1_list addObject:forwardingData];
		}
	}
	else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_RoutingInfo choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_RoutingInfo *) processAfterDecodeWithContext:(id)context
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
	
	if((o) && ([UMGSMMAP_ISDN_AddressString tagMatches:o.asn1_tag.tagNumber]) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
	{
		roamingNumber = [[UMGSMMAP_ISDN_AddressString alloc]initWithASN1Object:o context:context];
	}
	else if((o) && ([UMGSMMAP_ForwardingData tagMatches:o.asn1_tag.tagNumber]) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
	{
		forwardingData = [[UMGSMMAP_ForwardingData alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"RoutingInfo";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(roamingNumber)
	{
		dict[@"roamingNumber"] = roamingNumber.objectValue;
	}
	if(forwardingData)
	{
		dict[@"forwardingData"] = forwardingData.objectValue;
	}
	return dict;
}

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}


@end


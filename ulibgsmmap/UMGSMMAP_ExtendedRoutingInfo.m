//
//  UMGSMMAP_ExtendedRoutingInfo.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_ExtendedRoutingInfo.h>

@implementation UMGSMMAP_ExtendedRoutingInfo


@synthesize	operationName;
@synthesize	routingInfo;
@synthesize	camelRoutingInfo;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	BOOL isImplicit = YES;
	if(self.asn1_tag.tagClass == UMASN1Class_ContextSpecific)
	{
		isImplicit = NO;
		_asn1_tag.isConstructed=YES;
		_asn1_list = [[NSMutableArray alloc]init];
	}
	if(routingInfo)
	{
		[routingInfo processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = routingInfo.asn1_tag.tagNumber;
			self.asn1_tag.tagClass = routingInfo.asn1_tag.tagClass;
			self.asn1_tag.isConstructed = routingInfo.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_data = [routingInfo.asn1_data copy];
			}
			else
			{
				self.asn1_list = [routingInfo.asn1_list copy];
			}
		}
		else
		{
			[_asn1_list addObject:routingInfo];
		}
	}
	else if(camelRoutingInfo)
	{
		[camelRoutingInfo processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 8;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = camelRoutingInfo.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [camelRoutingInfo.asn1_list copy];
			}
			else
			{
				self.asn1_data = [camelRoutingInfo.asn1_data copy];
			}
		}
		else
		{
			camelRoutingInfo.asn1_tag.tagNumber = 8;
			camelRoutingInfo.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:camelRoutingInfo];
		}
	}
	else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_ExtendedRoutingInfo choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_ExtendedRoutingInfo *) processAfterDecodeWithContext:(id)context
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
	
	if((o) && ([UMGSMMAP_RoutingInfo tagMatches:o.asn1_tag.tagNumber]) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
	{
		routingInfo = [[UMGSMMAP_RoutingInfo alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 8) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		camelRoutingInfo = [[UMGSMMAP_CamelRoutingInfo alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"ExtendedRoutingInfo";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(routingInfo)
	{
		dict[@"routingInfo"] = routingInfo.objectValue;
	}
	if(camelRoutingInfo)
	{
		dict[@"camelRoutingInfo"] = camelRoutingInfo.objectValue;
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


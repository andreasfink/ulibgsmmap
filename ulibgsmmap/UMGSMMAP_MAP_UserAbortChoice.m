//
//  UMGSMMAP_MAP_UserAbortChoice.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_MAP_UserAbortChoice.h"

@implementation UMGSMMAP_MAP_UserAbortChoice


@synthesize	operationName;
@synthesize	userSpecificReason;
@synthesize	userResourceLimitation;
@synthesize	resourceUnavailable;
@synthesize	applicationProcedureCancellation;


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
	if(userSpecificReason)
	{
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 0;
			self.asn1_tag.tagClass = UMASN1Class_Universal;
			self.asn1_tag.isConstructed = NO;
			self.asn1_data = [NSData data];
			self.asn1_list = NULL;
		}
		else
		{
			UMASN1Null *n = [[UMASN1Null alloc]init];
			n.asn1_tag.tagNumber = 0;
			n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:n];
		}
	}
	else if(userResourceLimitation)
	{
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 1;
			self.asn1_tag.tagClass = UMASN1Class_Universal;
			self.asn1_tag.isConstructed = NO;
			self.asn1_data = [NSData data];
			self.asn1_list = NULL;
		}
		else
		{
			UMASN1Null *n = [[UMASN1Null alloc]init];
			n.asn1_tag.tagNumber = 1;
			n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:n];
		}
	}
	else if(resourceUnavailable)
	{
		[resourceUnavailable processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 2;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = resourceUnavailable.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [resourceUnavailable.asn1_list copy];
			}
			else
			{
				self.asn1_data = [resourceUnavailable.asn1_data copy];
			}
		}
		else
		{
			resourceUnavailable.asn1_tag.tagNumber = 2;
			resourceUnavailable.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:resourceUnavailable];
		}
	}
	else if(applicationProcedureCancellation)
	{
		[applicationProcedureCancellation processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 3;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = applicationProcedureCancellation.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [applicationProcedureCancellation.asn1_list copy];
			}
			else
			{
				self.asn1_data = [applicationProcedureCancellation.asn1_data copy];
			}
		}
		else
		{
			applicationProcedureCancellation.asn1_tag.tagNumber = 3;
			applicationProcedureCancellation.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:applicationProcedureCancellation];
		}
	}
	else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_MAP_UserAbortChoice choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_MAP_UserAbortChoice *) processAfterDecodeWithContext:(id)context
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
		userSpecificReason = YES;
	}
	else if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		userResourceLimitation = YES;
	}
	else if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		resourceUnavailable = [[UMGSMMAP_ResourceUnavailableReason alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		applicationProcedureCancellation = [[UMGSMMAP_ProcedureCancellationReason alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"MAP-UserAbortChoice";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(userSpecificReason)
	{
		dict[@"userSpecificReason"] = @(YES);
	}
	if(userResourceLimitation)
	{
		dict[@"userResourceLimitation"] = @(YES);
	}
	if(resourceUnavailable)
	{
		dict[@"resourceUnavailable"] = resourceUnavailable.objectValue;
	}
	if(applicationProcedureCancellation)
	{
		dict[@"applicationProcedureCancellation"] = applicationProcedureCancellation.objectValue;
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


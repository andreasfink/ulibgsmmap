//
//  UMGSMMAP_Code.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_Code.h"

@implementation UMGSMMAP_Code


@synthesize	operationName;
@synthesize	local;
@synthesize	global;


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
	if(local)
	{
		[local processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = local.asn1_tag.tagNumber;
			self.asn1_tag.tagClass = local.asn1_tag.tagClass;
			self.asn1_tag.isConstructed = local.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_data = [local.asn1_data copy];
			}
			else
			{
				self.asn1_list = [local.asn1_list copy];
			}
		}
		else
		{
			[_asn1_list addObject:local];
		}
	}
	else if(global)
	{
		[global processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = global.asn1_tag.tagNumber;
			self.asn1_tag.tagClass = global.asn1_tag.tagClass;
			self.asn1_tag.isConstructed = global.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_data = [global.asn1_data copy];
			}
			else
			{
				self.asn1_list = [global.asn1_list copy];
			}
		}
		else
		{
			[_asn1_list addObject:global];
		}
	}
	else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_Code choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_Code *) processAfterDecodeWithContext:(id)context
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
	
	if((o) && ([UMASN1Integer tagMatches:o.asn1_tag.tagNumber]) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
	{
		local = [[UMASN1Integer alloc]initWithASN1Object:o context:context];
	}
	else if((o) && ([UMASN1Object tagMatches:o.asn1_tag.tagNumber]) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
	{
		global = [[UMASN1Object alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"Code";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(local)
	{
		dict[@"local"] = local.objectValue;
	}
	if(global)
	{
		dict[@"global"] = global.objectValue;
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


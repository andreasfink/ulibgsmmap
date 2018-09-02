//
//  UMGSMMAP_SystemFailureParam.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_SystemFailureParam.h"

@implementation UMGSMMAP_SystemFailureParam


@synthesize	operationName;
@synthesize	networkResource;
@synthesize	extensibleSystemFailureParam;


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
	if(networkResource)
	{
		[networkResource processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = networkResource.asn1_tag.tagNumber;
			self.asn1_tag.tagClass = networkResource.asn1_tag.tagClass;
			self.asn1_tag.isConstructed = networkResource.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_data = [networkResource.asn1_data copy];
			}
			else
			{
				self.asn1_list = [networkResource.asn1_list copy];
			}
		}
		else
		{
			[_asn1_list addObject:networkResource];
		}
	}
	else if(extensibleSystemFailureParam)
	{
		[extensibleSystemFailureParam processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = extensibleSystemFailureParam.asn1_tag.tagNumber;
			self.asn1_tag.tagClass = extensibleSystemFailureParam.asn1_tag.tagClass;
			self.asn1_tag.isConstructed = extensibleSystemFailureParam.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_data = [extensibleSystemFailureParam.asn1_data copy];
			}
			else
			{
				self.asn1_list = [extensibleSystemFailureParam.asn1_list copy];
			}
		}
		else
		{
			[_asn1_list addObject:extensibleSystemFailureParam];
		}
	}
	else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_SystemFailureParam choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_SystemFailureParam *) processAfterDecodeWithContext:(id)context
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
	
	if((o) && ([UMGSMMAP_NetworkResource tagMatches:o.asn1_tag.tagNumber]) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
	{
		networkResource = [[UMGSMMAP_NetworkResource alloc]initWithASN1Object:o context:context];
	}
	else if((o) && ([UMGSMMAP_ExtensibleSystemFailureParam tagMatches:o.asn1_tag.tagNumber]) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
	{
		extensibleSystemFailureParam = [[UMGSMMAP_ExtensibleSystemFailureParam alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"SystemFailureParam";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(networkResource)
	{
		dict[@"networkResource"] = networkResource.objectValue;
	}
	if(extensibleSystemFailureParam)
	{
		dict[@"extensibleSystemFailureParam"] = extensibleSystemFailureParam.objectValue;
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


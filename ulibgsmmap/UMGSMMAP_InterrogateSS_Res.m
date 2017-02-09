//
//  UMGSMMAP_InterrogateSS_Res.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_InterrogateSS_Res.h"

@implementation UMGSMMAP_InterrogateSS_Res


@synthesize	operationName;
@synthesize	ss_Status;
@synthesize	basicServiceGroupList;
@synthesize	forwardingFeatureList;
@synthesize	genericServiceInfo;


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
	if(ss_Status)
	{
		[ss_Status processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 0;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = ss_Status.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [ss_Status.asn1_list copy];
			}
			else
			{
				self.asn1_data = [ss_Status.asn1_data copy];
			}
		}
		else
		{
			ss_Status.asn1_tag.tagNumber = 0;
			ss_Status.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[asn1_list addObject:ss_Status];
		}
	}
	else if(basicServiceGroupList)
	{
		[basicServiceGroupList processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 2;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = basicServiceGroupList.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [basicServiceGroupList.asn1_list copy];
			}
			else
			{
				self.asn1_data = [basicServiceGroupList.asn1_data copy];
			}
		}
		else
		{
			basicServiceGroupList.asn1_tag.tagNumber = 2;
			basicServiceGroupList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[asn1_list addObject:basicServiceGroupList];
		}
	}
	else if(forwardingFeatureList)
	{
		[forwardingFeatureList processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 3;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = forwardingFeatureList.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [forwardingFeatureList.asn1_list copy];
			}
			else
			{
				self.asn1_data = [forwardingFeatureList.asn1_data copy];
			}
		}
		else
		{
			forwardingFeatureList.asn1_tag.tagNumber = 3;
			forwardingFeatureList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[asn1_list addObject:forwardingFeatureList];
		}
	}
	else if(genericServiceInfo)
	{
		[genericServiceInfo processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 4;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = genericServiceInfo.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [genericServiceInfo.asn1_list copy];
			}
			else
			{
				self.asn1_data = [genericServiceInfo.asn1_data copy];
			}
		}
		else
		{
			genericServiceInfo.asn1_tag.tagNumber = 4;
			genericServiceInfo.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[asn1_list addObject:genericServiceInfo];
		}
	}
	else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_InterrogateSS_Res choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_InterrogateSS_Res *) processAfterDecodeWithContext:(id)context
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
		ss_Status = [[UMGSMMAP_SS_Status alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		basicServiceGroupList = [[UMGSMMAP_BasicServiceGroupList alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		forwardingFeatureList = [[UMGSMMAP_ForwardingFeatureList alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		genericServiceInfo = [[UMGSMMAP_GenericServiceInfo alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"InterrogateSS-Res";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(ss_Status)
	{
		dict[@"ss-Status"] = ss_Status.objectValue;
	}
	if(basicServiceGroupList)
	{
		dict[@"basicServiceGroupList"] = basicServiceGroupList.objectValue;
	}
	if(forwardingFeatureList)
	{
		dict[@"forwardingFeatureList"] = forwardingFeatureList.objectValue;
	}
	if(genericServiceInfo)
	{
		dict[@"genericServiceInfo"] = genericServiceInfo.objectValue;
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


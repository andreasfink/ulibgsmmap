//
//  UMGSMMAP_Ext_SS_Info.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_Ext_SS_Info.h"

@implementation UMGSMMAP_Ext_SS_Info


@synthesize	operationName;
@synthesize	forwardingInfo;
@synthesize	callBarringInfo;
@synthesize	cug_Info;
@synthesize	ss_Data;
@synthesize	emlpp_Info;


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
	if(forwardingInfo)
	{
		[forwardingInfo processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 0;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = forwardingInfo.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [forwardingInfo.asn1_list copy];
			}
			else
			{
				self.asn1_data = [forwardingInfo.asn1_data copy];
			}
		}
		else
		{
			forwardingInfo.asn1_tag.tagNumber = 0;
			forwardingInfo.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[asn1_list addObject:forwardingInfo];
		}
	}
	else if(callBarringInfo)
	{
		[callBarringInfo processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 1;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = callBarringInfo.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [callBarringInfo.asn1_list copy];
			}
			else
			{
				self.asn1_data = [callBarringInfo.asn1_data copy];
			}
		}
		else
		{
			callBarringInfo.asn1_tag.tagNumber = 1;
			callBarringInfo.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[asn1_list addObject:callBarringInfo];
		}
	}
	else if(cug_Info)
	{
		[cug_Info processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 2;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = cug_Info.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [cug_Info.asn1_list copy];
			}
			else
			{
				self.asn1_data = [cug_Info.asn1_data copy];
			}
		}
		else
		{
			cug_Info.asn1_tag.tagNumber = 2;
			cug_Info.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[asn1_list addObject:cug_Info];
		}
	}
	else if(ss_Data)
	{
		[ss_Data processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 3;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = ss_Data.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [ss_Data.asn1_list copy];
			}
			else
			{
				self.asn1_data = [ss_Data.asn1_data copy];
			}
		}
		else
		{
			ss_Data.asn1_tag.tagNumber = 3;
			ss_Data.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[asn1_list addObject:ss_Data];
		}
	}
	else if(emlpp_Info)
	{
		[emlpp_Info processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 4;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = emlpp_Info.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [emlpp_Info.asn1_list copy];
			}
			else
			{
				self.asn1_data = [emlpp_Info.asn1_data copy];
			}
		}
		else
		{
			emlpp_Info.asn1_tag.tagNumber = 4;
			emlpp_Info.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[asn1_list addObject:emlpp_Info];
		}
	}
	else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_Ext_SS_Info choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_Ext_SS_Info *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = self;
	BOOL isImplicit = YES;

    if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		forwardingInfo = [[UMGSMMAP_Ext_ForwInfo alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		callBarringInfo = [[UMGSMMAP_Ext_CallBarInfo alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		cug_Info = [[UMGSMMAP_CUG_Info alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ss_Data = [[UMGSMMAP_Ext_SS_Data alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		emlpp_Info = [[UMGSMMAP_EMLPP_Info alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"Ext-SS-Info";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(forwardingInfo)
	{
		dict[@"forwardingInfo"] = forwardingInfo.objectValue;
	}
	if(callBarringInfo)
	{
		dict[@"callBarringInfo"] = callBarringInfo.objectValue;
	}
	if(cug_Info)
	{
		dict[@"cug-Info"] = cug_Info.objectValue;
	}
	if(ss_Data)
	{
		dict[@"ss-Data"] = ss_Data.objectValue;
	}
	if(emlpp_Info)
	{
		dict[@"emlpp-Info"] = emlpp_Info.objectValue;
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


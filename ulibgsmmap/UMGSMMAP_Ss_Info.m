//
//  UMGSMMAP_Ss_Info.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_Ss_Info.h>

@implementation UMGSMMAP_Ss_Info


@synthesize	operationName;
@synthesize	forwardingInfo;
@synthesize	callBarringInfo;
@synthesize	ss_Data;


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
			[_asn1_list addObject:forwardingInfo];
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
			[_asn1_list addObject:callBarringInfo];
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
			[_asn1_list addObject:ss_Data];
		}
	}
	else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_Ss_Info choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_Ss_Info *) processAfterDecodeWithContext:(id)context
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
		forwardingInfo = [[UMGSMMAP_ForwardingInfo alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		callBarringInfo = [[UMGSMMAP_CallBarringInfo alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ss_Data = [[UMGSMMAP_SS_Data alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"Ss-Info";
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
	if(ss_Data)
	{
		dict[@"ss-Data"] = ss_Data.objectValue;
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


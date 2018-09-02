//
//  UMGSMMAP_MAP_DialoguePDU.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_MAP_DialoguePDU.h"

@implementation UMGSMMAP_MAP_DialoguePDU


@synthesize	operationName;
@synthesize	map_open;
@synthesize	map_accept;
@synthesize	map_close;
@synthesize	map_refuse;
@synthesize	map_userAbort;
@synthesize	map_providerAbort;


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
	if(map_open)
	{
		[map_open processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 0;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = map_open.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [map_open.asn1_list copy];
			}
			else
			{
				self.asn1_data = [map_open.asn1_data copy];
			}
		}
		else
		{
			map_open.asn1_tag.tagNumber = 0;
			map_open.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:map_open];
		}
	}
	else if(map_accept)
	{
		[map_accept processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 1;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = map_accept.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [map_accept.asn1_list copy];
			}
			else
			{
				self.asn1_data = [map_accept.asn1_data copy];
			}
		}
		else
		{
			map_accept.asn1_tag.tagNumber = 1;
			map_accept.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:map_accept];
		}
	}
	else if(map_close)
	{
		[map_close processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 2;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = map_close.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [map_close.asn1_list copy];
			}
			else
			{
				self.asn1_data = [map_close.asn1_data copy];
			}
		}
		else
		{
			map_close.asn1_tag.tagNumber = 2;
			map_close.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:map_close];
		}
	}
	else if(map_refuse)
	{
		[map_refuse processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 3;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = map_refuse.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [map_refuse.asn1_list copy];
			}
			else
			{
				self.asn1_data = [map_refuse.asn1_data copy];
			}
		}
		else
		{
			map_refuse.asn1_tag.tagNumber = 3;
			map_refuse.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:map_refuse];
		}
	}
	else if(map_userAbort)
	{
		[map_userAbort processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 4;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = map_userAbort.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [map_userAbort.asn1_list copy];
			}
			else
			{
				self.asn1_data = [map_userAbort.asn1_data copy];
			}
		}
		else
		{
			map_userAbort.asn1_tag.tagNumber = 4;
			map_userAbort.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:map_userAbort];
		}
	}
	else if(map_providerAbort)
	{
		[map_providerAbort processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 5;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = map_providerAbort.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [map_providerAbort.asn1_list copy];
			}
			else
			{
				self.asn1_data = [map_providerAbort.asn1_data copy];
			}
		}
		else
		{
			map_providerAbort.asn1_tag.tagNumber = 5;
			map_providerAbort.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:map_providerAbort];
		}
	}
	else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_MAP_DialoguePDU choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_MAP_DialoguePDU *) processAfterDecodeWithContext:(id)context
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
		map_open = [[UMGSMMAP_MAP_OpenInfo alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		map_accept = [[UMGSMMAP_MAP_AcceptInfo alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		map_close = [[UMGSMMAP_MAP_CloseInfo alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		map_refuse = [[UMGSMMAP_MAP_RefuseInfo alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		map_userAbort = [[UMGSMMAP_MAP_UserAbortInfo alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		map_providerAbort = [[UMGSMMAP_MAP_ProviderAbortInfo alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"MAP-DialoguePDU";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(map_open)
	{
		dict[@"map-open"] = map_open.objectValue;
	}
	if(map_accept)
	{
		dict[@"map-accept"] = map_accept.objectValue;
	}
	if(map_close)
	{
		dict[@"map-close"] = map_close.objectValue;
	}
	if(map_refuse)
	{
		dict[@"map-refuse"] = map_refuse.objectValue;
	}
	if(map_userAbort)
	{
		dict[@"map-userAbort"] = map_userAbort.objectValue;
	}
	if(map_providerAbort)
	{
		dict[@"map-providerAbort"] = map_providerAbort.objectValue;
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


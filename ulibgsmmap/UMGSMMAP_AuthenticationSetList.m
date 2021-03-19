//
//  UMGSMMAP_AuthenticationSetList.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_AuthenticationSetList.h"

@implementation UMGSMMAP_AuthenticationSetList


@synthesize	operationName;

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
	if(_tripletList)
	{
		[_tripletList processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 0;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = _tripletList.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [_tripletList.asn1_list copy];
			}
			else
			{
				self.asn1_data = [_tripletList.asn1_data copy];
			}
		}
		else
		{
			_tripletList.asn1_tag.tagNumber = 0;
			_tripletList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:_tripletList];
		}
	}
	else if(_quintupletList)
	{
		[_quintupletList processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 1;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = _quintupletList.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [_quintupletList.asn1_list copy];
			}
			else
			{
				self.asn1_data = [_quintupletList.asn1_data copy];
			}
		}
		else
		{
			_quintupletList.asn1_tag.tagNumber = 1;
			_quintupletList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:_quintupletList];
		}
	}
	else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_AuthenticationSetList choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_AuthenticationSetList *) processAfterDecodeWithContext:(id)context
{
    UMASN1Object *o = self;
	
	if((o) && (o.asn1_tag.tagNumber == 0)
           && (o.asn1_tag.tagNumber == UMASN1Class_ContextSpecific))
	{
		_tripletList = [[UMGSMMAP_AuthenticationTripletList alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 1)
                && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		_quintupletList = [[UMGSMMAP_AuthenticationQuintupletList alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"AuthenticationSetList";
}

- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(_tripletList)
	{
		dict[@"tripletList"] = _tripletList.objectValue;
	}
	if(_quintupletList)
	{
		dict[@"quintupletList"] = _quintupletList.objectValue;
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


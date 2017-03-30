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
@synthesize	tripletList;
@synthesize	quintupletList;


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
	if(tripletList)
	{
		[tripletList processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 0;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = tripletList.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [tripletList.asn1_list copy];
			}
			else
			{
				self.asn1_data = [tripletList.asn1_data copy];
			}
		}
		else
		{
			tripletList.asn1_tag.tagNumber = 0;
			tripletList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[asn1_list addObject:tripletList];
		}
	}
	else if(quintupletList)
	{
		[quintupletList processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 1;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = quintupletList.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [quintupletList.asn1_list copy];
			}
			else
			{
				self.asn1_data = [quintupletList.asn1_data copy];
			}
		}
		else
		{
			quintupletList.asn1_tag.tagNumber = 1;
			quintupletList.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[asn1_list addObject:quintupletList];
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
	
	if((o) && (o.asn1_tag.tagNumber == UMASN1Primitive_sequence) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
	{
		tripletList = [[UMGSMMAP_AuthenticationTripletList alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		quintupletList = [[UMGSMMAP_AuthenticationQuintupletList alloc]initWithASN1Object:o context:context];
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
	if(tripletList)
	{
		dict[@"tripletList"] = tripletList.objectValue;
	}
	if(quintupletList)
	{
		dict[@"quintupletList"] = quintupletList.objectValue;
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


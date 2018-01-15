//
//  UMGSMMAP_CallBarredParam.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_CallBarredParam.h"

@implementation UMGSMMAP_CallBarredParam


@synthesize	operationName;
@synthesize	callBarringCause;
@synthesize	extensibleCallBarredParam;


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
	if(callBarringCause)
	{
		[callBarringCause processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = callBarringCause.asn1_tag.tagNumber;
			self.asn1_tag.tagClass = callBarringCause.asn1_tag.tagClass;
			self.asn1_tag.isConstructed = callBarringCause.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_data = [callBarringCause.asn1_data copy];
			}
			else
			{
				self.asn1_list = [callBarringCause.asn1_list copy];
			}
		}
		else
		{
			[asn1_list addObject:callBarringCause];
		}
	}
	else if(extensibleCallBarredParam)
	{
		[extensibleCallBarredParam processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = extensibleCallBarredParam.asn1_tag.tagNumber;
			self.asn1_tag.tagClass = extensibleCallBarredParam.asn1_tag.tagClass;
			self.asn1_tag.isConstructed = extensibleCallBarredParam.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_data = [extensibleCallBarredParam.asn1_data copy];
			}
			else
			{
				self.asn1_list = [extensibleCallBarredParam.asn1_list copy];
			}
		}
		else
		{
			[asn1_list addObject:extensibleCallBarredParam];
		}
	}
	else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_CallBarredParam choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_CallBarredParam *) processAfterDecodeWithContext:(id)context
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
	
	if((o) && ([UMGSMMAP_CallBarringCause tagMatch:o.asn1_tag]))
	{
		callBarringCause = [[UMGSMMAP_CallBarringCause alloc]initWithASN1Object:o context:context];
	}
	else if((o) && ([UMGSMMAP_ExtensibleCallBarredParam tagMatches:o.asn1_tag.tagNumber]) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
	{
		extensibleCallBarredParam = [[UMGSMMAP_ExtensibleCallBarredParam alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"CallBarredParam";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(callBarringCause)
	{
		dict[@"callBarringCause"] = callBarringCause.objectValue;
	}
	if(extensibleCallBarredParam)
	{
		dict[@"extensibleCallBarredParam"] = extensibleCallBarredParam.objectValue;
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


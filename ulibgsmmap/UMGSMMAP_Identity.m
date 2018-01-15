//
//  UMGSMMAP_Identity.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_Identity.h"

@implementation UMGSMMAP_Identity


@synthesize	operationName;
@synthesize	imsi;
@synthesize	imsi_WithLMSI;


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
	if(imsi)
	{
		[imsi processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = imsi.asn1_tag.tagNumber;
			self.asn1_tag.tagClass = imsi.asn1_tag.tagClass;
			self.asn1_tag.isConstructed = imsi.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_data = [imsi.asn1_data copy];
			}
			else
			{
				self.asn1_list = [imsi.asn1_list copy];
			}
		}
		else
		{
			[asn1_list addObject:imsi];
		}
	}
	else if(imsi_WithLMSI)
	{
		[imsi_WithLMSI processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = imsi_WithLMSI.asn1_tag.tagNumber;
			self.asn1_tag.tagClass = imsi_WithLMSI.asn1_tag.tagClass;
			self.asn1_tag.isConstructed = imsi_WithLMSI.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_data = [imsi_WithLMSI.asn1_data copy];
			}
			else
			{
				self.asn1_list = [imsi_WithLMSI.asn1_list copy];
			}
		}
		else
		{
			[asn1_list addObject:imsi_WithLMSI];
		}
	}
	else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_Identity choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_Identity *) processAfterDecodeWithContext:(id)context
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
	
	if((o) && ([UMGSMMAP_IMSI tagMatches:o.asn1_tag.tagNumber]) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
	{
		imsi = [[UMGSMMAP_IMSI alloc]initWithASN1Object:o context:context];
	}
	else if((o) && ([UMGSMMAP_IMSI_WithLMSI tagMatches:o.asn1_tag.tagNumber]) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
	{
		imsi_WithLMSI = [[UMGSMMAP_IMSI_WithLMSI alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"Identity";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(imsi)
	{
		dict[@"imsi"] = imsi.objectValue;
	}
	if(imsi_WithLMSI)
	{
		dict[@"imsi-WithLMSI"] = imsi_WithLMSI.objectValue;
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


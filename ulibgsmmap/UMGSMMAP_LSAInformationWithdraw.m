//
//  UMGSMMAP_LSAInformationWithdraw.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_LSAInformationWithdraw.h"

@implementation UMGSMMAP_LSAInformationWithdraw


@synthesize	operationName;
@synthesize	allLSAData;
@synthesize	lsaIdentityList;


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
	if(allLSAData)
	{
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = -1;
			self.asn1_tag.tagClass = UMASN1Class_Universal;
			self.asn1_tag.isConstructed = NO;
			self.asn1_data = [NSData data];
			self.asn1_list = NULL;
		}
		else
		{
			UMASN1Null *n = [[UMASN1Null alloc]init];
			n.asn1_tag.tagNumber = -1;
			n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[asn1_list addObject:n];
		}
	}
	else if(lsaIdentityList)
	{
		[lsaIdentityList processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = lsaIdentityList.asn1_tag.tagNumber;
			self.asn1_tag.tagClass = lsaIdentityList.asn1_tag.tagClass;
			self.asn1_tag.isConstructed = lsaIdentityList.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_data = [lsaIdentityList.asn1_data copy];
			}
			else
			{
				self.asn1_list = [lsaIdentityList.asn1_list copy];
			}
		}
		else
		{
			[asn1_list addObject:lsaIdentityList];
		}
	}
	else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_LSAInformationWithdraw choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_LSAInformationWithdraw *) processAfterDecodeWithContext:(id)context
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
	
	if((o) && ([UMASN1Null tagMatches:o.asn1_tag.tagNumber]) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
	{
		allLSAData = YES;
	}
	else if((o) && ([UMGSMMAP_LSAIdentityList tagMatches:o.asn1_tag.tagNumber]) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
	{
		lsaIdentityList = [[UMGSMMAP_LSAIdentityList alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"LSAInformationWithdraw";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(allLSAData)
	{
		dict[@"allLSAData"] = @(YES);
	}
	if(lsaIdentityList)
	{
		dict[@"lsaIdentityList"] = lsaIdentityList.objectValue;
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


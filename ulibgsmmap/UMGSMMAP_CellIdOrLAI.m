//
//  UMGSMMAP_CellIdOrLAI.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_CellIdOrLAI.h>

@implementation UMGSMMAP_CellIdOrLAI


@synthesize	operationName;
@synthesize	cellIdFixedLength;
@synthesize	laiFixedLength;


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
	if(cellIdFixedLength)
	{
		[cellIdFixedLength processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 0;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = cellIdFixedLength.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [cellIdFixedLength.asn1_list copy];
			}
			else
			{
				self.asn1_data = [cellIdFixedLength.asn1_data copy];
			}
		}
		else
		{
			cellIdFixedLength.asn1_tag.tagNumber = 0;
			cellIdFixedLength.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:cellIdFixedLength];
		}
	}
	else if(laiFixedLength)
	{
		[laiFixedLength processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 1;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = laiFixedLength.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [laiFixedLength.asn1_list copy];
			}
			else
			{
				self.asn1_data = [laiFixedLength.asn1_data copy];
			}
		}
		else
		{
			laiFixedLength.asn1_tag.tagNumber = 1;
			laiFixedLength.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:laiFixedLength];
		}
	}
	else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_CellIdOrLAI choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}


- (UMGSMMAP_CellIdOrLAI *) processAfterDecodeWithContext:(id)context
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
		cellIdFixedLength = [[UMGSMMAP_CellIdFixedLength alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		laiFixedLength = [[UMGSMMAP_LAIFixedLength alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"CellIdOrLAI";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(cellIdFixedLength)
	{
		dict[@"cellIdFixedLength"] = cellIdFixedLength.objectValue;
	}
	if(laiFixedLength)
	{
		dict[@"laiFixedLength"] = laiFixedLength.objectValue;
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


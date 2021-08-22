//
//  UMGSMMAP_Ext_BasicServiceCode.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_Ext_BasicServiceCode.h"

@implementation UMGSMMAP_Ext_BasicServiceCode


@synthesize	operationName;
@synthesize	ext_BearerService;
@synthesize	ext_Teleservice;


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
	if(ext_BearerService)
	{
		[ext_BearerService processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 2;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = ext_BearerService.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [ext_BearerService.asn1_list copy];
			}
			else
			{
				self.asn1_data = [ext_BearerService.asn1_data copy];
			}
		}
		else
		{
			ext_BearerService.asn1_tag.tagNumber = 2;
			ext_BearerService.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:ext_BearerService];
		}
	}
	else if(ext_Teleservice)
	{
		[ext_Teleservice processBeforeEncode];
		if(isImplicit)
		{
			self.asn1_tag.tagNumber = 3;
			self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			self.asn1_tag.isConstructed = ext_Teleservice.asn1_tag.isConstructed;
			if(self.asn1_tag.isConstructed)
			{
				self.asn1_list = [ext_Teleservice.asn1_list copy];
			}
			else
			{
				self.asn1_data = [ext_Teleservice.asn1_data copy];
			}
		}
		else
		{
			ext_Teleservice.asn1_tag.tagNumber = 3;
			ext_Teleservice.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
			[_asn1_list addObject:ext_Teleservice];
		}
	}
	else
	{
	    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
	                                   reason:@"UMGSMMAP_Ext_BasicServiceCode choice missing"
	                                userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
	}
}

- (UMGSMMAP_Ext_BasicServiceCode *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o;
	BOOL isImplicit = YES;
	if(self.asn1_tag.tagClass == UMASN1Class_ContextSpecific)
	{
		isImplicit = YES;
        o = self;
    }
    else
    {
        isImplicit = NO;
		o = [self getObjectAtPosition:p++];
	}

	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ext_BearerService = [[UMGSMMAP_Ext_BearerServiceCode alloc]initWithASN1Object:o context:context];
	}
	else if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		ext_Teleservice = [[UMGSMMAP_Ext_TeleserviceCode alloc]initWithASN1Object:o context:context];
	}
	return self;
}

- (NSString *) objectName
{
	return @"Ext-BasicServiceCode";
}

- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(ext_BearerService)
	{
		dict[@"ext-BearerService"] = ext_BearerService.objectValue;
	}
	if(ext_Teleservice)
	{
        dict[@"ext-Teleservice"] = ext_Teleservice.objectValue;
        NSData *d = ext_Teleservice.value;
        if(d.length == 1)
        {
            const uint8_t *bytes = d.bytes;
            switch (bytes[0])
            {
                case 0x11:
                    dict[@"ext-Teleservice-description"] = @"speech";
                    break;
                case 0x12:
                    dict[@"ext-Teleservice-description"] = @"emergency-calls";
                    break;
                case 0x21:
                    dict[@"ext-Teleservice-description"] = @"sms-mt";
                    break;
                case 0x22:
                    dict[@"ext-Teleservice-description"] = @"sms-mo";
                    break;
                case 0x23:
                    dict[@"ext-Teleservice-description"] = @"cell-broadcast-service";
                    break;
                case 0x61:
                    dict[@"ext-Teleservice-description"] = @"alternate-speech-and-facsimile-group-3";
                    break;
                case 0x62:
                    dict[@"ext-Teleservice-description"] = @"automatic-facsimile-group-3";
                    break;
                case 0x91:
                    dict[@"ext-Teleservice-description"] = @"voice-group-call-service";
                    break;
                case 0x92:
                    dict[@"ext-Teleservice-description"] = @"voice-broadcast-service";
                    break;
            }
        }
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


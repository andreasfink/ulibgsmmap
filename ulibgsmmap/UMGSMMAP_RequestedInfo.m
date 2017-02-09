//
//  UMGSMMAP_RequestedInfo.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_RequestedInfo.h"

@implementation UMGSMMAP_RequestedInfo


@synthesize	operationName;
@synthesize	locationInformation;
@synthesize	subscriberState;
@synthesize	extensionContainer;
@synthesize	currentLocation;
@synthesize	requestedDomain;
@synthesize	imei;
@synthesize	ms_classmark;
@synthesize	mnpRequestedInfo;
@synthesize	locationInformationEPS_Supported;
@synthesize	t_adsData;
@synthesize	requestedNodes;
@synthesize	servingNodeIndication;
@synthesize	localTimeZoneRequest;


- (void) processBeforeEncode
{
	[super processBeforeEncode];
	[asn1_tag setTagIsConstructed];
	asn1_list = [[NSMutableArray alloc]init];
	if(locationInformation)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 0;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(subscriberState)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 1;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(extensionContainer)
	{
		extensionContainer.asn1_tag.tagNumber = 2;
		extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:extensionContainer];
	}
	if(currentLocation)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 3;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(requestedDomain)
	{
		requestedDomain.asn1_tag.tagNumber = 4;
		requestedDomain.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:requestedDomain];
	}
	if(imei)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 6;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(ms_classmark)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 5;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(mnpRequestedInfo)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 7;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(locationInformationEPS_Supported)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 11;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(t_adsData)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 8;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(requestedNodes)
	{
		requestedNodes.asn1_tag.tagNumber = 9;
		requestedNodes.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:requestedNodes];
	}
	if(servingNodeIndication)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 10;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
	if(localTimeZoneRequest)
	{
		UMASN1Null *n = [[UMASN1Null alloc]init];
		n.asn1_tag.tagNumber = 12;
		n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
		[asn1_list addObject:n];
	}
}


- (UMGSMMAP_RequestedInfo *) processAfterDecodeWithContext:(id)context
{
	int p=0;
	UMASN1Object *o = [self getObjectAtPosition:p++];
	if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		locationInformation = YES;
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		subscriberState = YES;
		o = [self getObjectAtPosition:p++];
	}
	if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
	{
		extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
		o = [self getObjectAtPosition:p++];
	}
	while(o)
	{
		if((o) && (o.asn1_tag.tagNumber == 3) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			currentLocation = YES;
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			requestedDomain = [[UMASN1Integer alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 6) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			imei = YES;
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 5) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			ms_classmark = YES;
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 7) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			mnpRequestedInfo = YES;
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 11) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			locationInformationEPS_Supported = YES;
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 8) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			t_adsData = YES;
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 9) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			requestedNodes = [[UMASN1BitString alloc]initWithASN1Object:o context:context];
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 10) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			servingNodeIndication = YES;
			o = [self getObjectAtPosition:p++];
		}
		else if((o) && (o.asn1_tag.tagNumber == 12) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
		{
			localTimeZoneRequest = YES;
			o = [self getObjectAtPosition:p++];
		}
        else
        {
            o = [self getObjectAtPosition:p++];
        }
	}
	return self;
}

- (NSString *) objectName
{
	return @"RequestedInfo";
}
- (id) objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	if(locationInformation)
	{
		dict[@"locationInformation"] = @(YES);
	}
	if(subscriberState)
	{
		dict[@"subscriberState"] = @(YES);
	}
	if(extensionContainer)
	{
		dict[@"extensionContainer"] = extensionContainer.objectValue;
	}
	if(currentLocation)
	{
		dict[@"currentLocation"] = @(YES);
	}
	if(requestedDomain)
	{
		dict[@"requestedDomain"] = requestedDomain.objectValue;
	}
	if(imei)
	{
		dict[@"imei"] = @(YES);
	}
	if(ms_classmark)
	{
		dict[@"ms-classmark"] = @(YES);
	}
	if(mnpRequestedInfo)
	{
		dict[@"mnpRequestedInfo"] = @(YES);
	}
	if(locationInformationEPS_Supported)
	{
		dict[@"locationInformationEPS-Supported"] = @(YES);
	}
	if(t_adsData)
	{
		dict[@"t-adsData"] = @(YES);
	}
	if(requestedNodes)
	{
		dict[@"requestedNodes"] = requestedNodes.objectValue;
	}
	if(servingNodeIndication)
	{
		dict[@"servingNodeIndication"] = @(YES);
	}
	if(localTimeZoneRequest)
	{
		dict[@"localTimeZoneRequest"] = @(YES);
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

- (UMGSMMAP_RequestedInfo *)initWithString:(NSString *)requestedInfoString
{
    
    self = [super init];
    if(self)
    {
        if(requestedInfoString.length == 0)
        {
            self.locationInformation = YES;
            self.subscriberState = YES;
            self.currentLocation = YES;
        }
        else if([requestedInfoString isEqualToString:@"default"])
        {
            self.locationInformation = YES;
            self.subscriberState = YES;
            self.currentLocation = YES;
        }
        else if([requestedInfoString isEqualToString:@"all"])
        {
            self.locationInformation = YES;
            self.subscriberState = YES;
            self.currentLocation = YES;
            self.ms_classmark = YES;
            self.mnpRequestedInfo = YES;
            self.locationInformationEPS_Supported = YES;
            self.t_adsData = YES;
            self.servingNodeIndication = YES;
            self.localTimeZoneRequest = YES;
        }
        else
        {

            NSArray *items = [requestedInfoString componentsSeparatedByString:@","];            
            for(NSString *item in items)
            {
                NSString *s = [item stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                if([s isEqualToString:@"location-information"])
                {
                    self.locationInformation = YES;
                }
                else if([s isEqualToString:@"subscriber-state"])
                {
                    self.subscriberState = YES;
                }
                else if([s isEqualToString:@"current-location"])
                {
                    self.currentLocation= YES;
                }
                /*  else if([s isEqualToString:@"requested-domain"])
                 {
                 ri.requestedDomain = [[UMASN1Null alloc]init];
                 }
                 */
                else if([s isEqualToString:@"imei"])
                {
                    self.imei = YES;
                }
                else if([s isEqualToString:@"ms-classmark"])
                {
                    self.ms_classmark= YES;
                }
                else if([s isEqualToString:@"mnp-requested-info"])
                {
                    self.mnpRequestedInfo= YES;
                }
                else if([s isEqualToString:@"locationI-information-eps-supported"])
                {
                    self.locationInformationEPS_Supported = YES;
                }
                else if([s isEqualToString:@"t-ads-data"])
                {
                    self.t_adsData = YES;
                }
                else if([s isEqualToString:@"serving-node-indication"])
                {
                    self.servingNodeIndication = YES;
                }
                else if([s isEqualToString:@"local-time-zone-request"])
                {
                    self.localTimeZoneRequest = YES;
                }
            }
        }
    }
    return self;
}
@end


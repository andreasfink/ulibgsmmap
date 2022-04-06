//
//  UMGSMMAP_FTSExtension.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 31.03.20.
//  Copyright © 2020 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMGSMMAP_FTSExtension.h"
#import "UMGSMMAP_asn1_protocol.h"

@implementation UMGSMMAP_FTSExtension


- (UMGSMMAP_FTSExtension *)initWithString:(NSString *)s
{
    self = [super init];
    if(self)
    {
        NSArray *a = [s componentsSeparatedByString:@"="];
        if(a.count==2)
        {
            NSString *var = a[0];
            NSString *val = a[1];

            if([var isEqualToString:@"vas_esme"])
            {
                _vas_esme = val;
            }
            else if([var isEqualToString:@"vas_ip"])
            {
                _vas_ip = val;
            }

        }
    }
    return self;
}


- (void) processBeforeEncode
{
    [super processBeforeEncode];
    if(_vas_esme)
    {
        UMASN1UTF8String *u8 = [[UMASN1UTF8String alloc]initWithValue:_vas_esme];
        self.asn1_tag.tagNumber = UMGSMMAP_FTSExtension_vas_esme;
        self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        self.asn1_data = [u8.asn1_data copy];
    }
    else if(_vas_ip)
    {
        UMASN1UTF8String *u8 = [[UMASN1UTF8String alloc]initWithValue:_vas_ip];
        self.asn1_tag.tagNumber = UMGSMMAP_FTSExtension_vas_ip;
        self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        self.asn1_data = [u8.asn1_data copy];
    }
    else if (_msgid)
    {
        UMASN1UTF8String *u8 = [[UMASN1UTF8String alloc]initWithValue:_msgid];
        self.asn1_tag.tagNumber = UMGSMMAP_FTSExtension_msgid;
        self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        self.asn1_data = [u8.asn1_data copy];
    }
    else if (_ulibtransportContainer)
    {
        UMASN1OctetString *o8 = [[UMASN1OctetString alloc]initWithValue:_ulibtransportContainer];
        self.asn1_tag.tagNumber = UMGSMMAP_FTSExtension_ulibtransport_container;
        self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        self.asn1_data = [o8.asn1_data copy];
    }
}


- (UMGSMMAP_FTSExtension *) processAfterDecodeWithContext:(id)context
{
    if(_asn1_tag.tagClass == UMASN1Class_ContextSpecific)
    {
        if(_asn1_tag.tagNumber == UMGSMMAP_FTSExtension_vas_esme)
        {
            UMASN1UTF8String *u8 = [[UMASN1UTF8String alloc]initWithASN1Object:self context:context];
            _vas_esme = u8.value;
        }
        else if(_asn1_tag.tagNumber == UMGSMMAP_FTSExtension_vas_ip)
        {
            UMASN1UTF8String *u8 = [[UMASN1UTF8String alloc]initWithASN1Object:self context:context];
            _vas_ip = u8.value;
        }
    }
    return self;
}

- (NSString *) objectName
{
    return @"FTSExtension";
}

- (id) objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    if(_vas_esme)
    {
        dict[@"vas-esme"] = _vas_esme;
    }
    if(_vas_ip)
    {
        dict[@"vas-ip"] = _vas_ip;
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


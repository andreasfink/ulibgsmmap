//
//  UMGSMMAP_EPS_Info.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 14.07.20.
//  Copyright © 2020 Andreas Fink (andreas@fink.org). All rights reserved.
//


#import "UMGSMMAP_EPS_Info.h"

@implementation UMGSMMAP_EPS_Info

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
    if(_pdn_gw_update)
    {
        [_pdn_gw_update processBeforeEncode];
        if(isImplicit)
        {
            self.asn1_tag.tagNumber = 0;
            self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
            self.asn1_tag.isConstructed = _pdn_gw_update.asn1_tag.isConstructed;
            if(self.asn1_tag.isConstructed)
            {
                self.asn1_list = [_pdn_gw_update.asn1_list copy];
            }
            else
            {
                self.asn1_data = [_pdn_gw_update.asn1_data copy];
            }
        }
        else
        {
            _pdn_gw_update.asn1_tag.tagNumber = 0;
            _pdn_gw_update.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
            [_asn1_list addObject:_pdn_gw_update];
        }
    }
    else if(_isr_Information)
    {
        [_isr_Information processBeforeEncode];
        if(isImplicit)
        {
            self.asn1_tag.tagNumber = 1;
            self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
            self.asn1_tag.isConstructed = _isr_Information.asn1_tag.isConstructed;
            if(self.asn1_tag.isConstructed)
            {
                self.asn1_list = [_isr_Information.asn1_list copy];
            }
            else
            {
                self.asn1_data = [_isr_Information.asn1_data copy];
            }
        }
        else
        {
            _isr_Information.asn1_tag.tagNumber = 1;
            _isr_Information.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
            [_asn1_list addObject:_isr_Information];
        }
    }
    else
    {
        @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
                                       reason:@"UMGSMMAP_EPS_Info choice missing"
                                    userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
    }
}


- (UMGSMMAP_EPS_Info *) processAfterDecodeWithContext:(id)context
{
    UMASN1Object *o = self;
    
    if((o) && (o.asn1_tag.tagNumber == UMASN1Primitive_sequence) && (o.asn1_tag.tagClass == UMASN1Class_Universal))
    {
        _pdn_gw_update = [[UMGSMMAP_PDN_GW_Update alloc]initWithASN1Object:o context:context];
    }
    else if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
    {
        _isr_Information = [[UMGSMMAP_ISR_Information alloc]initWithASN1Object:o context:context];
    }
    return self;
}


- (NSString *) objectName
{
    return @"EPS-Info";
}
- (id) objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    if(_pdn_gw_update)
    {
        dict[@"pdn-gw-update"] = _pdn_gw_update.objectValue;
    }
    if(_isr_Information)
    {
        dict[@"isr-Information"] = _isr_Information.objectValue;
    }
    return dict;
}



- (UMGSMMAP_EPS_Info *)initWithString:(NSString *)string
{
    self = [super init];
    if(self)
    {
        NSArray *a = [string componentsSeparatedByString:@","];
        for(NSString *s in a)
        {
            NSString *var=NULL;
            NSString *val = NULL;
            NSArray *b = [s componentsSeparatedByString:@"="];
            if(b.count == 1)
            {
                var = b[0];
            }
            if(b.count >= 2)
            {
                var = b[0];
                val = b[1];
            }
            

            if([var isEqualToString:@"pdn-gw-update.apn"])
            {
                if(_pdn_gw_update==NULL)
                {
                    _pdn_gw_update = [[UMGSMMAP_PDN_GW_Update alloc]init];
                }
                _pdn_gw_update.apn = [[UMGSMMAP_APN alloc]initWithString:val];
            }
            
            if([var isEqualToString:@"pdn-gw-identity-ipv4"])
            {
                if(_pdn_gw_update==NULL)
                {
                    _pdn_gw_update = [[UMGSMMAP_PDN_GW_Update alloc]init];
                }
                if(_pdn_gw_update.pdn_gw_Identity  == NULL)
                {
                    _pdn_gw_update.pdn_gw_Identity = [[UMGSMMAP_PDN_GW_Identity alloc]init];
                }
                _pdn_gw_update.pdn_gw_Identity.pdn_gw_ipv4_Address = [[UMGSMMAP_PDP_Address alloc]initWithString:val];
            }
            if([var isEqualToString:@"pdn-gw-identity-ipv6"])
            {
                if(_pdn_gw_update==NULL)
                {
                    _pdn_gw_update = [[UMGSMMAP_PDN_GW_Update alloc]init];
                }
                if(_pdn_gw_update.pdn_gw_Identity  == NULL)
                {
                    _pdn_gw_update.pdn_gw_Identity = [[UMGSMMAP_PDN_GW_Identity alloc]init];
                }
                _pdn_gw_update.pdn_gw_Identity.pdn_gw_ipv6_Address = [[UMGSMMAP_PDP_Address alloc]initWithString:val];
            }
            if([var isEqualToString:@"pdn-gw-identity-name"])
            {
                if(_pdn_gw_update==NULL)
                {
                    _pdn_gw_update = [[UMGSMMAP_PDN_GW_Update alloc]init];
                }
                if(_pdn_gw_update.pdn_gw_Identity  == NULL)
                {
                    _pdn_gw_update.pdn_gw_Identity = [[UMGSMMAP_PDN_GW_Identity alloc]init];
                }
                _pdn_gw_update.pdn_gw_Identity.pdn_gw_ipv4_Address = [[UMGSMMAP_PDP_Address alloc]initWithString:val];
            }
            if([var isEqualToString:@"pdn-gw-update.context-id"])
            {
                if(_pdn_gw_update==NULL)
                {
                    _pdn_gw_update = [[UMGSMMAP_PDN_GW_Update alloc]init];
                }
                _pdn_gw_update.contextId = [[UMGSMMAP_ContextId alloc]initWithString:val];
            }

            if([var isEqualToString:@"isr-Information"])
            {
                _isr_Information = [[UMGSMMAP_ISR_Information alloc]initWithString:val];
            }
        }
    }
    return self;
}
@end


//
//  UMGSMMAP_PDN_GW_Identity.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 14.07.20.
//  Copyright © 2020 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibgsmmap/UMGSMMAP_PDN_GW_Identity.h>

@implementation UMGSMMAP_PDN_GW_Identity


- (void) processBeforeEncode
{
    [super processBeforeEncode];
    [_asn1_tag setTagIsConstructed];
    _asn1_list = [[NSMutableArray alloc]init];
    if(_pdn_gw_ipv4_Address!= NULL)
    {
        _pdn_gw_ipv4_Address.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        _pdn_gw_ipv4_Address.asn1_tag.tagNumber = 0;
        [_asn1_list addObject:_pdn_gw_ipv4_Address];
    }
    if(_pdn_gw_ipv6_Address!= NULL)
    {
        _pdn_gw_ipv6_Address.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        _pdn_gw_ipv6_Address.asn1_tag.tagNumber = 1;
        [_asn1_list addObject:_pdn_gw_ipv6_Address];
    }
    if(_pdn_gw_name != NULL)
    {
        _pdn_gw_name.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        _pdn_gw_name.asn1_tag.tagNumber = 2;
        [_asn1_list addObject:_pdn_gw_name];
    }
    if(_extensionContainer != NULL)
    {
        _extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        _extensionContainer.asn1_tag.tagNumber = 3;
        [_asn1_list addObject:_extensionContainer];
    }
}

- (UMGSMMAP_PDN_GW_Identity *) processAfterDecodeWithContext:(id)context
{
    int p=0;
    UMASN1Object *o = [self getObjectAtPosition:p++];
    if((o.asn1_tag.tagClass == UMASN1Class_ContextSpecific) && (o.asn1_tag.tagNumber == 0))
    {
        _pdn_gw_ipv4_Address = [[UMGSMMAP_PDP_Address alloc]initWithASN1Object:o context:context];
        o = [self getObjectAtPosition:p++];
    }
    if((o.asn1_tag.tagClass == UMASN1Class_ContextSpecific) && (o.asn1_tag.tagNumber == 1))
    {
        _pdn_gw_ipv6_Address = [[UMGSMMAP_PDP_Address alloc]initWithASN1Object:o context:context];
        o = [self getObjectAtPosition:p++];
    }
    if((o.asn1_tag.tagClass == UMASN1Class_ContextSpecific) && (o.asn1_tag.tagNumber == 2))
    {
        _pdn_gw_name = [[UMGSMMAP_FQDN alloc]initWithASN1Object:o context:context];
        o = [self getObjectAtPosition:p++];
    }
    if((o.asn1_tag.tagClass == UMASN1Class_ContextSpecific) && (o.asn1_tag.tagNumber == 3))
    {
        _extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
//      o = [self getObjectAtPosition:p++];
    }
    return self;
}

- (NSString *) objectName
{
    return @"PDN-GW-Identity";
}
- (id) objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    if(_pdn_gw_ipv4_Address != NULL)
    {
        dict[@"pdn-gw-ipv4-Address"] = _pdn_gw_ipv4_Address.objectValue;

    }
    if(_pdn_gw_ipv6_Address != NULL)
    {
        dict[@"pdn-gw-ipv4-Address"] = _pdn_gw_ipv6_Address.objectValue;
    }
    if(_pdn_gw_name)
    {
        dict[@"pdn-gw-name"] = _pdn_gw_name.objectValue;
    }
    if(_extensionContainer)
    {
        dict[@"extensionContainer"] = _extensionContainer.objectValue;
    }
    return dict;
}

@end


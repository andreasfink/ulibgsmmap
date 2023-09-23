//
//  UMGSMMAP_PDN_GW_Update.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 14.07.20.
//  Copyright © 2020 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibgsmmap/UMGSMMAP_PDN_GW_Update.h>

@implementation UMGSMMAP_PDN_GW_Update


- (void) processBeforeEncode
{
    [super processBeforeEncode];
    [_asn1_tag setTagIsConstructed];
    _asn1_list = [[NSMutableArray alloc]init];
    if(_apn!= NULL)
    {
        _apn.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        _apn.asn1_tag.tagNumber = 0;
        [_asn1_list addObject:_apn];
    }
    if(_pdn_gw_Identity!= NULL)
    {
        _pdn_gw_Identity.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        _pdn_gw_Identity.asn1_tag.tagNumber = 1;
        [_asn1_list addObject:_pdn_gw_Identity];
    }
    if(_contextId != NULL)
    {
        _contextId.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        _contextId.asn1_tag.tagNumber = 2;
        [_asn1_list addObject:_contextId];
    }
    if(_extensionContainer != NULL)
    {
        _extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        _extensionContainer.asn1_tag.tagNumber = 3;
        [_asn1_list addObject:_extensionContainer];
    }
}

- (UMGSMMAP_PDN_GW_Update *) processAfterDecodeWithContext:(id)context
{
    int p=0;
    UMASN1Object *o = [self getObjectAtPosition:p++];
    if((o.asn1_tag.tagClass == UMASN1Class_ContextSpecific) && (o.asn1_tag.tagNumber == 0))
    {
        _apn = [[UMGSMMAP_APN alloc]initWithASN1Object:o context:context];
        o = [self getObjectAtPosition:p++];
    }
    if((o.asn1_tag.tagClass == UMASN1Class_ContextSpecific) && (o.asn1_tag.tagNumber == 1))
    {
        _pdn_gw_Identity = [[UMGSMMAP_PDN_GW_Identity alloc]initWithASN1Object:o context:context];
        o = [self getObjectAtPosition:p++];
    }
    if((o.asn1_tag.tagClass == UMASN1Class_ContextSpecific) && (o.asn1_tag.tagNumber == 2))
    {
        _contextId = [[UMGSMMAP_ContextId alloc]initWithASN1Object:o context:context];
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
    return @"PDN-GW-Update";
}

- (id) objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    if(_apn != NULL)
    {
        dict[@"apn"] = _apn.objectValue;

    }
    if(_pdn_gw_Identity != NULL)
    {
        dict[@"pdn-gw-Identity"] = _pdn_gw_Identity.objectValue;
    }
    if(_contextId)
    {
        dict[@"contextId"] = _contextId.objectValue;
    }
    if(_extensionContainer)
    {
        dict[@"extensionContainer"] = _extensionContainer.objectValue;
    }
    return dict;
}

@end


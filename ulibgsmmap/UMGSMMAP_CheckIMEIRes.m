//
//  UMGSMMAP_CheckIMEIRes.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 28.02.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMGSMMAP_CheckIMEIRes.h"
#import "UMGSMMAP_EquipmentStatus.h"
#import "UMGSMMAP_UESBI_Iu.h"
#import "UMGSMMAP_ExtensionContainer.h"

/*
 CheckIMEI-Res ::= SEQUENCE {
 equipmentStatus    EquipmentStatus    OPTIONAL,
 bmuef              UESBI-Iu           OPTIONAL,
 extensionContainer [0] ExtensionContainer OPTIONAL,
 ...
 }
 
*/

@implementation UMGSMMAP_CheckIMEIRes

- (void) processBeforeEncode
{
    [super processBeforeEncode];
    [_asn1_tag setTagIsConstructed];
    _asn1_list = [[NSMutableArray alloc]init];
    if(_equipmentStatus)
    {
        [_asn1_list addObject:_equipmentStatus];
    }
    if(_bmuef)
    {
        [_asn1_list addObject:_bmuef];
    }
    if(_extensionContainer)
    {
        _extensionContainer.asn1_tag.tagNumber = 0;
        _extensionContainer.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_extensionContainer];
    }
}


- (UMGSMMAP_CheckIMEIRes *) processAfterDecodeWithContext:(id)context
{
    int p=0;
    UMASN1Object *o = [self getObjectAtPosition:p++];
    if(o)
    {
        _equipmentStatus = [[UMGSMMAP_EquipmentStatus alloc]initWithASN1Object:o context:context];
        o = [self getObjectAtPosition:p++];
    }
    if(o)
    {
        _bmuef = [[UMGSMMAP_UESBI_Iu alloc]initWithASN1Object:o context:context];
        o = [self getObjectAtPosition:p++];
    }
    if((o) && (o.asn1_tag.tagNumber == 0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
    {
        _extensionContainer = [[UMGSMMAP_ExtensionContainer alloc]initWithASN1Object:o context:context];
        o = [self getObjectAtPosition:p++];
    }
    while(o)
    {
        /* ... */
        o = [self getObjectAtPosition:p++];
    }
    return self;
}

- (NSString *) objectName
{
    return @"CheckIMEIRes";
}

- (id) objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    if(_equipmentStatus)
    {
        dict[@"equipmentStatus"] = _equipmentStatus.objectValue;
    }
    if(_bmuef)
    {
        dict[@"bmuef"] = _bmuef.objectValue;
    }
    if(_extensionContainer)
    {
        dict[@"extensionContainer"] = _extensionContainer.objectValue;
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


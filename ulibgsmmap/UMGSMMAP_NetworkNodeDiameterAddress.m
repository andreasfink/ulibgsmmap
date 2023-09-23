//
//  UMGSMMAP_NetworkNodeDiameterAddress.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 09.07.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibgsmmap/UMGSMMAP_NetworkNodeDiameterAddress.h>

@implementation UMGSMMAP_NetworkNodeDiameterAddress

@synthesize operationName;

- (void) processBeforeEncode
{
    [super processBeforeEncode];
    _asn1_tag.isConstructed=YES;
    _asn1_list = [[NSMutableArray alloc]init];
    if(_diameter_Name)
    {
        _diameter_Name.asn1_tag.tagNumber = 0;
        _diameter_Name.asn1_tag.tagClass =UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_diameter_Name];
    }
    else
    {
        @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
                                       reason:@"diameter-Name missing"
                                     userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
    }
    if(_diameter_Realm)
    {
        _diameter_Realm.asn1_tag.tagNumber = 1;
        _diameter_Realm.asn1_tag.tagClass =UMASN1Class_ContextSpecific;
        [_asn1_list addObject:_diameter_Realm];
    }
    else
    {
        @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
                                       reason:@"diameter-Name missing"
                                     userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
    }
}


- (UMGSMMAP_NetworkNodeDiameterAddress *) processAfterDecodeWithContext:(id)context
{
    int p=0;
    UMASN1Object *o = [self getObjectAtPosition:p++];
    if((o) && (o.asn1_tag.tagNumber==0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
    {
        _diameter_Name = [[UMGSMMAP_DiameterIdentity alloc]initWithASN1Object:o context:context];
        o = [self getObjectAtPosition:p++];
    }
    if((o) && (o.asn1_tag.tagNumber==1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
    {
        _diameter_Realm = [[UMGSMMAP_DiameterIdentity alloc]initWithASN1Object:o context:context];
        //o = [self getObjectAtPosition:p++];
    }
    return self;
}

- (NSString *) objectName
{
    return @"NetworkNodeDiameterAddress";
}
- (id) objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    if(_diameter_Name)
    {
        dict[@"diameter-Name"] = _diameter_Name.objectValue;
    }
    if(_diameter_Realm)
    {
        dict[@"diameter-Realm"] = _diameter_Realm.objectValue;
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

- (UMGSMMAP_NetworkNodeDiameterAddress *)initWithString:(NSString *)str;
{
    self = [super init];
    if(self)
    {
        NSArray *a = [str componentsSeparatedByString:@"@"];
        if(a.count>=1)
        {
            NSString *a1 = a[0];
            if(a1.length > 0)
            {
                _diameter_Name = [[UMGSMMAP_DiameterIdentity alloc]initWithString:a[0]];
            }
        }
        if(a.count>=2)
        {
            _diameter_Realm = [[UMGSMMAP_DiameterIdentity alloc]initWithString:a[1]];
        }
    }
    return self;
}
@end


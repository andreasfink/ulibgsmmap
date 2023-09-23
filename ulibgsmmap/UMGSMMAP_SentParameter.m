//
//  UMGSMMAP_SentParameter.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 09.01.19.
//  Copyright © 2019 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibgsmmap/UMGSMMAP_SentParameter.h>

@implementation UMGSMMAP_SentParameter

@synthesize operationName;

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
    if(_imsi)
    {
        [_imsi processBeforeEncode];
        if(isImplicit)
        {
            self.asn1_tag.tagNumber = 0;
            self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
            self.asn1_tag.isConstructed = _imsi.asn1_tag.isConstructed;
            if(self.asn1_tag.isConstructed)
            {
                self.asn1_data = [_imsi.asn1_data copy];
            }
            else
            {
                self.asn1_list = [_imsi.asn1_list copy];
            }
        }
        else
        {
            [_asn1_list addObject:_imsi];
        }
    }
    else if(_authenticationSet)
    {
        [_authenticationSet processBeforeEncode];
        if(isImplicit)
        {
            self.asn1_tag.tagNumber = 1;
            self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
            self.asn1_tag.isConstructed = _authenticationSet.asn1_tag.isConstructed;
            if(self.asn1_tag.isConstructed)
            {
                self.asn1_list = [_authenticationSet.asn1_list copy];
            }
            else
            {
                self.asn1_data = [_authenticationSet.asn1_data copy];
            }
        }
        else
        {
            _authenticationSet.asn1_tag.tagNumber = 1;
            _authenticationSet.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
            [_asn1_list addObject:_authenticationSet];
        }
    }
    else if(_authenticationSet)
    {
        [_subscriberData processBeforeEncode];
        if(isImplicit)
        {
            self.asn1_tag.tagNumber = 2;
            self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
            self.asn1_tag.isConstructed = _subscriberData.asn1_tag.isConstructed;
            if(self.asn1_tag.isConstructed)
            {
                self.asn1_list = [_subscriberData.asn1_list copy];
            }
            else
            {
                self.asn1_data = [_subscriberData.asn1_data copy];
            }
        }
        else
        {
            _subscriberData.asn1_tag.tagNumber = 2;
            _subscriberData.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
            [_asn1_list addObject:_subscriberData];
        }
    }
    else if(_authenticationSet)
    {
        [_ki processBeforeEncode];
        if(isImplicit)
        {
            self.asn1_tag.tagNumber = 4;
            self.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
            self.asn1_tag.isConstructed = _ki.asn1_tag.isConstructed;
            if(self.asn1_tag.isConstructed)
            {
                self.asn1_list = [_ki.asn1_list copy];
            }
            else
            {
                self.asn1_data = [_ki.asn1_data copy];
            }
        }
        else
        {
            _ki.asn1_tag.tagNumber = 4;
            _ki.asn1_tag.tagClass = UMASN1Class_ContextSpecific;
            [_asn1_list addObject:_ki];
        }
    }
    else
    {
        @throw([NSException exceptionWithName:@"PARAMETER_MISSING"
                                       reason:@"UMGSMMAP_ExtendedRoutingInfo choice missing"
                                     userInfo:@{    @"backtrace": UMBacktrace(NULL,0)}]);
    }
}


- (UMGSMMAP_SentParameter *) processAfterDecodeWithContext:(id)context
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

    if((o) && (o.asn1_tag.tagNumber ==0) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
    {
        _imsi = [[UMGSMMAP_IMSI alloc]initWithASN1Object:o context:context];
    }
    else if((o) && (o.asn1_tag.tagNumber == 1) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
    {
        _authenticationSet = [[UMGSMMAP_AuthenticationSetList alloc]initWithASN1Object:o context:context];
    }
    else if((o) && (o.asn1_tag.tagNumber == 2) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
    {
        _subscriberData = [[UMGSMMAP_SubscriberData alloc]initWithASN1Object:o context:context];
    }
    else if((o) && (o.asn1_tag.tagNumber == 4) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))
    {
        _ki = [[UMGSMMAP_Ki alloc]initWithASN1Object:o context:context];
    }
    return self;
}

- (NSString *) objectName
{
    return @"SentParameter";
}
- (id) objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    if(_imsi)
    {
        dict[@"imsi"] = _imsi.objectValue;
    }
    if(_authenticationSet)
    {
        dict[@"authenticationSet"] = _authenticationSet.objectValue;
    }
    if(_subscriberData)
    {
        dict[@"subscriberData"] = _subscriberData.objectValue;
    }
    if(_ki)
    {
        dict[@"ki"] = _ki.objectValue;
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


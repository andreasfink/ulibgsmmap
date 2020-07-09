//
//  UMLayerGSMMAP_OpCode.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMLayerGSMMAP_OpCode.h"
#import <ulibtcap/ulibtcap.h>

@implementation UMLayerGSMMAP_OpCode

- (UMLayerGSMMAP_OpCode *)initWithOperationCode:(int64_t)op
{
    self = [super init];
    if(self)
    {
        _operation = op;
        _familyOrEncoding = UMTCAP_itu_operationCodeEncoding_default;
    }
    return self;
}

- (UMLayerGSMMAP_OpCode *)initWithGlobalOperationCode:(int64_t)op
{
    self = [super init];
    if(self)
    {
        _operation = op;
        _familyOrEncoding = UMTCAP_itu_operationCodeEncoding_Global;
    }
    return self;
}

- (NSString *)description
{
    if((_familyOrEncoding == 0) && (_national == NO))
    {
        return [NSString stringWithFormat:@"%ld",(long)_operation];
    }
    return [NSString stringWithFormat:@"{ operation: %ld, family: %ld, national: %@ }",
            (long)_operation,
            (long)_familyOrEncoding,
            (_national ? @"YES" : @"NO")];
}
@end

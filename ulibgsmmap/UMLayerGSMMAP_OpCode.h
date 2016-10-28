//
//  UMLayerGSMMAP_OpCode.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulib/ulib.h>

@interface UMLayerGSMMAP_OpCode : UMObject
{
    int64_t operation;
    int64_t family;
    BOOL national;
}

@property (readwrite,assign) int64_t operation;
@property (readwrite,assign) int64_t family;
@property (readwrite,assign) BOOL national;
- (UMLayerGSMMAP_OpCode *)initWithOperationCode:(int64_t)op;
- (NSString *)description;

@end

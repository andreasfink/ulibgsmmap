//
//  UMGSMMAP_ReturnError_Req_Task.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 07.12.17.
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibtcap/ulibtcap.h>
#import "UMLayerGSMMAP_OpCode.h"

@class UMLayerGSMMAP;

@interface UMGSMMAP_ReturnError_Req_Task : UMLayerTask
{
    UMLayerGSMMAP *_instance;
    UMASN1Object *_param;
    NSString *_dialogId;
    int64_t _invokeId;
    int64_t _linkedId;
    UMLayerGSMMAP_OpCode *_opcode;
    int64_t _error;
    NSDictionary *_options;
}

- (UMGSMMAP_ReturnError_Req_Task *) initWithInstance:(UMLayerGSMMAP *)instance
                                               param:(UMASN1Object *)param
                                              dialog:(NSString *)dialogId
                                            invokeId:(int64_t)invokeId
                                            linkedId:(int64_t)linkedId
                                              opCode:(UMLayerGSMMAP_OpCode *)opcode
                                               error:(int64_t)error
                                             options:(NSDictionary *)options;
- (void)main;

@end



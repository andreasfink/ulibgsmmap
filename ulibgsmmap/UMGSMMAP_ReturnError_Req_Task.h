//
//  UMGSMMAP_ReturnError_Req_Task.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 07.12.17.
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibtcap/ulibtcap.h>
#import <ulibgsmmap/UMLayerGSMMAP_OpCode.h>
#import <ulibgsmmap/UMGSMMAP_DialogIdentifier.h>
#import <ulibgsmmap/UMGSMMAP_UserIdentifier.h>

@class UMLayerGSMMAP;

@interface UMGSMMAP_ReturnError_Req_Task : UMLayerTask
{
    UMLayerGSMMAP *_instance;
    UMASN1Object *_param;
    UMGSMMAP_DialogIdentifier *_dialogId;
    int64_t _invokeId;
    int64_t _linkedId;
    UMLayerGSMMAP_OpCode *_opcode;
    int64_t _error;
    NSDictionary *_options;
}

- (UMGSMMAP_ReturnError_Req_Task *) initWithInstance:(UMLayerGSMMAP *)instance
                                               param:(UMASN1Object *)param
                                              dialog:(UMGSMMAP_DialogIdentifier *)dialogId
                                            invokeId:(int64_t)invokeId
                                            linkedId:(int64_t)linkedId
                                              opCode:(UMLayerGSMMAP_OpCode *)opcode
                                               error:(int64_t)error
                                             options:(NSDictionary *)options;
- (void)main;

@end



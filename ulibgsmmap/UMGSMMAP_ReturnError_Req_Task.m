//
//  UMGSMMAP_ReturnError_Req_Task.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 07.12.17.
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMGSMMAP_ReturnError_Req_Task.h"
#import "UMLayerGSMMAP.h"
#import "UMGSMMAP_DialogIdentifier.h"

@implementation UMGSMMAP_ReturnError_Req_Task



- (UMGSMMAP_ReturnError_Req_Task *) initWithInstance:(UMLayerGSMMAP *)instance
                                               param:(UMASN1Object *)param
                                              dialog:(UMGSMMAP_DialogIdentifier *)dialogId
                                            invokeId:(int64_t)invokeId
                                            linkedId:(int64_t)linkedId
                                              opCode:(UMLayerGSMMAP_OpCode *)opcode
                                               error:(int64_t)error
                                             options:(NSDictionary *)options
{
    self = [super initWithName:[[self class]description]
                      receiver:instance
                        sender:NULL];
    {
        _instance = instance;
        _param = param;
        _dialogId = dialogId;
        _invokeId = invokeId;
        _linkedId = linkedId;
        _opcode = opcode;
        _error = error;
        _options = options;
    }
    return self;
}

- (void)main
{
    @autoreleasepool
    {
        [_instance executeMAP_ReturnError_Req:_param
                                       dialog:_dialogId
                                     invokeId:_invokeId
                                     linkedId:_linkedId
                                       opCode:_opcode
                                    errorCode:_error
                                      options:_options];
    }
}
@end

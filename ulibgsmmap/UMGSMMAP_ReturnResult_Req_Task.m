//
//  UMGSMMAP_ReturnResult_Req_Task.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 07.12.17.
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMGSMMAP_ReturnResult_Req_Task.h"
#import "UMLayerGSMMAP.h"
#import "UMGSMMAP_DialogIdentifier.h"

@implementation UMGSMMAP_ReturnResult_Req_Task



- (UMGSMMAP_ReturnResult_Req_Task *) initWithInstance:(UMLayerGSMMAP *)instance
                                                param:(UMASN1Object *)param
                                               dialog:(UMGSMMAP_DialogIdentifier *)dialogId
                                             invokeId:(int64_t)invokeId
                                             linkedId:(int64_t)linkedId
                                               opCode:(UMLayerGSMMAP_OpCode *)opcode
                                                 last:(int64_t)last
                                              options:(NSDictionary *)options
{
    self = [super initWithName:[[self class]description]
                      receiver:instance
                        sender:NULL];
    {
        _instance = instance;
        _dialogId = dialogId;
        _param = param;
        _invokeId = invokeId;
        _linkedId = linkedId;
        _opcode = opcode;
        _last = last;
        _options = options;
    }
    return self;
}

- (void)main
{
    
}
@end

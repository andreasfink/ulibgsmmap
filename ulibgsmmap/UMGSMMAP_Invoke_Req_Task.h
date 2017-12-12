//
//  UMGSMMAP_Invoke_Req_Task.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 07.12.17.
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibtcap/ulibtcap.h>
#import "UMLayerGSMMAP_OpCode.h"

@class UMLayerGSMMAP;
@class UMGSMMAP_DialogIdentifier;

@interface UMGSMMAP_Invoke_Req_Task : UMLayerTask
{
    UMLayerGSMMAP *_instance;
    UMASN1Object *_param;
    UMGSMMAP_DialogIdentifier *_dialogId;
    int64_t  _invokeId;
    int64_t  _linkedId;
    UMLayerGSMMAP_OpCode *_opCode;
    BOOL _last;
    NSDictionary *_options;
}

-(UMGSMMAP_Invoke_Req_Task *)initWithInstance:(UMLayerGSMMAP *)instance
                                   param:(UMASN1Object *)param
                                  dialog:(UMGSMMAP_DialogIdentifier *)dialogId
                                invokeId:(int64_t)xinvokeId
                                linkedId:(int64_t)xlinkedId
                                  opCode:(UMLayerGSMMAP_OpCode *)xopcode
                                    last:(int64_t)last
                                 options:(NSDictionary *)options;

- (void)main;

@end

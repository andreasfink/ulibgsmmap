//
//  UMGSMMAP_Delimiter_Req_Task.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 07.12.17.
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibgsmmap/UMGSMMAP_Delimiter_Req_Task.h>
#import "UMLayerGSMMAP.h"
#import <ulibgsmmap/UMGSMMAP_DialogIdentifier.h>

@implementation UMGSMMAP_Delimiter_Req_Task


-(UMGSMMAP_Delimiter_Req_Task *)initWithInstance:(UMLayerGSMMAP *)instance
                                          dialog:(UMGSMMAP_DialogIdentifier *)dialogId
                                  callingAddress:(SccpAddress *)callingAddress
                                   calledAddress:(SccpAddress *)calledAddress
                                         options:(NSDictionary *)options
                                          result:(UMTCAP_asn1_Associate_result *)result
                                      diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic
{
    self = [super initWithName:[[self class]description]
                      receiver:instance
                        sender:NULL];
    if(self)
    {
        _instance = instance;
        _dialogId = dialogId;
        _callingAddress = callingAddress;
        _calledAddress  = calledAddress;
        _options = options;
        _result = result;
        _result_source_diagnostic = result_source_diagnostic;
    }
    return self;
}

- (void)main
{
    @autoreleasepool
    {
        [_instance executeMAP_Delimiter_Req:_dialogId
                             callingAddress:_callingAddress
                              calledAddress:_calledAddress
                                    options:_options
                                     result:_result
                                 diagnostic:_result_source_diagnostic];
    }
}

@end

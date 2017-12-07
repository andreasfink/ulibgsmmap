//
//  UMGSMMAP_U_Abort_Req_Task.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 07.12.17.
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMGSMMAP_U_Abort_Req_Task.h"
#import "UMLayerGSMMAP.h"

@implementation UMGSMMAP_U_Abort_Req_Task

-(UMGSMMAP_U_Abort_Req_Task *)initWithInstance:(UMLayerGSMMAP *)instance
                                        dialog:(NSString *)dialogId
                                       options:(NSDictionary *)options
                                        result:(UMTCAP_asn1_Associate_result *)result
                                    diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic
                                      userInfo:(UMTCAP_asn1_userInformation *)userInfo

{
    self = [super initWithName:[[self class]description]
                      receiver:instance
                        sender:NULL];
    if(self)
    {
        _instance = instance;
        _dialogId = dialogId;
        _options = options;
        _result = result;
        _result_source_diagnostic = result_source_diagnostic;
        _userInfo = userInfo;
    }
    return self;
}

- (void)main
{
    [_instance executeMAP_U_Abort_Req:_dialogId
                              options:_options
                               result:_result
                           diagnostic:_result_source_diagnostic
                             userInfo:_userInfo];
}

@end

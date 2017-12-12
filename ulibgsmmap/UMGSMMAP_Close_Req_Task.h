//
//  UMGSMMAP_Close_Req_Task.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 07.12.17.
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibtcap/ulibtcap.h>

@class UMGSMMAP_DialogIdentifier;
@class UMLayerGSMMAP;

@interface UMGSMMAP_Close_Req_Task : UMLayerTask
{
    UMLayerGSMMAP *_instance;
    UMGSMMAP_DialogIdentifier *_dialogId;
    SccpAddress *_callingAddress;
    SccpAddress *_calledAddress;
    NSDictionary *_options;
    UMTCAP_asn1_Associate_result *_result;
    UMTCAP_asn1_Associate_source_diagnostic *_result_source_diagnostic;
}


-(UMGSMMAP_Close_Req_Task *)initWithInstance:(UMLayerGSMMAP *)instance
                                      dialog:(UMGSMMAP_DialogIdentifier *)dialogId
                              callingAddress:(SccpAddress *)callingAddress
                               calledAddress:(SccpAddress *)calledAddress
                                     options:(NSDictionary *)options
                                      result:(UMTCAP_asn1_Associate_result *)result
                                  diagnostic:(UMTCAP_asn1_Associate_source_diagnostic *)result_source_diagnostic;
- (void)main;

@end

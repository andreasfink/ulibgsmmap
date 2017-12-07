//
//  UMGSMMAP_TimeoutTask.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 25.01.17.
//
//

#import <ulib/ulib.h>

@class UMLayerGSMMAP;
@class UMLayerGSMMAP_Dialog;

@interface UMGSMMAP_TimeoutTask : UMLayerTask
{
    UMLayerGSMMAP_Dialog *_dialog;
}

- (UMGSMMAP_TimeoutTask *)initForGSMMAP:(UMLayerGSMMAP *)g dialog:(UMLayerGSMMAP_Dialog *)d;
- (void)main;

@end

//
//  UMGSMMAP_HousekeepingTask.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 25.01.17.
//
//

#import <ulib/ulib.h>

@class UMLayerGSMMAP;

@interface UMGSMMAP_HousekeepingTask : UMLayerTask
{
    UMLayerGSMMAP *gsmmapLayer;
}

- (UMGSMMAP_HousekeepingTask *)initForGSMMAP:(UMLayerGSMMAP *)g;
- (void)main;

@end

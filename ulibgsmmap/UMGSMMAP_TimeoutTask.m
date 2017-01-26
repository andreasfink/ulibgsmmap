//
//  UMGSMMAP_TimeoutTask.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 25.01.17.
//
//

#import "UMGSMMAP_TimeoutTask.h"
#import "UMLayerGSMMAP.h"

@implementation UMGSMMAP_TimeoutTask


- (UMGSMMAP_TimeoutTask *)initForGSMMAP:(UMLayerGSMMAP *)g dialog:(UMLayerGSMMAP_Dialog *)d
{
    self = [super initWithName:@"UMGSMMAP_TimeoutTask"
                      receiver:g
                        sender:NULL
       requiresSynchronisation:NO];
    if(self)
    {
        gsmmapLayer = g;
        dialog = d;
    }
    return self;
}

- (void) main
{
    [dialog timeOut];
}
@end

//
//  UMGSMMAP_TimeoutTask.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 25.01.17.
//
//

#import <ulibgsmmap/UMGSMMAP_TimeoutTask.h>
#import <ulibgsmmap/UMLayerGSMMAP.h>

@implementation UMGSMMAP_TimeoutTask


- (UMGSMMAP_TimeoutTask *)initForGSMMAP:(UMLayerGSMMAP *)g
                                 dialog:(UMLayerGSMMAP_Dialog *)d
{
    self = [super initWithName:[[self class]description]
                      receiver:g
                        sender:NULL];
    if(self)
    {
        _dialog = d;
    }
    return self;
}

- (void) main
{
    @autoreleasepool
    {
        [_dialog timeOut];
    }
}
@end

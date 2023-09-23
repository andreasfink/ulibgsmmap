//
//  UMGSMMAP_HousekeepingTask.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 25.01.17.
//
//

#import <ulibgsmmap/UMGSMMAP_HousekeepingTask.h>
#import "UMLayerGSMMAP.h"

@implementation UMGSMMAP_HousekeepingTask


- (UMGSMMAP_HousekeepingTask *)initForGSMMAP:(UMLayerGSMMAP *)g
{
    self = [super initWithName:[[self class]description]
                      receiver:g
                        sender:NULL];
    if(self)
    {
        gsmmapLayer = g;
    }
    return self;
}

- (void) main
{
    @autoreleasepool
    {
        [gsmmapLayer housekeeping];
    }
}
@end

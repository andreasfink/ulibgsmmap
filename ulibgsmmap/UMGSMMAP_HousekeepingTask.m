//
//  UMGSMMAP_HousekeepingTask.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 25.01.17.
//
//

#import "UMGSMMAP_HousekeepingTask.h"
#import "UMLayerGSMMAP.h"

@implementation UMGSMMAP_HousekeepingTask


- (UMGSMMAP_HousekeepingTask *)initForGSMMAP:(UMLayerGSMMAP *)g
{
    self = [super initWithName:@"UMGSMMAP_HousekeepingTask"
                      receiver:g
                        sender:NULL
       requiresSynchronisation:NO];
    if(self)
    {
        gsmmapLayer = g;
    }
    return self;
}

- (void) main
{
   [gsmmapLayer housekeeping];
}
@end

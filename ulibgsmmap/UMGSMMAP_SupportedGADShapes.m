//
//  UMGSMMAP_SupportedGADShapes.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 29/04/16.
//
//

#import <ulibgsmmap/UMGSMMAP_SupportedGADShapes.h>

@implementation UMGSMMAP_SupportedGADShapes

- (UMGSMMAP_SupportedGADShapes *)initWithHexString:(NSString *)h
{
    NSData *d = [h unhexedData];
    unsigned long bc = d.length * 8;
    
    return [super initWithValue:d bitcount:bc];
}
@end

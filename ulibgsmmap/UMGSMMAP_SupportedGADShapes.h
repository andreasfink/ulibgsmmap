//
//  UMGSMMAP_SupportedGADShapes.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 29/04/16.
//
//

#import <ulibasn1/ulibasn1.h>

@interface UMGSMMAP_SupportedGADShapes : UMASN1BitString

- (UMGSMMAP_SupportedGADShapes *)initWithHexString:(NSString *)h;

@end

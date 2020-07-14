//
//  UMGSMMAP_ISR_Information.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 14.07.20.
//  Copyright © 2020 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>


@interface UMGSMMAP_ISR_Information : UMASN1BitString

- (UMGSMMAP_ISR_Information *)initWithString:(NSString *)str;

@end


//
//  UMGSMMAP_LocationArea.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 07.12.16.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//

#import <ulibasn1/ulibasn1.h>

@interface UMGSMMAP_LocationArea : UMASN1Choice

- (UMGSMMAP_LocationArea *)initWithString:(NSString *)str;
@end

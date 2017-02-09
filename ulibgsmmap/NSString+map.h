//
//  NSString+map.h
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibasn1/ulibasn1.h>

@interface NSString (map)

+ (int) nibbleToInt:(char)c;
- (NSString *) hex;
- (NSString *) unhex;
- (NSData *) unhexData;
- (NSMutableData *) gsm16;
- (NSMutableData *) gsm8;
- (NSMutableData *) gsm7:(int *)nibblelen;
- (NSMutableData *) gsm7WithNibbleLenPrefix;
- (NSString *) randomize;

@end

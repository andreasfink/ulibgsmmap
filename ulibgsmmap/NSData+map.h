//
//  NSData+map.h
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/NSString+map.h>

@interface NSData (map)

- (NSString *) gsmHexString;
- (NSString *) hexString;
+ (NSData *) unhexFromString:(NSString *)str;
- (NSData *) unhex;

- (NSString *) stringFromGsm7withNibbleLengthPrefix;
- (NSString *) stringFromGsm7:(int)nibblelen;
- (NSString *) stringFromGsm8;
- (NSMutableData *) gsm7to8:(int)nibblelen;	/* Note: the 7 bit presentation always have a 'length' byte in nibbles in front */
- (NSMutableData *) gsm8to7:(int *)nibblelen;
- (NSMutableData *) gsm8to7withNibbleLengthPrefix;
@end



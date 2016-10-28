//
//  NSData+map.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//

#import <ulibasn1/ulibasn1.h>
#import "NSString+map.h"

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



//
//  UMGSMMAP_USSD_String.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_USSD_String.h"
#import "NSString+map.h"
#import "NSData+map.h"

@implementation UMGSMMAP_USSD_String

@synthesize operationName;

- (NSString *) objectName
{
	return @"UMGSMMAP_USSD_String";
}

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}

- (UMGSMMAP_USSD_String *)initWithString:(NSString *)s
{
    self = [super init];
    if(self)
	{
		NSMutableData *d8 = [s gsm8];
		if((d8.length % 8) == 7)
		{
			[d8 appendByte:0x0D]; /* filler character according to 3GPP_TS_23.038_V15 page 17 */
			/* If the total number of characters to be sent equals (8n-1) where n=1,2,3 etc. then there are 7 spare bits at the end of the message. To avoid the situation where the receiving entity confuses 7 binary zero pad bits as the @ character, the carriage return or <CR> character (defined in clause 6.1.1) shall be used for padding in this situation, just as for Cell Broadcast.
			 */
		}
		int nibblelen=0;
		NSData *d = [d8 gsm8to7:&nibblelen];
		self.asn1_data = d;
	}
    return self;
}

- (NSString *)stringValue
{
    NSString *s = [self.asn1_data stringFromGsm7:(int)(self.asn1_data.length * 2)];
	if((s.length % 8)==0)
	{
		if([s hasSuffix:@"\0x0D"]) /* remove padding carriage return according to above */
		{
			s = [s substringToIndex:s.length-1];
		}
	}
    return s;
}

-(id) objectValue
{
    return [self stringValue];
}

@end

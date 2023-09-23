//
//  UMGSMMAP_Tmsi.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_Tmsi.h>



static inline int nibbleToInt(const char a)
{
    if((a>='0') && (a<='9'))
    {
        return (a-'0');
    }
    if((a>='a') && (a<='f'))
    {
        return (a-'a'+10);
    }
    if((a>='A') && (a<='F'))
    {
        return (a-'A'+10);
    }
    return 0;
}


@implementation UMGSMMAP_Tmsi

@synthesize operationName;

- (NSString *) objectName
{
	return @"UMGSMMAP_Tmsi";
}


- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}


- (UMGSMMAP_Tmsi *)initWithString:(NSString*)s
{
    if (s==NULL)
    {
        return NULL;
    }
    self = [super init];
    if(self)
    {
        [self setFromString:s];
    }
    return self;
}

- (void)setFromString:(NSString *)s
{
    const char *bytes = s.UTF8String;
    NSUInteger length = s.length;
    
    NSUInteger i;
    NSUInteger n = (length+1)/2; /* if we have an odd number we have to round it up */
    NSMutableData *out = [[NSMutableData alloc]initWithCapacity:n];
    unsigned char a;
    unsigned char b;
    unsigned char c;
    for(i=0;i<n;i++)
    {
        b = bytes[2*i];
        if((2*i+1) >= length)
        {
            a = 'F';
        }
        else
        {
            a = bytes[2*i+1];
        }
        c = nibbleToInt(a)<<4 | nibbleToInt(b);
        [out appendBytes:&c length:1];
    }
    _asn1_data = out;
}

- (NSString *)stringValue
{
    NSMutableString *t = [[NSMutableString alloc]init];
    uint8_t c;
    uint8_t c1;
    uint8_t c2;
    
    const uint8_t *bytes = _asn1_data.bytes;
    NSUInteger n = _asn1_data.length;
    
    for(NSUInteger i=0;i<n;i++)
    {
        c = bytes[i];
        c1 = ((c & 0xF0) >> 4);
        c2 = (c & 0x0F);
        [t appendFormat:@"%01X",c2];
        if((i != (n-1)) && (c1!=0x0f))
        {
            [t appendFormat:@"%01X",c1];
        }
    }
    return t;
}

- (id)objectValue
{
    return [self stringValue];
}

@end

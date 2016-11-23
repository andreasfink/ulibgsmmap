//
//  NSData+map.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//

#import "NSData+map.h"
#import "NSString+map.h"
#import "GsmCharSet.h"
#import "stdint.h"

#define NRP '?'

@implementation NSData (DataHexFunctions)

- (NSString *) hexString
{
    NSMutableString *result;
    ssize_t i;
    ssize_t n;
    result = [[NSMutableString alloc]init];
    n = [self length];
    for(i=0;i<n;i++)
    {
        [result appendFormat:@"%02X",((unsigned char *)[self bytes])[i]];
    }
    return result;
    
}

- (NSString *) gsmHexString
{
    NSMutableString *result;
    ssize_t i;
    ssize_t n;
    result = [[NSMutableString alloc]init];
    n = [self length];
    for(i=0;i<n;i++)
    {
        [result appendFormat:@"%02X",((unsigned char *)[self bytes])[i]];
    }
    return result;
}

+ (NSData *) unhexFromString:(NSString *)str
{
    NSMutableData *result;
    ssize_t i;
    ssize_t n;
    int a;
    int b;
    unichar c;
    result = [[NSMutableData alloc]init];
    n = [str length];
    for(i=0;i<n;i+=2)
    {
        a = [NSString nibbleToInt:[str characterAtIndex: i]];
        b = [NSString nibbleToInt:[str characterAtIndex: i+1]];
        c = (a <<4) | b;
        [result appendBytes:&c length:1];
    }
    return result;
}


- (NSData *) unhex
{
    NSMutableData *r = NULL;
    NSData *result = NULL;
    ssize_t i;
    ssize_t n;
    int a;
    int b;
    int c;
    const unsigned char *src;
    
    n = [self length]/2;
    r = [[NSMutableData alloc]initWithCapacity: n];
    src = [self bytes];
    for(i=0;i<n;i++)
    {
        a = [NSString nibbleToInt:src[i*2]];
        b = [NSString nibbleToInt:src[i*2+1]];
        c = (a <<4) | b;
        [r appendBytes:&c length:1];
    }
    result = [NSData dataWithData: r];
    return result;
}

- (NSData *) hex
{
    NSMutableData *r;
    NSData *result;
    ssize_t i;
    ssize_t n;
    const unsigned char *src;
    char *dst;
    
    r = [[NSMutableData alloc]initWithCapacity: 2 *[self length]];
    n = [self length];
    
    src = [self bytes];
    dst = [r mutableBytes];
    for(i=0;i<n;i++)
    {
        snprintf(&dst[i*2],2,"%02X",src[i]);
    }
    result = [NSData dataWithData: r];
    return result;
}

-(NSString *) stringFromGsm8
{
    ssize_t i;
    ssize_t j;
    ssize_t n;
    uint16_t c1;
    unichar c;
    const unsigned char	*b = NULL;
    unichar			*uni = NULL;
    NSMutableData	*ubuf = NULL;
    NSString		*r = NULL;
    
    b = [self bytes];
    n = [self length];
    
    ubuf = [[NSMutableData  alloc]initWithCapacity: ((n+1) * 2)];
    uni = (unichar *)[ubuf bytes];
    j = 0;
    c1 = 0x00;
    for(i=0;i<n;i++)
    {
        c1 = c1 | b[i];
        switch(c1)
        {
            case 0x27:
                c1 = 0x2700;
                continue;
            case 0x2728:
                c = '{';
                break;
            case 0x2729:
                c = '}';
                break;
            case 0x273C:
                c = '[';
                break;
            case 0x273D:
                c = '~';
                break;
            case 0x273E:
                c = ']';
                break;
            case 0x272F:
                c = '\\';
                break;
            case 0x2765:
                c = 0x20AC; /* euro symbol */
                break;
            case 0x2714:
                c = '^';
                break;
            default:
                if(c1 > gsmToUnicode_table_size || (c1 < 0))
                {
                    c = ' ';
                }
                else
                {
                    c = gsmToUnicode[c1];
                }
        }
        uni[j++]= c;
        c1 = 0x00;
    }
    r = [[NSString alloc]initWithCharacters:uni length:j];
    return r;
}


-(NSString *) stringFromGsm7withNibbleLengthPrefix
{
    NSData				*d;
    const unsigned char	*b;
    NSString			*s;
    int					nibblelen;
    
    if([self length]< 2)
        return @"";
    b = [self bytes];
    nibblelen = b[0];
    d = [[NSData alloc]initWithBytesNoCopy:(void *)[self bytes]+1 length: [self length]-1 freeWhenDone:0];
    s = [d stringFromGsm7:nibblelen];
    return s;
}

-(NSString *) stringFromGsm7:(int)nibblelen
{
    return [[self gsm7to8:nibblelen]stringFromGsm8];
}

- (NSMutableData *)gsm7to8:(int)nibblelen
{
    NSMutableData *result = NULL;
    int inbyte = 0;
    int outbyte = 0;
    ssize_t len;
    ssize_t i;
    int bi;
    int bo;
    int bit;
    int	total_bitcount;
    const unsigned char *bytes;
    unsigned char ob;
    
   	len = [self length];
    result = [[NSMutableData alloc]initWithCapacity: (len*8/7)+1];
    i = 0;
    bi = 0;
    bo = 0;
    bytes = (const unsigned char *)[self bytes];
    inbyte = bytes[i++];
    
    total_bitcount = nibblelen * 4;
    while (total_bitcount--)
    {
        bit = inbyte & 0x01;
        bi++;
        outbyte = ((outbyte >> 1) & 0x3F) | (bit << 6);
        bo++;
        if (bo > 6)
        {
            ob = outbyte & 0xFF;
            [result appendBytes:&ob length:1];
            outbyte = 0;
            bo = 0;
        }
        if (bi > 7)	/* we have consumed 8 bits, we need another byte */
        {
            if (i >=len) /* no byte left? drop out */
                break;
            inbyte = bytes[i++];
            bi = 0;
        }
        else
        {
            inbyte = inbyte >> 1;
        }
    }
    return result;
    
}

- (NSMutableData *)gsm8to7:(int *)nibblelen;
{
    NSMutableData *result = NULL;
    ssize_t len;
    ssize_t i;
    int numbits;
    int value;
    ssize_t	len2;
    const unsigned char *bytes;
    unsigned char b;
    
    len    = [self length];
    result = [[NSMutableData alloc]initWithCapacity: len];
    bytes  = [self bytes];
    
    len2 = (len * 7 + 3) / 4;
    if(len2 > 0x7F)
    {
        NSLog(@"trying to do gsm8to7 with len2 = %ld. That can't work",len2);
    }
    if(nibblelen)
    {
        *nibblelen = len2 & 0xFF;
    }
    //[result appendBytes:&b	length:1];
    
    value = 0;       
    numbits = 0;      
    for (i = 0; i < len; i++)
    {              
        value += bytes[i]<< numbits;
        numbits += 7;
        if (numbits >= 8)
        {    
            b = value & 0xFF;
            [result appendBytes:&b	length:1];
            value >>= 8;
            numbits -= 8;
        }       
    }
    if (numbits > 0)
    {
        b = value & 0xFF;
        [result appendBytes:&b	length:1];
    }
    //[result appendBytes:&b	length:1];
    return result;
}

- (NSMutableData *) gsm8to7withNibbleLengthPrefix
{
    int nibblelen;
    unsigned char c;
    NSMutableData *m = [self gsm8to7:&nibblelen];
    NSMutableData *n = [[NSMutableData alloc]initWithBytes:&c length:1];
    [n appendData:m];
    return n;
}



@end

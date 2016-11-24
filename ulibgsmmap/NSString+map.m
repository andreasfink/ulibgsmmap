//
//  NSString+map.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "NSString+map.h"
#import "NSData+map.h"

#import "GsmCharSet.h"

@implementation NSString (map)

- (NSString *) randomize
{
    NSMutableData *d;
    long i;
    long n;
    unsigned char *b;
    NSString *str;
    
    d = [ NSMutableData dataWithData: [ self dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES ]];
    n = [ d length ];
    b = [ d mutableBytes ];
    for(i=0;i<n;i++)
    {
        if((b[i]=='X') || (b[i]=='x'))
            b[i] = '0' + (rand() % 10);
    }
    str = [[ NSString alloc ] initWithBytes:b length:n encoding:NSASCIIStringEncoding ];
    return str;
    
}


- (NSString *) hex
{
    NSMutableString *result;
    long i;
    long n;
    result = [[ NSMutableString alloc]init];
    n = [self length];
    for(i=0;i<n;i++)
    {
        [ result appendFormat:@"%02X",[self characterAtIndex:i ] % 256];
    }
    return result;
}

+ (int)nibbleToInt:(char)c
{
    if(c < 16)
        return c;
    switch(c)
    {
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
            return c - '0';
        case 'A':
        case 'a':
            return 0x0A;
        case 'B':
        case 'b':
            return 0x0B;
        case 'C':
        case 'c':
            return 0x0C;
        case 'D':
        case 'd':
            return 0x0D;
        case 'E':
        case 'e':
            return 0x0E;
        case 'F':
        case 'f':
            return 0x0F;
    }
    return 0;
}

- (NSString *) unhex
{
    NSMutableString *result;
    long i;
    long n;
    int a;
    int b;
    unichar c;
    result = [[ NSMutableString alloc]init];
    n = [self length];
    for(i=0;i<n;i+=2)
    {
        a = [NSString nibbleToInt:[self characterAtIndex: i]];
        if((i+1) < n)
            b = [NSString nibbleToInt:[self characterAtIndex: i+1]];
        else
            b = 0;
        c = (a <<4) | b;
        [ result appendFormat:@"%c",c];
    }
    return result;
}

- (NSData *) unhexData
{
    NSData *result;
    NSMutableData *r = NULL;
    long i;
    long n;
    int a;
    int b;
    unichar c;
    
    
    r = [[ NSMutableData alloc] initWithCapacity: [ self length ]/2];
    n = [self length];
    for(i=0;i<n;i+=2)
    {
        a = [NSString nibbleToInt:[self characterAtIndex: i]];
        b = [NSString nibbleToInt:[self characterAtIndex: i+1]];
        c = (a <<4) | b;
        [ r appendBytes:&c	length:1 ];
    }
    result = [ NSData dataWithData: r ];
    return result;
}


- (NSMutableData *) gsm8
{
    long i;
    long j;
    long n;
    unichar u;
    NSMutableData *result = NULL;
    int16_t	c;
    unsigned char outchar[4];
    
    n = [self length];
    result = [[NSMutableData alloc] init ];
    for(i=0;i<n;i++)
    {
        u = [self characterAtIndex:i];
        c = -1;
        switch(u)
        {
            case '{':
                c = 0x2729;
                break;
            case '}':
                c = 0x2729;
                break;
            case '[':
                c = 0x273C;
                break;
            case '~':
                c = 0x273D;
                break;
            case ']':
                c = 0x273E;
                break;
            case '\\':
                c = 0x272F;
                break;
            case 0x20AC: /* euro symbol */
                c = 0x2765;
                break;
            case '^':
                c = 0x2714;
                break;
            default:
                
                for(j=0;j<256;j++)
                {
                    if(gsmToUnicode[j] == u)
                    {
                        c = j;
                        break;
                    }
                }
                break;
        }
        if((c & 0xFF00) == 0x2700)
        {
            outchar[0] = 0x27;
            outchar[1] = c & 0xFF;
            [ result appendBytes:outchar length:2 ];
        }
        else if(c >= 0)
        {
            outchar[0] = c & 0xFF;
            [ result appendBytes:outchar length:1 ];
        }
        else
        {
            outchar[0] = '?';
            [ result appendBytes:outchar length:1 ];
        }
    }
    return result;
}


- (NSMutableData *)gsm7WithNibbleLenPrefix;
{
    int nibblelen = 0;
    unsigned char b;
    NSMutableData *d;
    d = [[ self gsm8 ] gsm8to7:&nibblelen ];
    b = nibblelen & 0xFF;
    
    [ d replaceBytesInRange:NSMakeRange(0,0) withBytes:&b length:1 ];
    return d;
}

- (NSMutableData *)gsm7: (int *)nibblelen
{
    return [[ self gsm8 ] gsm8to7:nibblelen ];
}

- (NSMutableData *)gsm16
{
    long i;
    long n;
    unichar u;
    NSMutableData *result = NULL;
    unsigned char outchar[4];
    
    n = [ self length ];
    result = [[ NSMutableData alloc] initWithCapacity: ([ self length] * 2) ];
    for(i=0;i<n;i++)
    {
        u = [ self characterAtIndex:i];
        outchar[0] = (u >> 8) & 0xFF;
        outchar[1] = u & 0xFF;
        [ result appendBytes:outchar length:2 ];
    }
    return result;
    
}

@end

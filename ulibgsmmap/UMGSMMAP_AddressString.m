//
//  UMGSMMAP_AddressString.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_AddressString.h"
#import "NSString+map.h"
#import "NSData+map.h"

#define MAXADDRLEN  63

static int digit_to_nibble(int digit);
static unsigned char nibble2hex(unsigned char b);
static int is_all_digits(const char *text, NSUInteger startpos, NSUInteger len);

static int is_all_digits(const char *text, NSUInteger startpos, NSUInteger len)
{
    NSUInteger i=0;
    for(i=startpos;i<len;i++)
    {
        switch(text[i])
        {
            case	'0':
            case	'1':
            case	'2':
            case	'3':
            case	'4':
            case	'5':
            case	'6':
            case	'7':
            case	'8':
            case	'9':
            case	'*':
            case	'#':
            case	'a':
                break;
            default:
                return 0;
        }
    }
    return 1;
}
static inline int digit_to_nibble(int digit)
{
    switch(digit)
    {
        case '0':
            return 0;
        case '1':
            return 1;
        case '2':
            return 2;
        case '3':
            return 3;
        case '4':
            return 4;
        case '5':
            return 5;
        case '6':
            return 6;
        case '7':
            return 7;
        case '8':
            return 8;
        case '9':
            return 9;
        case 'A':
        case 'a':
        case '*':
            return 0x0A;
        case 'B':
        case 'b':
        case '#':
            return 0x0B;
        case 'C':
        case 'c':
            return 0x0C;
        case 'D':
        case 'd':
            return 0x0d;
        case 'E':
        case 'e':
            return 0x0E;
        case 'F':
        case 'f':
            return 0x0F;
    }
    return 0;
}

static inline unsigned char	nibble2hex(unsigned char b)
{
    if(b < 0x0A)
    {
        return '0'+ b;
    }
    else
    {
        return 'A'+ b - 0x0A;
    }
}


@implementation UMGSMMAP_AddressString

@synthesize operationName;

- (UMGSMMAP_AddressString *)initWithMsisdn:(NSString *)digits
{
    return [self initWithString:digits];
}

- (UMGSMMAP_AddressString *)initWithImsi:(NSString *)digits
{
    return [self initWithAddress:digits ton:GSMMAP_TON_INTERNATIONAL npi:GSMMAP_NPI_E212];
}


- (UMGSMMAP_AddressString *)initWithAlpha:(NSString *)digits
{
	NSString *addr = [[[digits gsm8]gsm8to7withNibbleLengthPrefix]hexString];
	return [self initWithAddress:addr ton:GSMMAP_TON_ALPHANUMERIC npi:GSMMAP_NPI_UNKNOWN];
}

- (UMGSMMAP_AddressString *)initWithString:(NSString *)digits
{
    self = [super init];
    if(self)
    {
        if(digits == nil)
        {
            _address = @"";
            _ton = 0;
            _npi = 0;
        }
        else if([digits length] < 2)
        {
            _address = @"";
            _ton = 0;
            _npi = 0;
        }
        else if([digits hasPrefix:@":MISSING:"])
        {
            _address = [digits substringFromIndex:4];
            _ton = GSMMAP_TON_MISSING;
            _npi = GSMMAP_NPI_E214;
        }

        else if([digits hasPrefix:@"mgt:"])
        {
            _address = [digits substringFromIndex:4];
            _ton = GSMMAP_TON_INTERNATIONAL;
            _npi = GSMMAP_NPI_E214;
        }
        else if([digits hasPrefix:@"imsi:"])
        {
            _address = [digits substringFromIndex:5];
            _ton = GSMMAP_TON_INTERNATIONAL;
            _npi = GSMMAP_NPI_E212;
        }
        else if ([digits hasPrefix:@"+"])
        {
            _address = [digits substringFromIndex:1];
            _ton = GSMMAP_TON_INTERNATIONAL;
            _npi = GSMMAP_NPI_ISDN_E164;
        }
        else if(([digits length] >= 2) && [digits hasPrefix:@"00"])
        {
            _address = [digits substringFromIndex:2];
            _ton = GSMMAP_TON_INTERNATIONAL;
            _npi = GSMMAP_NPI_ISDN_E164;
        }
        else if(([digits length] >= 1) && [digits hasPrefix:@"0"])
        {
            _address = [digits substringFromIndex:1];
            _ton = GSMMAP_TON_NATIONAL;
            _npi = GSMMAP_NPI_ISDN_E164;
        }
        else if ([digits isEqualToString:@":EMPTY:"])
        {
            _address = @":EMPTY:";
            _ton = GSMMAP_TON_EMPTY;
            _npi = GSMMAP_NPI_UNKNOWN;
        }
        else if ([digits isEqualToString:@":MISSING:"])
        {
            _address = @":MISSING:";
            _ton = GSMMAP_TON_MISSING;
            _npi = GSMMAP_NPI_UNKNOWN;
        }
        else if ([digits compare:@":" options:NSLiteralSearch range:NSMakeRange(0,1)] == NSOrderedSame )
        {
            int aton;
            int anpi;
            
            char number[257];
            char numstr[257];
            memset(number,0,sizeof(number) );
            memset(numstr,0,sizeof(numstr));
            strncpy(numstr,[digits UTF8String],(sizeof(numstr)-1));
            
            /* this should do somehting like this sscanf(numstr,":%d:%d:%s",&aton,&anpi,number);
             but it should be safe to have additional : in the remaining string part */
            size_t i=0;
            size_t n=strlen(numstr);
            size_t colon_pos[3];
            int colon_index=0;
            
            for(i=0;i<n;i++)
            {
                if(numstr[i]==':')
                {
                    colon_pos[colon_index++] = i;
                    if (colon_index >=3)
                    {
                        break;
                    }
                }
            }
            if(colon_index < 3)
            {
                _address = @":EMPTY:";
                _ton = GSMMAP_TON_EMPTY;
                _npi = GSMMAP_NPI_UNKNOWN;
                return self;
            }
            numstr[colon_pos[1]]='\0';
            numstr[colon_pos[2]]='\0';
            aton = atoi(&numstr[colon_pos[0]+1]);
            anpi = atoi(&numstr[colon_pos[1]+1]);
            strncpy(number,&numstr[colon_pos[2]+1],(sizeof(number)-1));
            
            _ton = aton % 8;
            _npi = anpi % 16;
            size_t len = strlen(number);
            if(_ton==GSMMAP_TON_ALPHANUMERIC)
            {
                _address = [[NSString alloc] initWithBytes:number length:len encoding:(NSUTF8StringEncoding)];
            }
            else
            {
                size_t j=0;
                if(len >= sizeof(number))
                {
                    len = sizeof(number)-1;
                }
                for(i=0;i<len;i++)
                {
                    switch(number[i])
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
                            number[j++]=number[i];
                            break;
                        case 'A':
                        case 'a':
                            number[j++]='A';
                            break;
                        case 'B':
                        case 'b':
                            number[j++]='B';
                            break;
                        case 'C':
                        case 'c':
                            number[j++]='C';
                            break;
                        case 'D':
                        case 'd':
                            number[j++]='D';
                            break;
                        case 'E':
                        case 'e':
                            number[j++]='E';
                            break;
                        case 'F':
                        case 'f':
                            number[j++]='F';
                            break;
                        default:
                            break;
                    }
                }
                number[j] = '\0';
                _address = @(number);
            }
        }
        else
        {
            if(is_all_digits(digits.UTF8String, 0,digits.length)==0)
            {
                _ton = GSMMAP_TON_ALPHANUMERIC;
                _npi = GSMMAP_NPI_UNKNOWN;
                _address = [[[digits gsm8]gsm8to7withNibbleLengthPrefix]hexString];
            }
            else
            {
                _ton = GSMMAP_TON_INTERNATIONAL;
                _npi = GSMMAP_NPI_ISDN_E164;
                _address = digits;
            }
        }
    }
    return self;
}

- (UMGSMMAP_AddressString *)initWithAddress:(NSString *)msisdn ton:(GSMMAP_TonType)xton npi:(GSMMAP_NpiType)xnpi
{
    self = [super init];
    if(self)
    {
        _ton = xton;
        _npi = xnpi;
        _address = msisdn;
    }
    return self;
}


- (void)processBeforeEncode
{
    unsigned int	c=0;
    unsigned int	c1=0;
    unsigned int	c2=0;
    NSMutableData *data = [[NSMutableData alloc]init];
    NSUInteger i=0;
    NSUInteger len=0;
    int odd=0;
    
    if((_ton==GSMMAP_TON_EMPTY) || (_ton==GSMMAP_TON_MISSING))
    {
        [data appendByte:0x81]; /* ton=0/npi = 1,no extension */
        [data appendByte:0xFF];
        _asn1_data = data;
        return;
    }

    c = (_ton & 0x07) << 4;
    c |= (_npi & 0x0F);
    c |= 0x80;	/* no extension */
    [data appendByte:c];
    
    NSData *ad = [_address dataUsingEncoding:NSUTF8StringEncoding];
    len = ad.length;
    const uint8_t *bytes = ad.bytes;
    
    if(_ton == 5) /* alpha */
    {
        for(i=1;i<len;i++)
        {
            c = bytes [i];
            //      c = ((c & 0x0F)<< 4) + ((c & 0xF0) >> 4);
            [data appendByte:c];
        }
    }
    else
    {
        if(len > MAXADDRLEN)
        {
            len = MAXADDRLEN;
        }
        odd = len % 2;
        for(i=0;i<len;i++)
        {
            if( (i % 2) == 0)
            {
                c1 = digit_to_nibble(bytes[i]);
            }
            else
            {
                c2 = digit_to_nibble(bytes[i]);
                c = (unsigned char)((c2 << 4) | c1);
                [data appendByte:c];
            }
        }
        if(odd)
        {
            c2 = 0x0F;
            c = (unsigned char)((c2 << 4) | c1);
            [data appendByte:c];
        }
    }
    _asn1_data = data;
}

- (UMGSMMAP_AddressString *)processAfterDecodeWithContext:(id)context

{
    unsigned char c;
    unsigned char a;
    unsigned char b;
    
    NSUInteger pos=0;
    NSUInteger len = _asn1_data.length;
    const uint8_t *str = _asn1_data.bytes;
    if(len == 0)
    {
        @throw([NSException exceptionWithName:@"DECODING_ERROR" reason:@"UMGSMMAP_AddressString has length 0" userInfo:NULL]);
    }

    if(len > 1)
    {
        _ton = str[pos++];
        _npi = _ton & 0x0F;
        _ton =  (_ton >> 4) & 0x07;
    }
    NSMutableData *tmp = [[NSMutableData alloc]init];
    while(--len > 0)
    {
        c = str[pos++];
        a =  c & 0x0F;
        b =  ((c & 0xF0) >> 4);
        
        if((b == 0x0F) && (len < 2))
        {
            [tmp appendByte:nibble2hex(a)];
        }
        else
        {
            [tmp appendByte:nibble2hex(a)];
            [tmp appendByte:nibble2hex(b)];
        }
    }
    _address = [[NSString alloc]initWithData:tmp encoding:NSUTF8StringEncoding];
    return self;
}

- (NSString *)objectName
{
    return @"AddressString";
}

- (id)objectValue
{
    UMSynchronizedSortedDictionary *a = [[UMSynchronizedSortedDictionary alloc]init];
    a[@"ton"] = @(_ton);
    a[@"npi"] = @(_npi);
    if(_address)
    {
        a[@"address"] = _address;
    }
    return a;
}

- (NSString *)stringValue
{
    if((_ton==GSMMAP_TON_INTERNATIONAL) && (_npi==GSMMAP_NPI_ISDN_E164))
    {
        return [NSString stringWithFormat:@"+%@",_address];
    }
    else if(_ton==GSMMAP_NPI_UNKNOWN)
    {
        return _address;
    }
    else if(_ton==GSMMAP_NPI_E212)
    {
        return [NSString stringWithFormat:@"imsi:%@",_address];
    }
    else
    {
        return [NSString stringWithFormat:@"ton=%d npi=%d digits=%@",_ton,_npi,_address];
    }
}

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}


- (NSData *)berEncoded
{
    if(_ton == GSMMAP_TON_MISSING)
    {
        return [[NSData alloc]init];
    }
    return [super berEncoded];
}

@end

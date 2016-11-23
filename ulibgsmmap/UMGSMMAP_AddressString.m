//
//  UMGSMMAP_AddressString.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
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


- (UMGSMMAP_AddressString *)initWithString:(NSString *)digits
{
    self = [super init];
    if(self)
    {
        if(digits == nil)
        {
            address = @"";
            ton = 0;
            npi = 0;
        }
        else if([digits length] < 2)
        {
            address = @"";
            ton = 0;
            npi = 0;
        }
        else if ([digits compare:@"+" options:NSLiteralSearch range:NSMakeRange(0,1)] == NSOrderedSame )
        {
            address = [digits substringFromIndex:1];
            ton = GSMMAP_TON_INTERNATIONAL;
            npi = GSMMAP_NPI_ISDN_E164;
        }
        else if(([digits length] >= 2) && ( [digits compare:@"00" options:NSLiteralSearch  range:NSMakeRange(0,2)] == NSOrderedSame ))
        {
            address = [digits substringFromIndex:2];
            ton = GSMMAP_TON_INTERNATIONAL;
            npi = GSMMAP_NPI_ISDN_E164;
        }
        else if ( [digits compare:@"0" options:NSLiteralSearch range:NSMakeRange(0,1)] == NSOrderedSame )
        {
            address = [digits substringFromIndex:1];
            ton = GSMMAP_TON_NATIONAL;
            npi = GSMMAP_NPI_ISDN_E164;
        }
        else if ([digits isEqualToString:@":EMPTY:"])
        {
            address = @":EMPTY:";
            ton = GSMMAP_TON_EMPTY;
            npi = GSMMAP_NPI_UNKNOWN;
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
                address = @":EMPTY:";
                ton = GSMMAP_TON_EMPTY;
                npi = GSMMAP_NPI_UNKNOWN;
                return self;
            }
            numstr[colon_pos[1]]='\0';
            numstr[colon_pos[2]]='\0';
            aton = atoi(&numstr[colon_pos[0]+1]);
            anpi = atoi(&numstr[colon_pos[1]+1]);
            strncpy(number,&numstr[colon_pos[2]+1],(sizeof(number)-1));
            
            ton = aton % 8;
            npi = anpi % 16;
            size_t len = strlen(number);
            if(ton==GSMMAP_TON_ALPHANUMERIC)
            {
                address = [[NSString alloc] initWithBytes:number length:len encoding:(NSUTF8StringEncoding)];
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
                address = @(number);
            }
        }
        else
        {
            if(is_all_digits(digits.UTF8String, 0,digits.length)==0)
            {
                ton = GSMMAP_TON_ALPHANUMERIC;
                npi = GSMMAP_NPI_UNKNOWN;
                address = [[[digits gsm8]gsm8to7withNibbleLengthPrefix]hexString];
            }
            else
            {
                ton = GSMMAP_TON_INTERNATIONAL;
                npi = GSMMAP_NPI_ISDN_E164;
                address = digits;
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
        ton = xton;
        npi = xnpi;
        address = msisdn;
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
    
    if((ton==GSMMAP_TON_EMPTY) || (ton==GSMMAP_TON_MISSING))
    {
        [data appendByte:0x80]; /* ton/npi = 0,no extension */
        [data appendByte:0xFF];
        asn1_data = data;
        return;
    }
    
    c = (ton & 0x07) << 4;
    c |= (npi & 0x0F);
    c |= 0x80;	/* no extension */
    [data appendByte:c];
    
    NSData *ad = [address dataUsingEncoding:NSUTF8StringEncoding];
    len = ad.length;
    const uint8_t *bytes = ad.bytes;
    
    if(ton == 5) /* alpha */
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
    asn1_data = data;
}

- (UMGSMMAP_AddressString *)processAfterDecodeWithContext:(id)context

{
    unsigned char c;
    unsigned char a;
    unsigned char b;
    
    NSUInteger pos=0;
    NSUInteger len = asn1_data.length;
    const uint8_t *str = asn1_data.bytes;
    
    ton = str[pos++];
    npi = ton & 0x0F;
    ton =  (ton >> 4) & 0x07;
    
    NSMutableData *tmp = [[NSMutableData alloc]init];
    while(--len)
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
    address = [[NSString alloc]initWithData:tmp encoding:NSUTF8StringEncoding];
    return self;
}

- (NSString *)objectName
{
    return @"AddressString";
}

- (id)objectValue
{
    UMSynchronizedSortedDictionary *a = [[UMSynchronizedSortedDictionary alloc]init];
    a[@"ton"] = @(ton);
    a[@"npi"] = @(npi);
    if(address)
    {
        a[@"address"] = address;
    }
    return a;
}

- (NSString *)stringValue
{
    if((ton==GSMMAP_TON_INTERNATIONAL) && (npi==GSMMAP_NPI_ISDN_E164))
    {
        return [NSString stringWithFormat:@"+%@",address];
    }
    else if(ton==GSMMAP_NPI_UNKNOWN)
    {
        return address;
    }
    else if(ton==GSMMAP_NPI_E212)
    {
        return [NSString stringWithFormat:@"imsi:%@",address];
    }
    else
    {
        return [NSString stringWithFormat:@"ton=%d npi=%d digits=%@",ton,npi,address];
    }
}

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}

@end

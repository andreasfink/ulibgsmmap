//
//  UMGSMMAP_GSN_Address.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#include  <arpa/inet.h>
#import "UMGSMMAP_GSN_Address.h"

@implementation UMGSMMAP_GSN_Address


- (NSString *) objectName
{
	return @"GSN-Address";
}

- (UMGSMMAP_GSN_Address *)initWithString:(NSString *)s
{
    self = [super init];
    if(self)
    {
        [self setStringValue:s];
    }
    return self;
}

- (NSString *)stringValue
{
    const uint8_t *bytes = _asn1_data.bytes;
    NSString *s=@"";
    
    if(_asn1_data.length==5)
    {
        s = [NSString stringWithFormat:@"ipv4:%d.%d.%d.%d",(int)bytes[1],(int)bytes[2],(int)bytes[3],(int)bytes[4]];
    }
    else if(_asn1_data.length==17)
    {
        char buf[32];
        NSString *a =@( inet_ntop(AF_INET6,&bytes[1],buf,16));
        s = [NSString stringWithFormat:@"ipv6:%@",a];
    }
    return s;
}

- (void)setStringValue:(NSString *)s
{
    if ([s hasPrefix:@"ipv4:"])
    {
        int a,b,c,d;
        sscanf(s.UTF8String,"ipv4:%d.%d.%d.%d",&a,&b,&c,&d);
        uint8_t bytes[5];
        bytes[0] = 0x04;
        bytes[1] = a & 0xFF;
        bytes[2] = b & 0xFF;
        bytes[3] = c & 0xFF;
        bytes[4] = d & 0xFF;
        _asn1_data = [NSData dataWithBytes:bytes length:5];
    }
    else if ([s hasPrefix:@"ipv6:"])
    {
        NSData *d = [UMSocket sockaddrFromAddress:s port:0 socketFamily:AF_INET6];
        struct sockaddr_in6 *sa6 = (struct sockaddr_in6 *)d.bytes;
        
        uint8_t bytes[17];
        bytes[0] = 0x1 << 6 | 0x10;
        memcpy(&bytes[1],&sa6->sin6_addr.s6_addr[0],16);
        _asn1_data = [NSData dataWithBytes:bytes length:17];
    }
    else
    {
        NSArray *arr = [s componentsSeparatedByString:@"."];
        int a=0;
        int b=0;
        int c=0;
        int d=0;
        if(arr.count==4)
        {
            a = [arr[0] intValue];
            b = [arr[1] intValue];
            c = [arr[2] intValue];
            d = [arr[3] intValue];
        }
        uint8_t bytes[5];
        bytes[0] = 0x04;
        bytes[1] = a & 0xFF;
        bytes[2] = b & 0xFF;
        bytes[3] = c & 0xFF;
        bytes[4] = d & 0xFF;
        _asn1_data = [NSData dataWithBytes:bytes length:5];
    }
}

- (id)objectValue
{
    return [self stringValue];
}
@end

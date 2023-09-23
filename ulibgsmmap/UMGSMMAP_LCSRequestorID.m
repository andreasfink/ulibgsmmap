//
//  UMGSMMAP_LCSRequestorID.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 04/07/16.
//
//

#import <ulibgsmmap/UMGSMMAP_LCSRequestorID.h>

@implementation UMGSMMAP_LCSRequestorID

- (UMGSMMAP_LCSRequestorID *)initWithString:(NSString *)str
{
    self = [super init];
    if(self)
    {
        uint8_t b = 0x0F;
        NSData *d = [[NSData alloc]initWithBytes:&b length:1];
        _dataCodingScheme = [[UMGSMMAP_USSD_DataCodingScheme alloc]initWithValue:d];
        _requestorIdString = [[UMGSMMAP_RequestorIDString alloc]initWithString:str];
    }
    return self;
}
@end

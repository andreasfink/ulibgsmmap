//
//  UMGSMMAP_LCSClientType.m
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_LCSClientType.h"

@implementation UMGSMMAP_LCSClientType

@synthesize operationName;

- (NSString *) objectName
{
	return @"UMGSMMAP_LCSClientType";
}

- (UMGSMMAP_LCSClientType *)initWithString:(NSString *)lcsClientType
{
    self = [super init];
    if(self)
    {
        
        if(([lcsClientType isEqualToString:@"0"]) || ([lcsClientType isEqualToString:@"emergencyServices"]))
        {
            self.value = 0;
        }
        else if(([lcsClientType isEqualToString:@"1"]) || ([lcsClientType isEqualToString:@"valueAddedServices"]))
        {
            self.value = 1;
        }
        else if(([lcsClientType isEqualToString:@"2"]) || ([lcsClientType isEqualToString:@"plmnOperatorServices"]))
        {
            self.value = 2;
        }
        else if(([lcsClientType isEqualToString:@"3"]) || ([lcsClientType isEqualToString:@"lawfulInterceptServices"]))
        {
            self.value = 3;
        }
        else
        {
            self.value = [lcsClientType integerValue];
        }
    }
    return self;
}


- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}

@end

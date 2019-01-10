//
//  UMGSMMAP_RequestParameter.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 09.01.19.
//  Copyright © 2019 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMGSMMAP_RequestParameter.h"

@implementation UMGSMMAP_RequestParameter

@synthesize operationName;

- (UMGSMMAP_RequestParameter *)initWithString:(NSString *)s
{
    s = [s stringByTrimmingCharactersInSet:[UMObject whitespaceAndNewlineCharacterSet]];
    if([s isEqualToString:@"requestIMSI"])
    {
        return [super initWithValue:UMGSMMAP_RequestParameter_requestIMSI];
    }
    if([s isEqualToString:@"requestAuthenticationSet"])
    {
        return [super initWithValue:UMGSMMAP_RequestParameter_requestAuthenticationSet];
    }
    if([s isEqualToString:@"requestSubscriberData"])
    {
        return [super initWithValue:UMGSMMAP_RequestParameter_requestSubscriberData];
    }
    if([s isEqualToString:@"requestKi"])
    {
        return [super initWithValue:UMGSMMAP_RequestParameter_requestKi];
    }
    return [super initWithValue:(int64_t)[s integerValue]];
}

- (NSString *) objectName
{
    return @"RequestParameter";
}

- (id) objectValue
{
    switch(self.value)
    {
        case UMGSMMAP_RequestParameter_requestIMSI:
            return @"requestIMSI (0)";
            break;
        case UMGSMMAP_RequestParameter_requestAuthenticationSet:
            return @"requestAuthenticationSet (1)";
            break;
        case UMGSMMAP_RequestParameter_requestSubscriberData:
            return @"requestSubscriberData (2)";
            break;
        case UMGSMMAP_RequestParameter_requestKi:
        return @"requestKi (4)";
        break;
        default:
            return [NSString stringWithFormat:@"undefined (%d)",(int)self.value];
    }
}

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}



@end


//
//  UMGSMMAP_ProcedureCancellationReason.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_ProcedureCancellationReason.h"

@implementation UMGSMMAP_ProcedureCancellationReason
@synthesize operationName;

- (UMASN1Enumerated *)initWithString:(NSString *)s
{
    s = [s stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if([s isEqualToString:@"handoverCancellation"])
    {
        return [super initWithValue:0];
    }
    if([s isEqualToString:@"radioChannelRelease"])
    {
        return [super initWithValue:1];
    }
    if([s isEqualToString:@"networkPathRelease"])
    {
        return [super initWithValue:2];
    }
    if([s isEqualToString:@"callRelease"])
    {
        return [super initWithValue:3];
    }
    if([s isEqualToString:@"associatedProcedureFailure"])
    {
        return [super initWithValue:4];
    }
    if([s isEqualToString:@"tandemDialogueRelease"])
    {
        return [super initWithValue:5];
    }
    if([s isEqualToString:@"remoteOperationsFailure"])
    {
        return [super initWithValue:6];
    }
    return [super initWithValue:(int64_t)[s integerValue]];
}

- (NSString *) objectName
{
	return @"ProcedureCancellationReason";
}

- (id) objectValue
{
    switch(self.value)
    {
        case(0):
            return @"handoverCancellation (0)";
            break;
        case(1):
            return @"radioChannelRelease (1)";
            break;
        case(2):
            return @"networkPathRelease (2)";
            break;
        case(3):
            return @"callRelease (3)";
            break;
        case(4):
            return @"associatedProcedureFailure (4)";
            break;
        case(5):
            return @"tandemDialogueRelease (5)";
            break;
        case(6):
            return @"remoteOperationsFailure (6)";
            break;
        default:
            return [NSString stringWithFormat:@"undefined (%d)",(int)self.value];
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


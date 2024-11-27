//
//  UMGSMMAP_SM_DeliveryOutcome.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_SM_DeliveryOutcome.h>

@implementation UMGSMMAP_SM_DeliveryOutcome

@synthesize operationName;

- (NSString *) objectName
{
	return @"UMGSMMAP_SM_DeliveryOutcome";
}

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}


- (void)setEnumDefinition
{
    _enumDefinition = @ {
        @"memory-capacity-exceeded" : @(UMGSMMAP_SM_DeliveryOutcome_memoryCapacityExceeded),
        @"absent-subscriber" : @(UMGSMMAP_SM_DeliveryOutcome_absentSubscriber),
        @"successful-transfer" : @(UMGSMMAP_SM_DeliveryOutcome_successfulTransfer)
    };
}

@end

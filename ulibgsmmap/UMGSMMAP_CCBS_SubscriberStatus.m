//
//  UMGSMMAP_CCBS_SubscriberStatus.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_CCBS_SubscriberStatus.h>

@implementation UMGSMMAP_CCBS_SubscriberStatus

@synthesize operationName;

- (NSString *) objectName
{
	return @"CCBS-SubscriberStatus";
}



- (void)setEnumDefinition
{
    _enumDefinition = @ {
        @"ms-ccbsNotIdle" : @(UMGSMMAP_CCBS_SubscriberStatus_ccbsNotIdle),
        @"ccbsIdle" : @(UMGSMMAP_CCBS_SubscriberStatus_ccbsIdle),
        @"ccbsNotReachable" : @(UMGSMMAP_CCBS_SubscriberStatus_ccbsNotReachable),
    };
}


- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}

@end

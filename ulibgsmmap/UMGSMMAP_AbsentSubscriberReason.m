//
//  UMGSMMAP_AbsentSubscriberReason.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_AbsentSubscriberReason.h"

@implementation UMGSMMAP_AbsentSubscriberReason

@synthesize operationName;

- (NSString *) objectName
{
	return @"AbsentSubscriberReason";
}

- (void)setEnumDefinition
{
    _enumDefinition = @ {
        @"imsiDetach" : @(UMGSMMAP_AbsentSubscriberReason_imsiDetach),
        @"restrictedArea" : @(UMGSMMAP_AbsentSubscriberReason_restrictedArea),
        @"noPageResponse" : @(UMGSMMAP_AbsentSubscriberReason_noPageResponse),
        @"purgedMS" : @(UMGSMMAP_AbsentSubscriberReason_purgedMS),
        @"mtRoamingRetry" : @(UMGSMMAP_AbsentSubscriberReason_mtRoamingRetry),
        @"busySubscriber" : @(UMGSMMAP_AbsentSubscriberReason_busySubscriber),
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

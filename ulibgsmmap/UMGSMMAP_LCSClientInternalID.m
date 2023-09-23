//
//  UMGSMMAP_LCSClientInternalID.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_LCSClientInternalID.h>

@implementation UMGSMMAP_LCSClientInternalID

@synthesize operationName;

- (NSString *) objectName
{
	return @"UMGSMMAP_LCSClientInternalID";
}

- (void)setEnumDefinition
{
    _enumDefinition = @ {
        @"broadcastService"          : @(UMGSMMAP_LCSClientInternalID_broadcastService),
        @"o-andM-HPLMN"              : @(UMGSMMAP_LCSClientInternalID_o_andM_HPLMN),
        @"o-andM-VPLMN"              : @(UMGSMMAP_LCSClientInternalID_o_andM_VPLMN),
        @"anonymousLocation"         : @(UMGSMMAP_LCSClientInternalID_anonymousLocation),
        @"targetMSsubscribedService" : @(UMGSMMAP_LCSClientInternalID_targetMSsubscribedService),
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

//
//  UMGSMMAP_CallOutcome.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_CallOutcome.h>

@implementation UMGSMMAP_CallOutcome

@synthesize operationName;

- (NSString *) objectName
{
	return @"UMGSMMAP_CallOutcome";
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
    _enumDefinition  = @ {
        @"success" : @(UMGSMMAP_CallOutcome_success),
        @"failure" : @(UMGSMMAP_CallOutcome_failure),
        @"busy" : @(UMGSMMAP_CallOutcome_busy),
    };
}

@end

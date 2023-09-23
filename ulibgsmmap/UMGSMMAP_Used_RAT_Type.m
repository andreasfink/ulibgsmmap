//
//  UMGSMMAP_Used_RAT_Type.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibgsmmap/UMGSMMAP_Used_RAT_Type.h>

@implementation UMGSMMAP_Used_RAT_Type

@synthesize operationName;

- (NSString *) objectName
{
	return @"UMGSMMAP_Used_RAT_Type";
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
        @"utran" : @(UMGSMMAP_Used_RAT_Type_utran),
        @"geran" : @(UMGSMMAP_Used_RAT_Type_geran),
        @"gan" : @(UMGSMMAP_Used_RAT_Type_gan),
        @"i-hspa-evolution" : @(UMGSMMAP_Used_RAT_Type_i_hspa_evolution),
        @"e-utran" : @(UMGSMMAP_Used_RAT_Type_e_utran),
    };
}

@end

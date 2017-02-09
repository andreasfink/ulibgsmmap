//
//  UMGSMMAP_ODB_HPLMN_Data.m
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import "UMGSMMAP_ODB_HPLMN_Data.h"

@implementation UMGSMMAP_ODB_HPLMN_Data

@synthesize operationName;

- (NSString *) objectName
{
	return @"UMGSMMAP_ODB_HPLMN_Data";
}


- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}

@end

//
//  UMGSMMAP_UESBI_IuB.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 28.02.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibgsmmap/UMGSMMAP_UESBI_IuB.h>

@implementation UMGSMMAP_UESBI_IuB

- (NSString *) objectName
{
    return @"UESBI-IuB";
}

@synthesize operationName;

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context
{
    return self;
}
@end

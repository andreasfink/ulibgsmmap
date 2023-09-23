//
//  UMGSMMAP_UESBI_Iu.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 28.02.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibgsmmap/UMGSMMAP_UESBI_Iu.h>

@implementation UMGSMMAP_UESBI_Iu

- (NSString *) objectName
{
    return @"UESBI-Iu";
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

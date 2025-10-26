//
//  UMGSMMAP_BeingSubscriberActivityArg.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 06.08.2025.
//  Copyright © 2025 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>
#import <ulibgsmmap/UMGSMMAP_IMSI.h>
#import <ulibgsmmap/UMGSMMAP_AddressString.h>

/*
BeginSubscriberActivityArg ::= SEQUENCE {
    imsi            IMSI,
    originatingEntityNumber ISDN-AddressString,
    msisdn                  [PRIVATE 28] AddressString OPTIONAL,
    ... }
*/

@interface UMGSMMAP_BeginSubscriberActivityArg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
    UMGSMMAP_IMSI           *_imsi;
    UMGSMMAP_AddressString  *_msisdn;
}

@property(readwrite,strong)    UMGSMMAP_IMSI            *imsi;
@property(readwrite,strong)    UMGSMMAP_AddressString   *msisdn;
@property(readwrite,strong)    NSString                 *operationName;


- (void)processBeforeEncode;
- (UMGSMMAP_BeginSubscriberActivityArg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

//
//  UMGSMMAP_RequestingNodeType.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 06.03.17.
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

typedef enum UMGSMMAP_RequestingNodeType_enum
{
    UMGSMMAP_RequestingNodeType_vlr = 0,
    UMGSMMAP_RequestingNodeType_sgsn = 1,
    UMGSMMAP_RequestingNodeType_s_cscf = 2,
    UMGSMMAP_RequestingNodeType_bsf= 3,
    UMGSMMAP_RequestingNodeType_gan_aaa_server = 4,
    UMGSMMAP_RequestingNodeType_wlan_aaa_server = 5,
    UMGSMMAP_RequestingNodeType_mme = 16,
    UMGSMMAP_RequestingNodeType_mme_sgsn = 17,
} UMGSMMAP_RequestingNodeType_enum;

@interface UMGSMMAP_RequestingNodeType : UMASN1Enumerated
{
    NSString *operationName;
}

@property(readwrite,strong)    NSString *operationName;

- (UMGSMMAP_RequestingNodeType *)initWithString:(NSString *)s;
- (NSString *)objectName;
- (id)objectValue;
/*
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;
 */

@end

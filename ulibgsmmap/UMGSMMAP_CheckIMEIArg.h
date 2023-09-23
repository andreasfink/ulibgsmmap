//
//  UMGSMMAP_CheckIMEIArg.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 28.02.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

@class UMGSMMAP_IMEI;
@class UMGSMMAP_RequestedEquipmentInfo;
@class UMGSMMAP_ExtensionContainer;
@class UMGSMMAP_IMSI;

@interface UMGSMMAP_CheckIMEIArg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
    UMGSMMAP_IMEI *_imei;
    UMGSMMAP_RequestedEquipmentInfo *_requestedEquipmentInfo;
    UMGSMMAP_ExtensionContainer *_extensionContainer;
    UMGSMMAP_IMSI *_imsi;
    UMASN1OctetString *_locationInformation;
    BOOL _locationInformationPresent;
    int _rat;
    int _lac;
    int _ci;
    int _sac;
}

@property(readwrite,strong,atomic) UMGSMMAP_IMEI *imei;
@property(readwrite,strong,atomic) UMGSMMAP_IMSI *imsi;
@property(readwrite,strong,atomic) UMASN1OctetString *locationInformation;

@property(readwrite,strong,atomic) UMGSMMAP_RequestedEquipmentInfo *requestedEquipmentInfo;
@property(readwrite,strong,atomic) UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,strong) NSString *operationName;

@property(readwrite,assign,atomic) BOOL locationInformationPresent;
@property(readwrite,assign,atomic) int rat;
@property(readwrite,assign,atomic) int lac;
@property(readwrite,assign,atomic) int ci;
@property(readwrite,assign,atomic) int sac;

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end


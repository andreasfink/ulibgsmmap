//
//  UMGSMMAP_CheckIMEIArg.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 28.02.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

@class UMGSMMAP_IMEI;
@class UMGSMMAP_RequestedEquipmentInfo;
@class UMGSMMAP_ExtensionContainer;

@interface UMGSMMAP_CheckIMEIArg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
    UMGSMMAP_IMEI *_imei;
    UMGSMMAP_RequestedEquipmentInfo *_requestedEquipmentInfo;
    UMGSMMAP_ExtensionContainer *_extensionContainer;
}

@property(readwrite,strong,atomic) UMGSMMAP_IMEI *imei;
@property(readwrite,strong,atomic) UMGSMMAP_RequestedEquipmentInfo *requestedEquipmentInfo;
@property(readwrite,strong,atomic) UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,strong) NSString *operationName;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end


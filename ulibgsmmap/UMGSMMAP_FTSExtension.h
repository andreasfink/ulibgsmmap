//
//  UMGSMMAP_FTSExtension.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 31.03.20.
//  Copyright © 2020 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

typedef enum UMGSMMAP_FTSExtension_enum
{
    UMGSMMAP_FTSExtension_vas_esme  = 0,
    UMGSMMAP_FTSExtension_vas_ip    = 1,
    UMGSMMAP_FTSExtension_msgid     = 2,
    UMGSMMAP_FTSExtension_ulibtransport_container = 3,
} UMGSMMAP_FTSExtension_enum;

@interface UMGSMMAP_FTSExtension : UMASN1Choice<UMGSMMAP_asn1_protocol>
{
    NSString *_operationName;
    NSString *_vas_esme;
    NSString *_vas_ip;
    NSString *_msgid;
    NSString *_serial;
    NSData *_ulibtransportContainer;
}

@property(readwrite,strong,atomic)  NSString *vas_esme;
@property(readwrite,strong,atomic)  NSString *vas_ip;
@property(readwrite,strong,atomic)  NSString *operationName;
@property(readwrite,strong,atomic)  NSString *msgid;
@property(readwrite,strong,atomic)  NSString *serial;
@property(readwrite,strong,atomic)  NSData *ulibtransportContainer;


- (UMGSMMAP_FTSExtension*)initWithString:(NSString *)s;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;


@end

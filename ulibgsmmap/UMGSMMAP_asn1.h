//
//  UMGSMMAP_asn1.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 20.04.16.
//
//

#import <ulibasn1/ulibasn1.h>
#import <ulibtcap/ulibtcap.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

@interface UMGSMMAP_asn1 : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
    NSString *operationName;
}

@property(readwrite,strong) NSString *operationName;


- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;
@end



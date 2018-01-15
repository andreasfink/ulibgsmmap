//
//  UMGSMMAP_asn1_protocol.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 26.06.16.
//
//

#import <ulib/ulib.h>
#import <ulibasn1/ulibasn1.h>
#import <ulibtcap/ulibtcap.h>

@protocol UMGSMMAP_asn1_protocol 

@property(readwrite,strong) NSString *operationName;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

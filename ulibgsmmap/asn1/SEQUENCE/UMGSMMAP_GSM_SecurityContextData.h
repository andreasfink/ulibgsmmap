//
//  UMGSMMAP_GSM_SecurityContextData.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

#import <ulibgsmmap/UMGSMMAP_Kc.h>
#import <ulibgsmmap/UMGSMMAP_CKSN.h>

@interface UMGSMMAP_GSM_SecurityContextData : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_Kc *kc;
	UMGSMMAP_CKSN *cksn;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_Kc *kc;
@property(readwrite,strong)	UMGSMMAP_CKSN *cksn;


- (void)processBeforeEncode;
- (UMGSMMAP_GSM_SecurityContextData *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

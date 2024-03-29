//
//  UMGSMMAP_AuthenticationTriplet.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

#import <ulibgsmmap/UMGSMMAP_RAND.h>
#import <ulibgsmmap/UMGSMMAP_SRES.h>
#import <ulibgsmmap/UMGSMMAP_Kc.h>

@interface UMGSMMAP_AuthenticationTriplet : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_RAND *rand;
	UMGSMMAP_SRES *sres;
	UMGSMMAP_Kc *kc;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_RAND *rand;
@property(readwrite,strong)	UMGSMMAP_SRES *sres;
@property(readwrite,strong)	UMGSMMAP_Kc *kc;


- (void)processBeforeEncode;
- (UMGSMMAP_AuthenticationTriplet *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

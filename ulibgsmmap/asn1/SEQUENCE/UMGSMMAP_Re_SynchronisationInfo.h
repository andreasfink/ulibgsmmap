//
//  UMGSMMAP_Re_SynchronisationInfo.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>


@interface UMGSMMAP_Re_SynchronisationInfo : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMASN1OctetString *rand;
	UMASN1OctetString *auts;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMASN1OctetString *rand;
@property(readwrite,strong)	UMASN1OctetString *auts;


- (void)processBeforeEncode;
- (UMGSMMAP_Re_SynchronisationInfo *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

//
//  UMGSMMAP_LongTermDenialParam.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>


@interface UMGSMMAP_LongTermDenialParam : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
}
@property(readwrite,strong)    NSString *operationName;



- (void)processBeforeEncode;
- (UMGSMMAP_LongTermDenialParam *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

//
//  UMGSMMAP_CallBarringFeature.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_BasicServiceCode.h"
#import "UMGSMMAP_SS_Status.h"

@interface UMGSMMAP_CallBarringFeature : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_BasicServiceCode *basicService;
	UMGSMMAP_SS_Status *ss_Status;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_BasicServiceCode *basicService;
@property(readwrite,strong)	UMGSMMAP_SS_Status *ss_Status;


- (void)processBeforeEncode;
- (UMGSMMAP_CallBarringFeature *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

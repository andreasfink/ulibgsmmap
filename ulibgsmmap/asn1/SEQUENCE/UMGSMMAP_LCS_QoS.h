//
//  UMGSMMAP_LCS_QoS.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_Horizontal_Accuracy.h"
#import "UMGSMMAP_Vertical_Accuracy.h"
#import "UMGSMMAP_ResponseTime.h"
#import "UMGSMMAP_ExtensionContainer.h"

@interface UMGSMMAP_LCS_QoS : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_Horizontal_Accuracy *horizontal_accuracy;
	BOOL verticalCoordinateRequest;
	UMGSMMAP_Vertical_Accuracy *vertical_accuracy;
	UMGSMMAP_ResponseTime *responseTime;
	UMGSMMAP_ExtensionContainer *extensionContainer;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_Horizontal_Accuracy *horizontal_accuracy;
@property(readwrite,assign)	BOOL verticalCoordinateRequest;
@property(readwrite,strong)	UMGSMMAP_Vertical_Accuracy *vertical_accuracy;
@property(readwrite,strong)	UMGSMMAP_ResponseTime *responseTime;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;


- (void)processBeforeEncode;
- (UMGSMMAP_LCS_QoS *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

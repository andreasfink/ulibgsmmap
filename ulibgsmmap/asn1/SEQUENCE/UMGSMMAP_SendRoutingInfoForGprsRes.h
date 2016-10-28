//
//  UMGSMMAP_SendRoutingInfoForGprsRes.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_GSN_Address.h"
#import "UMGSMMAP_AbsentSubscriberDiagnosticSM.h"
#import "UMGSMMAP_ExtensionContainer.h"

@interface UMGSMMAP_SendRoutingInfoForGprsRes : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_GSN_Address *sgsn_Address;
	UMGSMMAP_GSN_Address *ggsn_Address;
	UMGSMMAP_AbsentSubscriberDiagnosticSM *mobileNotReachableReason;
	UMGSMMAP_ExtensionContainer *extensionContainer;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_GSN_Address *sgsn_Address;
@property(readwrite,strong)	UMGSMMAP_GSN_Address *ggsn_Address;
@property(readwrite,strong)	UMGSMMAP_AbsentSubscriberDiagnosticSM *mobileNotReachableReason;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;


- (void)processBeforeEncode;
- (UMGSMMAP_SendRoutingInfoForGprsRes *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

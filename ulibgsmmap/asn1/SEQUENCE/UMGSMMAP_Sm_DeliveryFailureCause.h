//
//  UMGSMMAP_Sm_DeliveryFailureCause.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

#import <ulibgsmmap/UMGSMMAP_SM_EnumeratedDeliveryFailureCause.h>
#import <ulibgsmmap/UMGSMMAP_SignalInfo.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>

@interface UMGSMMAP_Sm_DeliveryFailureCause : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_SM_EnumeratedDeliveryFailureCause *sm_EnumeratedDeliveryFailureCause;
	UMGSMMAP_SignalInfo *diagnosticInfo;
	UMGSMMAP_ExtensionContainer *extensionContainer;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_SM_EnumeratedDeliveryFailureCause *sm_EnumeratedDeliveryFailureCause;
@property(readwrite,strong)	UMGSMMAP_SignalInfo *diagnosticInfo;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;


- (void)processBeforeEncode;
- (UMGSMMAP_Sm_DeliveryFailureCause *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

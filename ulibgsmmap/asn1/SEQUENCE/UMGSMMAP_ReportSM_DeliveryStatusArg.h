//
//  UMGSMMAP_ReportSM_DeliveryStatusArg.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

#import <ulibgsmmap/UMGSMMAP_ISDN_AddressString.h>
#import <ulibgsmmap/UMGSMMAP_AddressString.h>
#import <ulibgsmmap/UMGSMMAP_SM_DeliveryOutcome.h>
#import <ulibgsmmap/UMGSMMAP_AbsentSubscriberDiagnosticSM.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>

@interface UMGSMMAP_ReportSM_DeliveryStatusArg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_ISDN_AddressString *msisdn;
	UMGSMMAP_AddressString *serviceCentreAddress;
	UMGSMMAP_SM_DeliveryOutcome *sm_DeliveryOutcome;
	UMGSMMAP_AbsentSubscriberDiagnosticSM *absentSubscriberDiagnosticSM;
	UMGSMMAP_ExtensionContainer *extensionContainer;
	BOOL gprsSupportIndicator;
	BOOL deliveryOutcomeIndicator;
	UMGSMMAP_SM_DeliveryOutcome *additionalSM_DeliveryOutcome;
	UMGSMMAP_AbsentSubscriberDiagnosticSM *additionalAbsentSubscriberDiagnosticSM;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *msisdn;
@property(readwrite,strong)	UMGSMMAP_AddressString *serviceCentreAddress;
@property(readwrite,strong)	UMGSMMAP_SM_DeliveryOutcome *sm_DeliveryOutcome;
@property(readwrite,strong)	UMGSMMAP_AbsentSubscriberDiagnosticSM *absentSubscriberDiagnosticSM;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,assign)	BOOL gprsSupportIndicator;
@property(readwrite,assign)	BOOL deliveryOutcomeIndicator;
@property(readwrite,strong)	UMGSMMAP_SM_DeliveryOutcome *additionalSM_DeliveryOutcome;
@property(readwrite,strong)	UMGSMMAP_AbsentSubscriberDiagnosticSM *additionalAbsentSubscriberDiagnosticSM;


- (void)processBeforeEncode;
- (UMGSMMAP_ReportSM_DeliveryStatusArg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

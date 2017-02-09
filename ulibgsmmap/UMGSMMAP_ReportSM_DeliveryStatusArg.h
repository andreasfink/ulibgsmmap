//
//  UMGSMMAP_ReportSM_DeliveryStatusArg.h
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_ISDN_AddressString.h"
#import "UMGSMMAP_AddressString.h"
#import "UMGSMMAP_SM_DeliveryOutcome.h"
#import "UMGSMMAP_AbsentSubscriberDiagnosticSM.h"
#import "UMGSMMAP_ExtensionContainer.h"

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

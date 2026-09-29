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
#import <ulibtcap/ulibtcap.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

#import <ulibgsmmap/UMGSMMAP_ISDN_AddressString.h>
#import <ulibgsmmap/UMGSMMAP_AddressString.h>
#import <ulibgsmmap/UMGSMMAP_SM_DeliveryOutcome.h>
#import <ulibgsmmap/UMGSMMAP_AbsentSubscriberDiagnosticSM.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>

@interface UMGSMMAP_ReportSM_DeliveryStatusArg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
    NSString                                    *operationName;
    UMGSMMAP_ISDN_AddressString                 *_msisdn;  /* mandatory */
    UMGSMMAP_AddressString                      *_serviceCentreAddress;  /* mandatory */
    UMGSMMAP_SM_DeliveryOutcome                 *_sm_DeliveryOutcome;  /* mandatory */
    UMGSMMAP_AbsentSubscriberDiagnosticSM       *_absentSubscriberDiagnosticSM; /* mandatory */
    UMGSMMAP_ExtensionContainer                 *_extensionContainer; /* opional */
    BOOL                                        _gprsSupportIndicator; /* opional */
    BOOL                                        _deliveryOutcomeIndicator; /* opional */
    UMGSMMAP_SM_DeliveryOutcome                 *_additionalSM_DeliveryOutcome; /* opional */
    UMGSMMAP_AbsentSubscriberDiagnosticSM       *_additionalAbsentSubscriberDiagnosticSM; /* opional */
}
@property(readwrite,strong) NSString *operationName;

@property(readwrite,strong)    UMGSMMAP_ISDN_AddressString             *msisdn;
@property(readwrite,strong)    UMGSMMAP_AddressString                  *serviceCentreAddress;
@property(readwrite,strong)    UMGSMMAP_SM_DeliveryOutcome             *sm_DeliveryOutcome;
@property(readwrite,strong)    UMGSMMAP_AbsentSubscriberDiagnosticSM   *absentSubscriberDiagnosticSM;
@property(readwrite,strong)    UMGSMMAP_ExtensionContainer             *extensionContainer;
@property(readwrite,assign)    BOOL                                    gprsSupportIndicator;
@property(readwrite,assign)    BOOL                                    deliveryOutcomeIndicator;
@property(readwrite,strong)    UMGSMMAP_SM_DeliveryOutcome             *additionalSM_DeliveryOutcome;
@property(readwrite,strong)    UMGSMMAP_AbsentSubscriberDiagnosticSM   *additionalAbsentSubscriberDiagnosticSM;


- (void)processBeforeEncode;
- (UMGSMMAP_ReportSM_DeliveryStatusArg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end




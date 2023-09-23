//
//  UMGSMMAP_SendRoutingInfoArg.h
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

#import <ulibgsmmap/UMGSMMAP_ISDN_AddressString.h>
#import <ulibgsmmap/UMGSMMAP_CUG_CheckInfo.h>
#import <ulibgsmmap/UMGSMMAP_NumberOfForwarding.h>
#import <ulibgsmmap/UMGSMMAP_InterrogationType.h>
#import <ulibgsmmap/UMGSMMAP_OR_Phase.h>
#import <ulibgsmmap/UMGSMMAP_CallReferenceNumber.h>
#import <ulibgsmmap/UMGSMMAP_ForwardingReason.h>
#import <ulibgsmmap/UMGSMMAP_Ext_BasicServiceCode.h>
#import <ulibgsmmap/UMGSMMAP_ExternalSignalInfo.h>
#import <ulibgsmmap/UMGSMMAP_CamelInfo.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>
#import <ulibgsmmap/UMGSMMAP_AlertingPattern.h>
#import <ulibgsmmap/UMGSMMAP_SupportedCCBS_Phase.h>
#import <ulibgsmmap/UMGSMMAP_Ext_ExternalSignalInfo.h>
#import <ulibgsmmap/UMGSMMAP_IST_SupportIndicator.h>
#import <ulibgsmmap/UMGSMMAP_CallDiversionTreatmentIndicator.h>
#import <ulibgsmmap/UMGSMMAP_SuppressMTSS.h>
#import <ulibgsmmap/UMGSMMAP_EMLPP_Priority.h>

@interface UMGSMMAP_SendRoutingInfoArg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_ISDN_AddressString *msisdn;
	UMGSMMAP_CUG_CheckInfo *cug_CheckInfo;
	UMGSMMAP_NumberOfForwarding *numberOfForwarding;
	UMGSMMAP_InterrogationType *interrogationType;
	BOOL or_Interrogation;
	UMGSMMAP_OR_Phase *or_Capability;
	UMGSMMAP_ISDN_AddressString *gmsc_Address;
	UMGSMMAP_CallReferenceNumber *callReferenceNumber;
	UMGSMMAP_ForwardingReason *forwardingReason;
	UMGSMMAP_Ext_BasicServiceCode *basicServiceGroup;
	UMGSMMAP_ExternalSignalInfo *networkSignalInfo;
	UMGSMMAP_CamelInfo *camelInfo;
	BOOL suppressionOfAnnouncement;
	UMGSMMAP_ExtensionContainer *extensionContainer;
	UMGSMMAP_AlertingPattern *alertingPattern;
	BOOL ccbs_Call;
	UMGSMMAP_SupportedCCBS_Phase *supportedCCBS_Phase;
	UMGSMMAP_Ext_ExternalSignalInfo *additionalSignalInfo;
	UMGSMMAP_IST_SupportIndicator *istSupportIndicator;
	BOOL pre_pagingSupported;
	UMGSMMAP_CallDiversionTreatmentIndicator *callDiversionTreatmentIndicator;
	BOOL longFTN_Supported;
	BOOL suppress_VT_CSI;
	BOOL suppressIncomingCallBarring;
	BOOL gsmSCF_InitiatedCall;
	UMGSMMAP_Ext_BasicServiceCode *basicServiceGroup2;
	UMGSMMAP_ExternalSignalInfo *networkSignalInfo2;
	UMGSMMAP_SuppressMTSS *suppressMTSS;
	BOOL mtRoamingRetrySupported;
	UMGSMMAP_EMLPP_Priority *callPriority;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *msisdn;
@property(readwrite,strong)	UMGSMMAP_CUG_CheckInfo *cug_CheckInfo;
@property(readwrite,strong)	UMGSMMAP_NumberOfForwarding *numberOfForwarding;
@property(readwrite,strong)	UMGSMMAP_InterrogationType *interrogationType;
@property(readwrite,assign)	BOOL or_Interrogation;
@property(readwrite,strong)	UMGSMMAP_OR_Phase *or_Capability;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *gmsc_Address;
@property(readwrite,strong)	UMGSMMAP_CallReferenceNumber *callReferenceNumber;
@property(readwrite,strong)	UMGSMMAP_ForwardingReason *forwardingReason;
@property(readwrite,strong)	UMGSMMAP_Ext_BasicServiceCode *basicServiceGroup;
@property(readwrite,strong)	UMGSMMAP_ExternalSignalInfo *networkSignalInfo;
@property(readwrite,strong)	UMGSMMAP_CamelInfo *camelInfo;
@property(readwrite,assign)	BOOL suppressionOfAnnouncement;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,strong)	UMGSMMAP_AlertingPattern *alertingPattern;
@property(readwrite,assign)	BOOL ccbs_Call;
@property(readwrite,strong)	UMGSMMAP_SupportedCCBS_Phase *supportedCCBS_Phase;
@property(readwrite,strong)	UMGSMMAP_Ext_ExternalSignalInfo *additionalSignalInfo;
@property(readwrite,strong)	UMGSMMAP_IST_SupportIndicator *istSupportIndicator;
@property(readwrite,assign)	BOOL pre_pagingSupported;
@property(readwrite,strong)	UMGSMMAP_CallDiversionTreatmentIndicator *callDiversionTreatmentIndicator;
@property(readwrite,assign)	BOOL longFTN_Supported;
@property(readwrite,assign)	BOOL suppress_VT_CSI;
@property(readwrite,assign)	BOOL suppressIncomingCallBarring;
@property(readwrite,assign)	BOOL gsmSCF_InitiatedCall;
@property(readwrite,strong)	UMGSMMAP_Ext_BasicServiceCode *basicServiceGroup2;
@property(readwrite,strong)	UMGSMMAP_ExternalSignalInfo *networkSignalInfo2;
@property(readwrite,strong)	UMGSMMAP_SuppressMTSS *suppressMTSS;
@property(readwrite,assign)	BOOL mtRoamingRetrySupported;
@property(readwrite,strong)	UMGSMMAP_EMLPP_Priority *callPriority;


- (void)processBeforeEncode;
- (UMGSMMAP_SendRoutingInfoArg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

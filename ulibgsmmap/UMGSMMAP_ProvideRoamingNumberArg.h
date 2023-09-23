//
//  UMGSMMAP_ProvideRoamingNumberArg.h
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

#import <ulibgsmmap/UMGSMMAP_ExternalSignalInfo.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>
#import <ulibgsmmap/UMGSMMAP_SupportedCamelPhases.h>
#import <ulibgsmmap/UMGSMMAP_Ext_ExternalSignalInfo.h>
#import <ulibgsmmap/UMGSMMAP_IMSI.h>
#import <ulibgsmmap/UMGSMMAP_ISDN_AddressString.h>
#import <ulibgsmmap/UMGSMMAP_LMSI.h>
#import <ulibgsmmap/UMGSMMAP_CallReferenceNumber.h>
#import <ulibgsmmap/UMGSMMAP_AlertingPattern.h>
#import <ulibgsmmap/UMGSMMAP_OfferedCamel4CSIs.h>
#import <ulibgsmmap/UMGSMMAP_PagingArea.h>
#import <ulibgsmmap/UMGSMMAP_EMLPP_Priority.h>

@interface UMGSMMAP_ProvideRoamingNumberArg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_IMSI *imsi;
	UMGSMMAP_ISDN_AddressString *msc_Number;
	UMGSMMAP_ISDN_AddressString *msisdn;
	UMGSMMAP_LMSI *lmsi;
	UMGSMMAP_ExternalSignalInfo *gsm_BearerCapability;
	UMGSMMAP_ExternalSignalInfo *networkSignalInfo;
	BOOL suppressionOfAnnouncement;
	UMGSMMAP_ISDN_AddressString *gmsc_Address;
	UMGSMMAP_CallReferenceNumber *callReferenceNumber;
	BOOL or_Interrogation;
	UMGSMMAP_ExtensionContainer *extensionContainer;
	UMGSMMAP_AlertingPattern *alertingPattern;
	BOOL ccbs_Call;
	UMGSMMAP_SupportedCamelPhases *supportedCamelPhasesInGMSC;
	UMGSMMAP_Ext_ExternalSignalInfo *additionalSignalInfo;
	BOOL orNotSupportedInGMSC;
    BOOL pre_pagingSupported;
    BOOL longFTN_Supported;
    BOOL suppress_VT_CSI;
    UMGSMMAP_OfferedCamel4CSIs *offeredCamel4CSIsInInterrogatingNode;
    BOOL mtRoamingRetrySupported;
    UMGSMMAP_PagingArea *pagingArea;
    UMGSMMAP_EMLPP_Priority *callPriority;

}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_IMSI *imsi;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *msc_Number;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *msisdn;
@property(readwrite,strong)	UMGSMMAP_LMSI *lmsi;
@property(readwrite,strong)	UMGSMMAP_ExternalSignalInfo *gsm_BearerCapability;
@property(readwrite,strong)	UMGSMMAP_ExternalSignalInfo *networkSignalInfo;
@property(readwrite,assign)	BOOL suppressionOfAnnouncement;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *gmsc_Address;
@property(readwrite,strong)	UMGSMMAP_CallReferenceNumber *callReferenceNumber;
@property(readwrite,assign)	BOOL or_Interrogation;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,strong)	UMASN1OctetString *alertingPattern;
@property(readwrite,assign)	BOOL ccbs_Call;
@property(readwrite,strong)	UMGSMMAP_SupportedCamelPhases *supportedCamelPhasesInGMSC;
@property(readwrite,strong)	UMGSMMAP_Ext_ExternalSignalInfo *additionalSignalInfo;
@property(readwrite,assign)	BOOL orNotSupportedInGMSC;
@property(readwrite,assign)	BOOL pre_pagingSupported;
@property(readwrite,assign)	BOOL longFTN_Supported;
@property(readwrite,assign)	BOOL suppress_VT_CSI;
@property(readwrite,strong) UMGSMMAP_OfferedCamel4CSIs *offeredCamel4CSIsInInterrogatingNode;
@property(readwrite,assign)	BOOL mtRoamingRetrySupported;
@property(readwrite,strong) UMGSMMAP_PagingArea *pagingArea;
@property(readwrite,strong) UMGSMMAP_EMLPP_Priority *callPriority;



- (void)processBeforeEncode;
- (UMGSMMAP_ProvideRoamingNumberArg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

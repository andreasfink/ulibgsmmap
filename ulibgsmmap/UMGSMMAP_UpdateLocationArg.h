//
//  UMGSMMAP_UpdateLocationArg.h
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

#import <ulibgsmmap/UMGSMMAP_IMSI.h>
#import <ulibgsmmap/UMGSMMAP_ISDN_AddressString.h>
#import <ulibgsmmap/UMGSMMAP_LMSI.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>
#import <ulibgsmmap/UMGSMMAP_VLR_Capability.h>
#import <ulibgsmmap/UMGSMMAP_GSN_Address.h>
#import <ulibgsmmap/UMGSMMAP_ADD_Info.h>
#import <ulibgsmmap/UMGSMMAP_EPLMN_List.h>
#import <ulibgsmmap/UMGSMMAP_NetworkNodeDiameterAddress.h>
#import <ulibgsmmap/UMGSMMAP_PagingArea.h>

@interface UMGSMMAP_UpdateLocationArg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_IMSI *imsi;
	UMGSMMAP_ISDN_AddressString *msc_Number;
	UMGSMMAP_ISDN_AddressString *vlr_Number;
	UMGSMMAP_LMSI *lmsi;
	UMGSMMAP_ExtensionContainer *extensionContainer;
	UMGSMMAP_VLR_Capability *vlr_Capability;


    BOOL _informPreviousNetworkEntity;
    BOOL _cs_LCS_NotSupportedByUE;
    UMGSMMAP_GSN_Address *_v_gmlc_address;
    UMGSMMAP_ADD_Info *_add_info;
    UMGSMMAP_PagingArea *_pagingArea;
    BOOL _skipSubscriberDataUpdate;
    BOOL _restorationIndicator;
    UMGSMMAP_EPLMN_List *_eplmn_List;
    UMGSMMAP_NetworkNodeDiameterAddress *_mme_DiameterAddress;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_IMSI *imsi;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *msc_Number;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *vlr_Number;
@property(readwrite,strong)	UMGSMMAP_LMSI *lmsi;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,strong)	UMGSMMAP_VLR_Capability *vlr_Capability;


@property(readwrite,assign)    BOOL informPreviousNetworkEntity;
@property(readwrite,assign)    BOOL cs_LCS_NotSupportedByUE;
@property(readwrite,strong)    UMGSMMAP_GSN_Address *v_gmlc_address;
@property(readwrite,strong)    UMGSMMAP_ADD_Info *add_info;
@property(readwrite,strong)    UMGSMMAP_PagingArea *pagingArea;
@property(readwrite,assign)    BOOL skipSubscriberDataUpdate;
@property(readwrite,assign)    BOOL restorationIndicator;
@property(readwrite,strong)    UMGSMMAP_EPLMN_List *eplmn_List;
@property(readwrite,strong)    UMGSMMAP_NetworkNodeDiameterAddress *mme_DiameterAddress;

- (void)processBeforeEncode;
- (UMGSMMAP_UpdateLocationArg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

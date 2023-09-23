//
//  UMGSMMAP_UpdateGprsLocationArg.h
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
#import <ulibgsmmap/UMGSMMAP_GSN_Address.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>
#import <ulibgsmmap/UMGSMMAP_SGSN_Capability.h>
#import <ulibgsmmap/UMGSMMAP_ADD_Info.h>
#import <ulibgsmmap/UMGSMMAP_EPS_Info.h>
#import <ulibgsmmap/UMGSMMAP_AdjacentPLMN_List.h>
#import <ulibgsmmap/UMGSMMAP_UE_SRVCC_Capability.h>
#import <ulibgsmmap/UMGSMMAP_SMSRegisterRequest.h>
#import <ulibgsmmap/UMGSMMAP_EPLMN_List.h>
#import <ulibgsmmap/UMGSMMAP_DiameterIdentity.h>
#import <ulibgsmmap/UMGSMMAP_Used_RAT_Type.h>

@interface UMGSMMAP_UpdateGprsLocationArg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *_operationName;
    
	UMGSMMAP_IMSI                   *_imsi;
	UMGSMMAP_ISDN_AddressString     *_sgsn_Number;
	UMGSMMAP_GSN_Address            *_sgsn_Address;
	UMGSMMAP_ExtensionContainer     *_extensionContainer;
	UMGSMMAP_SGSN_Capability        *_sgsn_Capability;
    BOOL                            _informPreviousNetworkEntity;
    BOOL                            _ps_LCS_NotSupportedByUE;
    UMGSMMAP_GSN_Address            *_v_gmlc_Address;
    UMGSMMAP_ADD_Info               *_add_info;
    UMGSMMAP_EPS_Info               *_eps_info;
    BOOL                            _servingNodeTypeIndicator;
    BOOL                            _skipSubscriberDataUpdate;
    UMGSMMAP_Used_RAT_Type          *_usedRAT_Type;
    BOOL                            _gprsSubscriptionDataNotNeeded;
    BOOL                            _nodeTypeIndicator;
    BOOL                            _areaRestricted;
    BOOL                            _ue_reachableIndicator;
    BOOL                            _epsSubscriptionDataNotNeeded;
    UMGSMMAP_UE_SRVCC_Capability    *_ue_srvcc_Capability;
    UMGSMMAP_EPLMN_List             *_eplmn_List;
    UMGSMMAP_ISDN_AddressString     *_mmeNumberforMTSMS;
    UMGSMMAP_SMSRegisterRequest     *_smsRegisterRequest;
    BOOL                            _sms_Only;
    BOOL                            _removalofMMERegistrationforSMS;
    UMGSMMAP_DiameterIdentity       *_sgsn_Name;
    UMGSMMAP_DiameterIdentity       *_sgsn_Realm;
    BOOL                            _lgd_supportIndicator;
    UMGSMMAP_AdjacentPLMN_List      *_adjacentPLMN_List;
}

@property(readwrite,strong) NSString                        *operationName;

@property(readwrite,strong)	UMGSMMAP_IMSI                   *imsi;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString     *sgsn_Number;
@property(readwrite,strong)	UMGSMMAP_GSN_Address            *sgsn_Address;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer     *extensionContainer;
@property(readwrite,strong)	UMGSMMAP_SGSN_Capability        *sgsn_Capability;
@property(readwrite,assign) BOOL                            informPreviousNetworkEntity;
@property(readwrite,assign) BOOL                            ps_LCS_NotSupportedByUE;
@property(readwrite,strong) UMGSMMAP_GSN_Address            *v_gmlc_Address;
@property(readwrite,strong) UMGSMMAP_ADD_Info               *add_info;
@property(readwrite,strong) UMGSMMAP_EPS_Info               *eps_info;
@property(readwrite,assign) BOOL                            servingNodeTypeIndicator;
@property(readwrite,assign) BOOL                            skipSubscriberDataUpdate;
@property(readwrite,strong) UMGSMMAP_Used_RAT_Type          *usedRAT_Type;
@property(readwrite,assign) BOOL                            gprsSubscriptionDataNotNeeded;
@property(readwrite,assign) BOOL                            nodeTypeIndicator;
@property(readwrite,assign) BOOL                            areaRestricted;
@property(readwrite,assign) BOOL                            ue_reachableIndicator;
@property(readwrite,assign) BOOL                            epsSubscriptionDataNotNeeded;
@property(readwrite,strong) UMGSMMAP_UE_SRVCC_Capability    *ue_srvcc_Capability;
@property(readwrite,strong) UMGSMMAP_EPLMN_List             *eplmn_List;
@property(readwrite,strong) UMGSMMAP_ISDN_AddressString     *mmeNumberforMTSMS;
@property(readwrite,strong) UMGSMMAP_SMSRegisterRequest     *smsRegisterRequest;
@property(readwrite,assign) BOOL                            sms_Only;
@property(readwrite,assign) BOOL                            removalofMMERegistrationforSMS;
@property(readwrite,strong) UMGSMMAP_DiameterIdentity       *sgsn_Name;
@property(readwrite,strong) UMGSMMAP_DiameterIdentity       *sgsn_Realm;
@property(readwrite,assign) BOOL                            lgd_supportIndicator;
@property(readwrite,strong) UMGSMMAP_AdjacentPLMN_List      *adjacentPLMN_List;

- (void)processBeforeEncode;
- (UMGSMMAP_UpdateGprsLocationArg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

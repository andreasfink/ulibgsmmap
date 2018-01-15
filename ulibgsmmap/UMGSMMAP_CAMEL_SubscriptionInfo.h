//
//  UMGSMMAP_CAMEL_SubscriptionInfo.h
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

#import "UMGSMMAP_O_CSI.h"
#import "UMGSMMAP_O_BcsmCamelTDPCriteriaList.h"
#import "UMGSMMAP_D_CSI.h"
#import "UMGSMMAP_T_CSI.h"
#import "UMGSMMAP_T_BCSM_CAMEL_TDP_CriteriaList.h"
#import "UMGSMMAP_GPRS_CSI.h"
#import "UMGSMMAP_SMS_CSI.h"
#import "UMGSMMAP_SS_CSI.h"
#import "UMGSMMAP_M_CSI.h"
#import "UMGSMMAP_ExtensionContainer.h"
#import "UMGSMMAP_SpecificCSI_Withdraw.h"
#import "UMGSMMAP_MT_smsCAMELTDP_CriteriaList.h"
#import "UMGSMMAP_MG_CSI.h"

@interface UMGSMMAP_CAMEL_SubscriptionInfo : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_O_CSI *o_CSI;
	UMGSMMAP_O_BcsmCamelTDPCriteriaList *o_BcsmCamelTDP_CriteriaList;
	UMGSMMAP_D_CSI *d_CSI;
	UMGSMMAP_T_CSI *t_CSI;
	UMGSMMAP_T_BCSM_CAMEL_TDP_CriteriaList *t_BCSM_CAMEL_TDP_CriteriaList;
	UMGSMMAP_T_CSI *vt_CSI;
	UMGSMMAP_T_BCSM_CAMEL_TDP_CriteriaList *vt_BCSM_CAMEL_TDP_CriteriaList;
	BOOL tif_CSI;
	BOOL tif_CSI_NotificationToCSE;
	UMGSMMAP_GPRS_CSI *gprs_CSI;
	UMGSMMAP_SMS_CSI *mo_sms_CSI;
	UMGSMMAP_SS_CSI *ss_CSI;
	UMGSMMAP_M_CSI *m_CSI;
	UMGSMMAP_ExtensionContainer *extensionContainer;
	UMGSMMAP_SpecificCSI_Withdraw *specificCSIDeletedList;
	UMGSMMAP_SMS_CSI *mt_sms_CSI;
	UMGSMMAP_MT_smsCAMELTDP_CriteriaList *mt_smsCAMELTDP_CriteriaList;
	UMGSMMAP_MG_CSI *mg_csi;
	UMGSMMAP_O_CSI *o_IM_CSI;
	UMGSMMAP_O_BcsmCamelTDPCriteriaList *o_IM_BcsmCamelTDP_CriteriaList;
	UMGSMMAP_D_CSI *d_IM_CSI;
	UMGSMMAP_T_CSI *vt_IM_CSI;
	UMGSMMAP_T_BCSM_CAMEL_TDP_CriteriaList *vt_IM_BCSM_CAMEL_TDP_CriteriaList;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_O_CSI *o_CSI;
@property(readwrite,strong)	UMGSMMAP_O_BcsmCamelTDPCriteriaList *o_BcsmCamelTDP_CriteriaList;
@property(readwrite,strong)	UMGSMMAP_D_CSI *d_CSI;
@property(readwrite,strong)	UMGSMMAP_T_CSI *t_CSI;
@property(readwrite,strong)	UMGSMMAP_T_BCSM_CAMEL_TDP_CriteriaList *t_BCSM_CAMEL_TDP_CriteriaList;
@property(readwrite,strong)	UMGSMMAP_T_CSI *vt_CSI;
@property(readwrite,strong)	UMGSMMAP_T_BCSM_CAMEL_TDP_CriteriaList *vt_BCSM_CAMEL_TDP_CriteriaList;
@property(readwrite,assign)	BOOL tif_CSI;
@property(readwrite,assign)	BOOL tif_CSI_NotificationToCSE;
@property(readwrite,strong)	UMGSMMAP_GPRS_CSI *gprs_CSI;
@property(readwrite,strong)	UMGSMMAP_SMS_CSI *mo_sms_CSI;
@property(readwrite,strong)	UMGSMMAP_SS_CSI *ss_CSI;
@property(readwrite,strong)	UMGSMMAP_M_CSI *m_CSI;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,strong)	UMGSMMAP_SpecificCSI_Withdraw *specificCSIDeletedList;
@property(readwrite,strong)	UMGSMMAP_SMS_CSI *mt_sms_CSI;
@property(readwrite,strong)	UMGSMMAP_MT_smsCAMELTDP_CriteriaList *mt_smsCAMELTDP_CriteriaList;
@property(readwrite,strong)	UMGSMMAP_MG_CSI *mg_csi;
@property(readwrite,strong)	UMGSMMAP_O_CSI *o_IM_CSI;
@property(readwrite,strong)	UMGSMMAP_O_BcsmCamelTDPCriteriaList *o_IM_BcsmCamelTDP_CriteriaList;
@property(readwrite,strong)	UMGSMMAP_D_CSI *d_IM_CSI;
@property(readwrite,strong)	UMGSMMAP_T_CSI *vt_IM_CSI;
@property(readwrite,strong)	UMGSMMAP_T_BCSM_CAMEL_TDP_CriteriaList *vt_IM_BCSM_CAMEL_TDP_CriteriaList;


- (void)processBeforeEncode;
- (UMGSMMAP_CAMEL_SubscriptionInfo *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

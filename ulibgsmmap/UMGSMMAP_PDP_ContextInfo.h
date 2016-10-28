//
//  UMGSMMAP_PDP_ContextInfo.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_ContextId.h"
#import "UMGSMMAP_PDP_Type.h"
#import "UMGSMMAP_PDP_Address.h"
#import "UMGSMMAP_APN.h"
#import "UMGSMMAP_NSAPI.h"
#import "UMGSMMAP_TransactionId.h"
#import "UMGSMMAP_TEID.h"
#import "UMGSMMAP_GSN_Address.h"
#import "UMGSMMAP_Ext_QoS_Subscribed.h"
#import "UMGSMMAP_GPRSChargingID.h"
#import "UMGSMMAP_ChargingCharacteristics.h"
#import "UMGSMMAP_ExtensionContainer.h"
#import "UMGSMMAP_Ext2_QoS_Subscribed.h"
#import "UMGSMMAP_Ext3_QoS_Subscribed.h"
#import "UMGSMMAP_Ext4_QoS_Subscribed.h"
#import "UMGSMMAP_Ext_PDP_Type.h"

@interface UMGSMMAP_PDP_ContextInfo : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_ContextId *pdp_ContextIdentifier;
	BOOL pdp_ContextActive;
	UMGSMMAP_PDP_Type *pdp_Type;
	UMGSMMAP_PDP_Address *pdp_Address;
	UMGSMMAP_APN *apn_Subscribed;
	UMGSMMAP_APN *apn_InUse;
	UMGSMMAP_NSAPI *nsapi;
	UMGSMMAP_TransactionId *transactionId;
	UMGSMMAP_TEID *teid_ForGnAndGp;
	UMGSMMAP_TEID *teid_ForIu;
	UMGSMMAP_GSN_Address *ggsn_Address;
	UMGSMMAP_Ext_QoS_Subscribed *qos_Subscribed;
	UMGSMMAP_Ext_QoS_Subscribed *qos_Requested;
	UMGSMMAP_Ext_QoS_Subscribed *qos_Negotiated;
	UMGSMMAP_GPRSChargingID *chargingId;
	UMGSMMAP_ChargingCharacteristics *chargingCharacteristics;
	UMGSMMAP_GSN_Address *rnc_Address;
	UMGSMMAP_ExtensionContainer *extensionContainer;
	UMGSMMAP_Ext2_QoS_Subscribed *qos2_Subscribed;
	UMGSMMAP_Ext2_QoS_Subscribed *qos2_Requested;
	UMGSMMAP_Ext2_QoS_Subscribed *qos2_Negotiated;
	UMGSMMAP_Ext3_QoS_Subscribed *qos3_Subscribed;
	UMGSMMAP_Ext3_QoS_Subscribed *qos3_Requested;
	UMGSMMAP_Ext3_QoS_Subscribed *qos3_Negotiated;
	UMGSMMAP_Ext4_QoS_Subscribed *qos4_Subscribed;
	UMGSMMAP_Ext4_QoS_Subscribed *qos4_Requested;
	UMGSMMAP_Ext4_QoS_Subscribed *qos4_Negotiated;
	UMGSMMAP_Ext_PDP_Type *ext_pdp_Type;
	UMGSMMAP_PDP_Address *ext_pdp_Address;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_ContextId *pdp_ContextIdentifier;
@property(readwrite,assign)	BOOL pdp_ContextActive;
@property(readwrite,strong)	UMGSMMAP_PDP_Type *pdp_Type;
@property(readwrite,strong)	UMGSMMAP_PDP_Address *pdp_Address;
@property(readwrite,strong)	UMGSMMAP_APN *apn_Subscribed;
@property(readwrite,strong)	UMGSMMAP_APN *apn_InUse;
@property(readwrite,strong)	UMGSMMAP_NSAPI *nsapi;
@property(readwrite,strong)	UMGSMMAP_TransactionId *transactionId;
@property(readwrite,strong)	UMGSMMAP_TEID *teid_ForGnAndGp;
@property(readwrite,strong)	UMGSMMAP_TEID *teid_ForIu;
@property(readwrite,strong)	UMGSMMAP_GSN_Address *ggsn_Address;
@property(readwrite,strong)	UMGSMMAP_Ext_QoS_Subscribed *qos_Subscribed;
@property(readwrite,strong)	UMGSMMAP_Ext_QoS_Subscribed *qos_Requested;
@property(readwrite,strong)	UMGSMMAP_Ext_QoS_Subscribed *qos_Negotiated;
@property(readwrite,strong)	UMGSMMAP_GPRSChargingID *chargingId;
@property(readwrite,strong)	UMGSMMAP_ChargingCharacteristics *chargingCharacteristics;
@property(readwrite,strong)	UMGSMMAP_GSN_Address *rnc_Address;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,strong)	UMGSMMAP_Ext2_QoS_Subscribed *qos2_Subscribed;
@property(readwrite,strong)	UMGSMMAP_Ext2_QoS_Subscribed *qos2_Requested;
@property(readwrite,strong)	UMGSMMAP_Ext2_QoS_Subscribed *qos2_Negotiated;
@property(readwrite,strong)	UMGSMMAP_Ext3_QoS_Subscribed *qos3_Subscribed;
@property(readwrite,strong)	UMGSMMAP_Ext3_QoS_Subscribed *qos3_Requested;
@property(readwrite,strong)	UMGSMMAP_Ext3_QoS_Subscribed *qos3_Negotiated;
@property(readwrite,strong)	UMGSMMAP_Ext4_QoS_Subscribed *qos4_Subscribed;
@property(readwrite,strong)	UMGSMMAP_Ext4_QoS_Subscribed *qos4_Requested;
@property(readwrite,strong)	UMGSMMAP_Ext4_QoS_Subscribed *qos4_Negotiated;
@property(readwrite,strong)	UMGSMMAP_Ext_PDP_Type *ext_pdp_Type;
@property(readwrite,strong)	UMGSMMAP_PDP_Address *ext_pdp_Address;


- (void)processBeforeEncode;
- (UMGSMMAP_PDP_ContextInfo *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

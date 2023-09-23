//
//  UMGSMMAP_SendRoutingInfoRes.h
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
#import <ulibgsmmap/UMGSMMAP_ExtendedRoutingInfo.h>
#import <ulibgsmmap/UMGSMMAP_CUG_CheckInfo.h>
#import <ulibgsmmap/UMGSMMAP_SubscriberInfo.h>
#import <ulibgsmmap/UMGSMMAP_SS_List.h>
#import <ulibgsmmap/UMGSMMAP_Ext_BasicServiceCode.h>
#import <ulibgsmmap/UMGSMMAP_ISDN_AddressString.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>
#import <ulibgsmmap/UMGSMMAP_NAEA_PreferredCI.h>
#import <ulibgsmmap/UMGSMMAP_CCBS_Indicators.h>
#import <ulibgsmmap/UMGSMMAP_NumberPortabilityStatus.h>

@interface UMGSMMAP_SendRoutingInfoRes : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_IMSI *imsi;
	UMGSMMAP_ExtendedRoutingInfo *extendedRoutingInfo;
	UMGSMMAP_CUG_CheckInfo *cug_CheckInfo;
	BOOL cugSubscriptionFlag;
	UMGSMMAP_SubscriberInfo *subscriberInfo;
	UMGSMMAP_SS_List *ss_List;
	UMGSMMAP_Ext_BasicServiceCode *basicService;
	BOOL forwardingInterrogationRequired;
	UMGSMMAP_ISDN_AddressString *vmsc_Address;
	UMGSMMAP_ExtensionContainer *extensionContainer;
	UMGSMMAP_NAEA_PreferredCI *naea_PreferredCI;
	UMGSMMAP_CCBS_Indicators *ccbs_Indicators;
	UMGSMMAP_ISDN_AddressString *msisdn;
	UMGSMMAP_NumberPortabilityStatus *numberPortabilityStatus;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_IMSI *imsi;
@property(readwrite,strong)	UMGSMMAP_ExtendedRoutingInfo *extendedRoutingInfo;
@property(readwrite,strong)	UMGSMMAP_CUG_CheckInfo *cug_CheckInfo;
@property(readwrite,assign)	BOOL cugSubscriptionFlag;
@property(readwrite,strong)	UMGSMMAP_SubscriberInfo *subscriberInfo;
@property(readwrite,strong)	UMGSMMAP_SS_List *ss_List;
@property(readwrite,strong)	UMGSMMAP_Ext_BasicServiceCode *basicService;
@property(readwrite,assign)	BOOL forwardingInterrogationRequired;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *vmsc_Address;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,strong)	UMGSMMAP_NAEA_PreferredCI *naea_PreferredCI;
@property(readwrite,strong)	UMGSMMAP_CCBS_Indicators *ccbs_Indicators;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *msisdn;
@property(readwrite,strong)	UMGSMMAP_NumberPortabilityStatus *numberPortabilityStatus;


- (void)processBeforeEncode;
- (UMGSMMAP_SendRoutingInfoRes *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

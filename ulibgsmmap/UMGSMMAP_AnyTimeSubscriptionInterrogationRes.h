//
//  UMGSMMAP_AnyTimeSubscriptionInterrogationRes.h
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

#import <ulibgsmmap/UMGSMMAP_CallForwardingData.h>
#import <ulibgsmmap/UMGSMMAP_CallBarringData.h>
#import <ulibgsmmap/UMGSMMAP_ODB_Info.h>
#import <ulibgsmmap/UMGSMMAP_CAMEL_SubscriptionInfo.h>
#import <ulibgsmmap/UMGSMMAP_SupportedCamelPhases.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>
#import <ulibgsmmap/UMGSMMAP_OfferedCamel4CSIs.h>
#import <ulibgsmmap/UMGSMMAP_MSISDN_BS_List.h>

@interface UMGSMMAP_AnyTimeSubscriptionInterrogationRes : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_CallForwardingData *callForwardingData;
	UMGSMMAP_CallBarringData *callBarringData;
	UMGSMMAP_ODB_Info *odb_Info;
	UMGSMMAP_CAMEL_SubscriptionInfo *camel_SubscriptionInfo;
	UMGSMMAP_SupportedCamelPhases *supportedVLR_CAMEL_Phases;
	UMGSMMAP_SupportedCamelPhases *supportedSGSN_CAMEL_Phases;
	UMGSMMAP_ExtensionContainer *extensionContainer;
	UMGSMMAP_OfferedCamel4CSIs *offeredCamel4CSIsInVLR;
	UMGSMMAP_OfferedCamel4CSIs *offeredCamel4CSIsInSGSN;
	UMGSMMAP_MSISDN_BS_List *msisdn_BS_List;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_CallForwardingData *callForwardingData;
@property(readwrite,strong)	UMGSMMAP_CallBarringData *callBarringData;
@property(readwrite,strong)	UMGSMMAP_ODB_Info *odb_Info;
@property(readwrite,strong)	UMGSMMAP_CAMEL_SubscriptionInfo *camel_SubscriptionInfo;
@property(readwrite,strong)	UMGSMMAP_SupportedCamelPhases *supportedVLR_CAMEL_Phases;
@property(readwrite,strong)	UMGSMMAP_SupportedCamelPhases *supportedSGSN_CAMEL_Phases;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,strong)	UMGSMMAP_OfferedCamel4CSIs *offeredCamel4CSIsInVLR;
@property(readwrite,strong)	UMGSMMAP_OfferedCamel4CSIs *offeredCamel4CSIsInSGSN;
@property(readwrite,strong)	UMGSMMAP_MSISDN_BS_List *msisdn_BS_List;


- (void)processBeforeEncode;
- (UMGSMMAP_AnyTimeSubscriptionInterrogationRes *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

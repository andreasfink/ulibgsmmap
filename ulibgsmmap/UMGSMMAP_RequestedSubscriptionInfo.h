//
//  UMGSMMAP_RequestedSubscriptionInfo.h
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

#import "UMGSMMAP_SS_ForBS_Code.h"
#import "UMGSMMAP_RequestedCAMEL_SubscriptionInfo.h"
#import "UMGSMMAP_ExtensionContainer.h"
#import "UMGSMMAP_AdditionalRequestedCAMEL_SubscriptionInfo.h"

@interface UMGSMMAP_RequestedSubscriptionInfo : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_SS_ForBS_Code *requestedSS_Info;
	BOOL odb;
	UMGSMMAP_RequestedCAMEL_SubscriptionInfo *requestedCAMEL_SubscriptionInfo;
	BOOL supportedVLR_CAMEL_Phases;
	BOOL supportedSGSN_CAMEL_Phases;
	UMGSMMAP_ExtensionContainer *extensionContainer;
	UMGSMMAP_AdditionalRequestedCAMEL_SubscriptionInfo *additionalRequestedCAMEL_SubscriptionInfo;
	BOOL msisdn_BS_List;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_SS_ForBS_Code *requestedSS_Info;
@property(readwrite,assign)	BOOL odb;
@property(readwrite,strong)	UMGSMMAP_RequestedCAMEL_SubscriptionInfo *requestedCAMEL_SubscriptionInfo;
@property(readwrite,assign)	BOOL supportedVLR_CAMEL_Phases;
@property(readwrite,assign)	BOOL supportedSGSN_CAMEL_Phases;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,strong)	UMGSMMAP_AdditionalRequestedCAMEL_SubscriptionInfo *additionalRequestedCAMEL_SubscriptionInfo;
@property(readwrite,assign)	BOOL msisdn_BS_List;


- (void)processBeforeEncode;
- (UMGSMMAP_RequestedSubscriptionInfo *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

//
//  UMGSMMAP_SendRoutingInfoArg.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_ISDN_AddressString.h"
#import "UMGSMMAP_CUG_CheckInfo.h"
#import "UMGSMMAP_NumberOfForwarding.h"
#import "UMGSMMAP_InterrogationType.h"
#import "UMGSMMAP_OR_Phase.h"
#import "UMGSMMAP_CallReferenceNumber.h"
#import "UMGSMMAP_ForwardingReason.h"
#import "UMGSMMAP_Ext_BasicServiceCode.h"
#import "UMGSMMAP_ExternalSignalInfo.h"
#import "UMGSMMAP_CamelInfo.h"
#import "UMGSMMAP_ExtensionContainer.h"
#import "UMGSMMAP_AlertingPattern.h"
#import "UMGSMMAP_SupportedCCBS_Phase.h"
#import "UMGSMMAP_Ext_ExternalSignalInfo.h"

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


- (void)processBeforeEncode;
- (UMGSMMAP_SendRoutingInfoArg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

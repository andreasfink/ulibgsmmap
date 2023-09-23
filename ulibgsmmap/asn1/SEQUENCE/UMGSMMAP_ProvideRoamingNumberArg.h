//
//  UMGSMMAP_ProvideRoamingNumberArg.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

#import <ulibgsmmap/UMGSMMAP_ExternalSignalInfo.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>
#import <ulibgsmmap/UMGSMMAP_SupportedCamelPhases.h>
#import <ulibgsmmap/UMGSMMAP_Ext_ExternalSignalInfo.h>

@interface UMGSMMAP_ProvideRoamingNumberArg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMASN1OctetString *imsi;
	UMASN1OctetString *msc_Number;
	UMASN1OctetString *msisdn;
	UMASN1OctetString *lmsi;
	UMGSMMAP_ExternalSignalInfo *gsm_BearerCapability;
	UMGSMMAP_ExternalSignalInfo *networkSignalInfo;
	BOOL suppressionOfAnnouncement;
	UMASN1OctetString *gmsc_Address;
	UMASN1OctetString *callReferenceNumber;
	BOOL or_Interrogation;
	UMGSMMAP_ExtensionContainer *extensionContainer;
	UMASN1OctetString *alertingPattern;
	BOOL ccbs_Call;
	UMGSMMAP_SupportedCamelPhases *supportedCamelPhasesInGMSC;
	UMGSMMAP_Ext_ExternalSignalInfo *additionalSignalInfo;
	BOOL orNotSupportedInGMSC;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMASN1OctetString *imsi;
@property(readwrite,strong)	UMASN1OctetString *msc_Number;
@property(readwrite,strong)	UMASN1OctetString *msisdn;
@property(readwrite,strong)	UMASN1OctetString *lmsi;
@property(readwrite,strong)	UMGSMMAP_ExternalSignalInfo *gsm_BearerCapability;
@property(readwrite,strong)	UMGSMMAP_ExternalSignalInfo *networkSignalInfo;
@property(readwrite,assign)	BOOL suppressionOfAnnouncement;
@property(readwrite,strong)	UMASN1OctetString *gmsc_Address;
@property(readwrite,strong)	UMASN1OctetString *callReferenceNumber;
@property(readwrite,assign)	BOOL or_Interrogation;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,strong)	UMASN1OctetString *alertingPattern;
@property(readwrite,assign)	BOOL ccbs_Call;
@property(readwrite,strong)	UMGSMMAP_SupportedCamelPhases *supportedCamelPhasesInGMSC;
@property(readwrite,strong)	UMGSMMAP_Ext_ExternalSignalInfo *additionalSignalInfo;
@property(readwrite,assign)	BOOL orNotSupportedInGMSC;


- (void)processBeforeEncode;
- (UMGSMMAP_ProvideRoamingNumberArg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

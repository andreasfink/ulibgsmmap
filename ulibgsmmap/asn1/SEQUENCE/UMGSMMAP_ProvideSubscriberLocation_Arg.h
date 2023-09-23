//
//  UMGSMMAP_ProvideSubscriberLocation_Arg.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

#import <ulibgsmmap/UMGSMMAP_LocationType.h>
#import <ulibgsmmap/UMGSMMAP_ISDN_AddressString.h>
#import <ulibgsmmap/UMGSMMAP_LCS_ClientID.h>
#import <ulibgsmmap/UMGSMMAP_IMSI.h>
#import <ulibgsmmap/UMGSMMAP_LMSI.h>
#import <ulibgsmmap/UMGSMMAP_IMEI.h>
#import <ulibgsmmap/UMGSMMAP_LCS_Priority.h>
#import <ulibgsmmap/UMGSMMAP_LCS_QoS.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>

@interface UMGSMMAP_ProvideSubscriberLocation_Arg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_LocationType *locationType;
	UMGSMMAP_ISDN_AddressString *mlc_Number;
	UMGSMMAP_LCS_ClientID *lcs_ClientID;
	BOOL privacyOverride;
	UMGSMMAP_IMSI *imsi;
	UMGSMMAP_ISDN_AddressString *msisdn;
	UMGSMMAP_LMSI *lmsi;
	UMGSMMAP_IMEI *imei;
	UMGSMMAP_LCS_Priority *lcs_Priority;
	UMGSMMAP_LCS_QoS *lcs_QoS;
	UMGSMMAP_ExtensionContainer *extensionContainer;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_LocationType *locationType;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *mlc_Number;
@property(readwrite,strong)	UMGSMMAP_LCS_ClientID *lcs_ClientID;
@property(readwrite,assign)	BOOL privacyOverride;
@property(readwrite,strong)	UMGSMMAP_IMSI *imsi;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *msisdn;
@property(readwrite,strong)	UMGSMMAP_LMSI *lmsi;
@property(readwrite,strong)	UMGSMMAP_IMEI *imei;
@property(readwrite,strong)	UMGSMMAP_LCS_Priority *lcs_Priority;
@property(readwrite,strong)	UMGSMMAP_LCS_QoS *lcs_QoS;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;


- (void)processBeforeEncode;
- (UMGSMMAP_ProvideSubscriberLocation_Arg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

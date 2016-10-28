//
//  UMGSMMAP_SubscriberLocationReport_Arg.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_LCS_Event.h"
#import "UMGSMMAP_LCS_ClientID.h"
#import "UMGSMMAP_LCSLocationInfo.h"
#import "UMGSMMAP_ISDN_AddressString.h"
#import "UMGSMMAP_IMSI.h"
#import "UMGSMMAP_IMEI.h"
#import "UMGSMMAP_Ext_GeographicalInformation.h"
#import "UMGSMMAP_AgeOfLocationInformation.h"
#import "UMGSMMAP_ExtensionContainer.h"

@interface UMGSMMAP_SubscriberLocationReport_Arg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_LCS_Event *lcs_Event;
	UMGSMMAP_LCS_ClientID *lcs_ClientID;
	UMGSMMAP_LCSLocationInfo *lcsLocationInfo;
	UMGSMMAP_ISDN_AddressString *msisdn;
	UMGSMMAP_IMSI *imsi;
	UMGSMMAP_IMEI *imei;
	UMGSMMAP_ISDN_AddressString *na_ESRD;
	UMGSMMAP_ISDN_AddressString *na_ESRK;
	UMGSMMAP_Ext_GeographicalInformation *locationEstimate;
	UMGSMMAP_AgeOfLocationInformation *ageOfLocationEstimate;
	UMGSMMAP_ExtensionContainer *extensionContainer;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_LCS_Event *lcs_Event;
@property(readwrite,strong)	UMGSMMAP_LCS_ClientID *lcs_ClientID;
@property(readwrite,strong)	UMGSMMAP_LCSLocationInfo *lcsLocationInfo;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *msisdn;
@property(readwrite,strong)	UMGSMMAP_IMSI *imsi;
@property(readwrite,strong)	UMGSMMAP_IMEI *imei;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *na_ESRD;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *na_ESRK;
@property(readwrite,strong)	UMGSMMAP_Ext_GeographicalInformation *locationEstimate;
@property(readwrite,strong)	UMGSMMAP_AgeOfLocationInformation *ageOfLocationEstimate;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;


- (void)processBeforeEncode;
- (UMGSMMAP_SubscriberLocationReport_Arg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

//
//  UMGSMMAP_GenericServiceInfo.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

#import <ulibgsmmap/UMGSMMAP_SS_Status.h>
#import <ulibgsmmap/UMGSMMAP_CliRestrictionOption.h>
#import <ulibgsmmap/UMGSMMAP_EMLPP_Priority.h>
#import <ulibgsmmap/UMGSMMAP_CCBS_FeatureList.h>

@interface UMGSMMAP_GenericServiceInfo : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_SS_Status *ss_Status;
	UMGSMMAP_CliRestrictionOption *cliRestrictionOption;
	UMGSMMAP_EMLPP_Priority *maximumEntitledPriority;
	UMGSMMAP_EMLPP_Priority *defaultPriority;
	UMGSMMAP_CCBS_FeatureList *ccbs_FeatureList;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_SS_Status *ss_Status;
@property(readwrite,strong)	UMGSMMAP_CliRestrictionOption *cliRestrictionOption;
@property(readwrite,strong)	UMGSMMAP_EMLPP_Priority *maximumEntitledPriority;
@property(readwrite,strong)	UMGSMMAP_EMLPP_Priority *defaultPriority;
@property(readwrite,strong)	UMGSMMAP_CCBS_FeatureList *ccbs_FeatureList;


- (void)processBeforeEncode;
- (UMGSMMAP_GenericServiceInfo *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

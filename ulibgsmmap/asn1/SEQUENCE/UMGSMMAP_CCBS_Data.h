//
//  UMGSMMAP_CCBS_Data.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

#import <ulibgsmmap/UMGSMMAP_CCBS_Feature.h>
#import <ulibgsmmap/UMGSMMAP_ISDN_AddressString.h>
#import <ulibgsmmap/UMGSMMAP_ServiceIndicator.h>
#import <ulibgsmmap/UMGSMMAP_ExternalSignalInfo.h>

@interface UMGSMMAP_CCBS_Data : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_CCBS_Feature *ccbs_Feature;
	UMGSMMAP_ISDN_AddressString *translatedB_Number;
	UMGSMMAP_ServiceIndicator *serviceIndicator;
	UMGSMMAP_ExternalSignalInfo *callInfo;
	UMGSMMAP_ExternalSignalInfo *networkSignalInfo;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_CCBS_Feature *ccbs_Feature;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *translatedB_Number;
@property(readwrite,strong)	UMGSMMAP_ServiceIndicator *serviceIndicator;
@property(readwrite,strong)	UMGSMMAP_ExternalSignalInfo *callInfo;
@property(readwrite,strong)	UMGSMMAP_ExternalSignalInfo *networkSignalInfo;


- (void)processBeforeEncode;
- (UMGSMMAP_CCBS_Data *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

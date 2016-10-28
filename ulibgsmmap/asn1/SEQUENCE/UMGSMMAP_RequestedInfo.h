//
//  UMGSMMAP_RequestedInfo.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_ExtensionContainer.h"

@interface UMGSMMAP_RequestedInfo : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	BOOL locationInformation;
	BOOL subscriberState;
	UMGSMMAP_ExtensionContainer *extensionContainer;
	BOOL currentLocation;
	UMASN1Integer *requestedDomain;
	BOOL imei;
	BOOL ms_classmark;
	BOOL mnpRequestedInfo;
	BOOL locationInformationEPS_Supported;
	BOOL t_adsData;
	UMASN1BitString *requestedNodes;
	BOOL servingNodeIndication;
	BOOL localTimeZoneRequest;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,assign)	BOOL locationInformation;
@property(readwrite,assign)	BOOL subscriberState;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,assign)	BOOL currentLocation;
@property(readwrite,strong)	UMASN1Integer *requestedDomain;
@property(readwrite,assign)	BOOL imei;
@property(readwrite,assign)	BOOL ms_classmark;
@property(readwrite,assign)	BOOL mnpRequestedInfo;
@property(readwrite,assign)	BOOL locationInformationEPS_Supported;
@property(readwrite,assign)	BOOL t_adsData;
@property(readwrite,strong)	UMASN1BitString *requestedNodes;
@property(readwrite,assign)	BOOL servingNodeIndication;
@property(readwrite,assign)	BOOL localTimeZoneRequest;


- (void)processBeforeEncode;
- (UMGSMMAP_RequestedInfo *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

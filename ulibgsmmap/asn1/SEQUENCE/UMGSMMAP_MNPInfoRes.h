//
//  UMGSMMAP_MNPInfoRes.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_RouteingNumber.h"
#import "UMGSMMAP_IMSI.h"
#import "UMGSMMAP_ISDN_AddressString.h"
#import "UMGSMMAP_NumberPortabilityStatus.h"
#import "UMGSMMAP_ExtensionContainer.h"

@interface UMGSMMAP_MNPInfoRes : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_RouteingNumber *routeingNumber;
	UMGSMMAP_IMSI *imsi;
	UMGSMMAP_ISDN_AddressString *msisdn;
	UMGSMMAP_NumberPortabilityStatus *numberPortabilityStatus;
	UMGSMMAP_ExtensionContainer *extensionContainer;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_RouteingNumber *routeingNumber;
@property(readwrite,strong)	UMGSMMAP_IMSI *imsi;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *msisdn;
@property(readwrite,strong)	UMGSMMAP_NumberPortabilityStatus *numberPortabilityStatus;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;


- (void)processBeforeEncode;
- (UMGSMMAP_MNPInfoRes *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

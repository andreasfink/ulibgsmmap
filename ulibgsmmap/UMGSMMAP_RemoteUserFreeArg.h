//
//  UMGSMMAP_RemoteUserFreeArg.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_IMSI.h"
#import "UMGSMMAP_ExternalSignalInfo.h"
#import "UMGSMMAP_CCBS_Feature.h"
#import "UMGSMMAP_ISDN_AddressString.h"
#import "UMGSMMAP_AlertingPattern.h"
#import "UMGSMMAP_ExtensionContainer.h"

@interface UMGSMMAP_RemoteUserFreeArg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_IMSI *imsi;
	UMGSMMAP_ExternalSignalInfo *callInfo;
	UMGSMMAP_CCBS_Feature *ccbs_Feature;
	UMGSMMAP_ISDN_AddressString *translatedB_Number;
	BOOL replaceB_Number;
	UMGSMMAP_AlertingPattern *alertingPattern;
	UMGSMMAP_ExtensionContainer *extensionContainer;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_IMSI *imsi;
@property(readwrite,strong)	UMGSMMAP_ExternalSignalInfo *callInfo;
@property(readwrite,strong)	UMGSMMAP_CCBS_Feature *ccbs_Feature;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *translatedB_Number;
@property(readwrite,assign)	BOOL replaceB_Number;
@property(readwrite,strong)	UMGSMMAP_AlertingPattern *alertingPattern;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;


- (void)processBeforeEncode;
- (UMGSMMAP_RemoteUserFreeArg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

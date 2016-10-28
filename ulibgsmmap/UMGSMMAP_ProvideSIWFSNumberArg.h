//
//  UMGSMMAP_ProvideSIWFSNumberArg.h
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

#import "UMGSMMAP_ExternalSignalInfo.h"
#import "UMGSMMAP_CallDirection.h"
#import "UMGSMMAP_ISDN_AddressString.h"
#import "UMGSMMAP_ExtensionContainer.h"

@interface UMGSMMAP_ProvideSIWFSNumberArg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_ExternalSignalInfo *gsm_BearerCapability;
	UMGSMMAP_ExternalSignalInfo *isdn_BearerCapability;
	UMGSMMAP_CallDirection *call_Direction;
	UMGSMMAP_ISDN_AddressString *b_Subscriber_Address;
	UMGSMMAP_ExternalSignalInfo *chosenChannel;
	UMGSMMAP_ExternalSignalInfo *lowerLayerCompatibility;
	UMGSMMAP_ExternalSignalInfo *highLayerCompatibility;
	UMGSMMAP_ExtensionContainer *extensionContainer;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_ExternalSignalInfo *gsm_BearerCapability;
@property(readwrite,strong)	UMGSMMAP_ExternalSignalInfo *isdn_BearerCapability;
@property(readwrite,strong)	UMGSMMAP_CallDirection *call_Direction;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *b_Subscriber_Address;
@property(readwrite,strong)	UMGSMMAP_ExternalSignalInfo *chosenChannel;
@property(readwrite,strong)	UMGSMMAP_ExternalSignalInfo *lowerLayerCompatibility;
@property(readwrite,strong)	UMGSMMAP_ExternalSignalInfo *highLayerCompatibility;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;


- (void)processBeforeEncode;
- (UMGSMMAP_ProvideSIWFSNumberArg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

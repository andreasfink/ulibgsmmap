//
//  UMGSMMAP_PrepareGroupCallArg.h
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

#import "UMGSMMAP_Ext_TeleserviceCode.h"
#import "UMGSMMAP_ASCI_CallReference.h"
#import "UMGSMMAP_CODEC_Info.h"
#import "UMGSMMAP_CipheringAlgorithm.h"
#import "UMGSMMAP_GroupKeyNumber.h"
#import "UMGSMMAP_Kc.h"
#import "UMGSMMAP_EMLPP_Priority.h"
#import "UMGSMMAP_ExtensionContainer.h"

@interface UMGSMMAP_PrepareGroupCallArg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_Ext_TeleserviceCode *teleservice;
	UMGSMMAP_ASCI_CallReference *asciCallReference;
	UMGSMMAP_CODEC_Info *codec_Info;
	UMGSMMAP_CipheringAlgorithm *cipheringAlgorithm;
	UMGSMMAP_GroupKeyNumber *groupKeyNumber;
	UMGSMMAP_Kc *groupKey;
	UMGSMMAP_EMLPP_Priority *priority;
	BOOL uplinkFree;
	UMGSMMAP_ExtensionContainer *extensionContainer;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_Ext_TeleserviceCode *teleservice;
@property(readwrite,strong)	UMGSMMAP_ASCI_CallReference *asciCallReference;
@property(readwrite,strong)	UMGSMMAP_CODEC_Info *codec_Info;
@property(readwrite,strong)	UMGSMMAP_CipheringAlgorithm *cipheringAlgorithm;
@property(readwrite,strong)	UMGSMMAP_GroupKeyNumber *groupKeyNumber;
@property(readwrite,strong)	UMGSMMAP_Kc *groupKey;
@property(readwrite,strong)	UMGSMMAP_EMLPP_Priority *priority;
@property(readwrite,assign)	BOOL uplinkFree;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;


- (void)processBeforeEncode;
- (UMGSMMAP_PrepareGroupCallArg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

//
//  UMGSMMAP_VoiceBroadcastData.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_GroupId.h"
#import "UMGSMMAP_ExtensionContainer.h"

@interface UMGSMMAP_VoiceBroadcastData : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_GroupId *groupid;
	BOOL broadcastInitEntitlement;
	UMGSMMAP_ExtensionContainer *extensionContainer;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_GroupId *groupid;
@property(readwrite,assign)	BOOL broadcastInitEntitlement;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;


- (void)processBeforeEncode;
- (UMGSMMAP_VoiceBroadcastData *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

//
//  UMGSMMAP_ForwardGroupCallSignallingArg.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

#import <ulibgsmmap/UMGSMMAP_IMSI.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>

@interface UMGSMMAP_ForwardGroupCallSignallingArg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_IMSI *imsi;
	BOOL uplinkRequestAck;
	BOOL uplinkReleaseIndication;
	BOOL uplinkRejectCommand;
	BOOL uplinkSeizedCommand;
	BOOL uplinkReleaseCommand;
	UMGSMMAP_ExtensionContainer *extensionContainer;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_IMSI *imsi;
@property(readwrite,assign)	BOOL uplinkRequestAck;
@property(readwrite,assign)	BOOL uplinkReleaseIndication;
@property(readwrite,assign)	BOOL uplinkRejectCommand;
@property(readwrite,assign)	BOOL uplinkSeizedCommand;
@property(readwrite,assign)	BOOL uplinkReleaseCommand;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;


- (void)processBeforeEncode;
- (UMGSMMAP_ForwardGroupCallSignallingArg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

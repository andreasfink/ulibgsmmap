//
//  UMGSMMAP_MT_ForwardSM_Arg.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

#import <ulibgsmmap/UMGSMMAP_SM_RP_DA.h>
#import <ulibgsmmap/UMGSMMAP_SM_RP_OA.h>
#import <ulibgsmmap/UMGSMMAP_SignalInfo.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>

@interface UMGSMMAP_MT_ForwardSM_Arg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_SM_RP_DA *sm_RP_DA;
	UMGSMMAP_SM_RP_OA *sm_RP_OA;
	UMGSMMAP_SignalInfo *sm_RP_UI;
	BOOL moreMessagesToSend;
	UMGSMMAP_ExtensionContainer *extensionContainer;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_SM_RP_DA *sm_RP_DA;
@property(readwrite,strong)	UMGSMMAP_SM_RP_OA *sm_RP_OA;
@property(readwrite,strong)	UMGSMMAP_SignalInfo *sm_RP_UI;
@property(readwrite,assign)	BOOL moreMessagesToSend;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;


- (void)processBeforeEncode;
- (UMGSMMAP_MT_ForwardSM_Arg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

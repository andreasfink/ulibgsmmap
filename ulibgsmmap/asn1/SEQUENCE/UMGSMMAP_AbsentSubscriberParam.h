//
//  UMGSMMAP_AbsentSubscriberParam.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_ExtensionContainer.h"
#import "UMGSMMAP_AbsentSubscriberReason.h"

@interface UMGSMMAP_AbsentSubscriberParam : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_ExtensionContainer *extensionContainer;
	UMGSMMAP_AbsentSubscriberReason *absentSubscriberReason;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,strong)	UMGSMMAP_AbsentSubscriberReason *absentSubscriberReason;


- (void)processBeforeEncode;
- (UMGSMMAP_AbsentSubscriberParam *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

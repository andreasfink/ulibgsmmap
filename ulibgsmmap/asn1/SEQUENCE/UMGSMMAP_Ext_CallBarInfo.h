//
//  UMGSMMAP_Ext_CallBarInfo.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_SS_Code.h"
#import "UMGSMMAP_Ext_CallBarFeatureList.h"
#import "UMGSMMAP_ExtensionContainer.h"

@interface UMGSMMAP_Ext_CallBarInfo : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_SS_Code *ss_Code;
	UMGSMMAP_Ext_CallBarFeatureList *callBarringFeatureList;
	UMGSMMAP_ExtensionContainer *extensionContainer;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_SS_Code *ss_Code;
@property(readwrite,strong)	UMGSMMAP_Ext_CallBarFeatureList *callBarringFeatureList;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;


- (void)processBeforeEncode;
- (UMGSMMAP_Ext_CallBarInfo *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

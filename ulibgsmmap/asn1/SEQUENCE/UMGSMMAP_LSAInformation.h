//
//  UMGSMMAP_LSAInformation.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_LSAOnlyAccessIndicator.h"
#import "UMGSMMAP_LSADataList.h"
#import "UMGSMMAP_ExtensionContainer.h"

@interface UMGSMMAP_LSAInformation : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	BOOL completeDataListIncluded;
	UMGSMMAP_LSAOnlyAccessIndicator *lsaOnlyAccessIndicator;
	UMGSMMAP_LSADataList *lsaDataList;
	UMGSMMAP_ExtensionContainer *extensionContainer;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,assign)	BOOL completeDataListIncluded;
@property(readwrite,strong)	UMGSMMAP_LSAOnlyAccessIndicator *lsaOnlyAccessIndicator;
@property(readwrite,strong)	UMGSMMAP_LSADataList *lsaDataList;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;


- (void)processBeforeEncode;
- (UMGSMMAP_LSAInformation *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

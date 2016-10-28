//
//  UMGSMMAP_ODB_Data.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_ODB_GeneralData.h"
#import "UMGSMMAP_ODB_HPLMN_Data.h"
#import "UMGSMMAP_ExtensionContainer.h"

@interface UMGSMMAP_ODB_Data : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_ODB_GeneralData *odb_GeneralData;
	UMGSMMAP_ODB_HPLMN_Data *odb_HPLMN_Data;
	UMGSMMAP_ExtensionContainer *extensionContainer;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_ODB_GeneralData *odb_GeneralData;
@property(readwrite,strong)	UMGSMMAP_ODB_HPLMN_Data *odb_HPLMN_Data;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;


- (void)processBeforeEncode;
- (UMGSMMAP_ODB_Data *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

//
//  UMGSMMAP_CUG_Feature.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

#import <ulibgsmmap/UMGSMMAP_Ext_BasicServiceCode.h>
#import <ulibgsmmap/UMGSMMAP_CUG_Index.h>
#import <ulibgsmmap/UMGSMMAP_InterCUG_Restrictions.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>

@interface UMGSMMAP_CUG_Feature : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_Ext_BasicServiceCode *basicService;
	UMGSMMAP_CUG_Index *preferentialCUG_Indicator;
	UMGSMMAP_InterCUG_Restrictions *interCUG_Restrictions;
	UMGSMMAP_ExtensionContainer *extensionContainer;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_Ext_BasicServiceCode *basicService;
@property(readwrite,strong)	UMGSMMAP_CUG_Index *preferentialCUG_Indicator;
@property(readwrite,strong)	UMGSMMAP_InterCUG_Restrictions *interCUG_Restrictions;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;


- (void)processBeforeEncode;
- (UMGSMMAP_CUG_Feature *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

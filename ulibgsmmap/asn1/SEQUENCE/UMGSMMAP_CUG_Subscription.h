//
//  UMGSMMAP_CUG_Subscription.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

#import <ulibgsmmap/UMGSMMAP_CUG_Index.h>
#import <ulibgsmmap/UMGSMMAP_CUG_Interlock.h>
#import <ulibgsmmap/UMGSMMAP_IntraCUG_Options.h>
#import <ulibgsmmap/UMGSMMAP_Ext_BasicServiceGroupList.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>

@interface UMGSMMAP_CUG_Subscription : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_CUG_Index *cug_Index;
	UMGSMMAP_CUG_Interlock *cug_Interlock;
	UMGSMMAP_IntraCUG_Options *intraCUG_Options;
	UMGSMMAP_Ext_BasicServiceGroupList *basicServiceGroupList;
	UMGSMMAP_ExtensionContainer *extensionContainer;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_CUG_Index *cug_Index;
@property(readwrite,strong)	UMGSMMAP_CUG_Interlock *cug_Interlock;
@property(readwrite,strong)	UMGSMMAP_IntraCUG_Options *intraCUG_Options;
@property(readwrite,strong)	UMGSMMAP_Ext_BasicServiceGroupList *basicServiceGroupList;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;


- (void)processBeforeEncode;
- (UMGSMMAP_CUG_Subscription *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

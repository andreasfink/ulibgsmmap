//
//  UMGSMMAP_Ext_SS_Data.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_SS_Code.h"
#import "UMGSMMAP_Ext_SS_Status.h"
#import "UMGSMMAP_SS_SubscriptionOption.h"
#import "UMGSMMAP_Ext_BasicServiceGroupList.h"
#import "UMGSMMAP_ExtensionContainer.h"

@interface UMGSMMAP_Ext_SS_Data : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_SS_Code *ss_Code;
	UMGSMMAP_Ext_SS_Status *ss_Status;
	UMGSMMAP_SS_SubscriptionOption *ss_SubscriptionOption;
	UMGSMMAP_Ext_BasicServiceGroupList *basicServiceGroupList;
	UMGSMMAP_ExtensionContainer *extensionContainer;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_SS_Code *ss_Code;
@property(readwrite,strong)	UMGSMMAP_Ext_SS_Status *ss_Status;
@property(readwrite,strong)	UMGSMMAP_SS_SubscriptionOption *ss_SubscriptionOption;
@property(readwrite,strong)	UMGSMMAP_Ext_BasicServiceGroupList *basicServiceGroupList;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;


- (void)processBeforeEncode;
- (UMGSMMAP_Ext_SS_Data *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

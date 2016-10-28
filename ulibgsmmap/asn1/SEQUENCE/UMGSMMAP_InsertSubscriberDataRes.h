//
//  UMGSMMAP_InsertSubscriberDataRes.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_TeleserviceList.h"
#import "UMGSMMAP_BearerServiceList.h"
#import "UMGSMMAP_SS_List.h"
#import "UMGSMMAP_ODB_GeneralData.h"
#import "UMGSMMAP_RegionalSubscriptionResponse.h"
#import "UMGSMMAP_SupportedCamelPhases.h"
#import "UMGSMMAP_ExtensionContainer.h"

@interface UMGSMMAP_InsertSubscriberDataRes : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_TeleserviceList *teleserviceList;
	UMGSMMAP_BearerServiceList *bearerServiceList;
	UMGSMMAP_SS_List *ss_List;
	UMGSMMAP_ODB_GeneralData *odb_GeneralData;
	UMGSMMAP_RegionalSubscriptionResponse *regionalSubscriptionResponse;
	UMGSMMAP_SupportedCamelPhases *supportedCamelPhases;
	UMGSMMAP_ExtensionContainer *extensionContainer;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_TeleserviceList *teleserviceList;
@property(readwrite,strong)	UMGSMMAP_BearerServiceList *bearerServiceList;
@property(readwrite,strong)	UMGSMMAP_SS_List *ss_List;
@property(readwrite,strong)	UMGSMMAP_ODB_GeneralData *odb_GeneralData;
@property(readwrite,strong)	UMGSMMAP_RegionalSubscriptionResponse *regionalSubscriptionResponse;
@property(readwrite,strong)	UMGSMMAP_SupportedCamelPhases *supportedCamelPhases;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;


- (void)processBeforeEncode;
- (UMGSMMAP_InsertSubscriberDataRes *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

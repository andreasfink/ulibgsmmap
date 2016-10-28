//
//  UMGSMMAP_SS_Data.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_SS_Code.h"
#import "UMGSMMAP_SS_Status.h"
#import "UMGSMMAP_SS_SubscriptionOption.h"
#import "UMGSMMAP_BasicServiceGroupList.h"
#import "UMGSMMAP_EMLPP_Priority.h"

@interface UMGSMMAP_SS_Data : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_SS_Code *ss_Code;
	UMGSMMAP_SS_Status *ss_Status;
	UMGSMMAP_SS_SubscriptionOption *ss_SubscriptionOption;
	UMGSMMAP_BasicServiceGroupList *basicServiceGroupList;
	UMGSMMAP_EMLPP_Priority *defaultPriority;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_SS_Code *ss_Code;
@property(readwrite,strong)	UMGSMMAP_SS_Status *ss_Status;
@property(readwrite,strong)	UMGSMMAP_SS_SubscriptionOption *ss_SubscriptionOption;
@property(readwrite,strong)	UMGSMMAP_BasicServiceGroupList *basicServiceGroupList;
@property(readwrite,strong)	UMGSMMAP_EMLPP_Priority *defaultPriority;


- (void)processBeforeEncode;
- (UMGSMMAP_SS_Data *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

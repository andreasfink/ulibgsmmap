//
//  UMGSMMAP_RegisterSS_Arg.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

#import <ulibgsmmap/UMGSMMAP_SS_Code.h>
#import <ulibgsmmap/UMGSMMAP_BasicServiceCode.h>
#import <ulibgsmmap/UMGSMMAP_AddressString.h>
#import <ulibgsmmap/UMGSMMAP_ISDN_SubaddressString.h>
#import <ulibgsmmap/UMGSMMAP_NoReplyConditionTime.h>
#import <ulibgsmmap/UMGSMMAP_EMLPP_Priority.h>

@interface UMGSMMAP_RegisterSS_Arg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_SS_Code *ss_Code;
	UMGSMMAP_BasicServiceCode *basicService;
	UMGSMMAP_AddressString *forwardedToNumber;
	UMGSMMAP_ISDN_SubaddressString *forwardedToSubaddress;
	UMGSMMAP_NoReplyConditionTime *noReplyConditionTime;
	UMGSMMAP_EMLPP_Priority *defaultPriority;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_SS_Code *ss_Code;
@property(readwrite,strong)	UMGSMMAP_BasicServiceCode *basicService;
@property(readwrite,strong)	UMGSMMAP_AddressString *forwardedToNumber;
@property(readwrite,strong)	UMGSMMAP_ISDN_SubaddressString *forwardedToSubaddress;
@property(readwrite,strong)	UMGSMMAP_NoReplyConditionTime *noReplyConditionTime;
@property(readwrite,strong)	UMGSMMAP_EMLPP_Priority *defaultPriority;


- (void)processBeforeEncode;
- (UMGSMMAP_RegisterSS_Arg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

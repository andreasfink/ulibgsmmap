//
//  UMGSMMAP_CCBS_Feature.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_CCBS_Index.h"
#import "UMGSMMAP_ISDN_AddressString.h"
#import "UMGSMMAP_ISDN_SubaddressString.h"
#import "UMGSMMAP_BasicServiceCode.h"

@interface UMGSMMAP_CCBS_Feature : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_CCBS_Index *ccbs_Index;
	UMGSMMAP_ISDN_AddressString *b_subscriberNumber;
	UMGSMMAP_ISDN_SubaddressString *b_subscriberSubaddress;
	UMGSMMAP_BasicServiceCode *basicServiceGroup;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_CCBS_Index *ccbs_Index;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *b_subscriberNumber;
@property(readwrite,strong)	UMGSMMAP_ISDN_SubaddressString *b_subscriberSubaddress;
@property(readwrite,strong)	UMGSMMAP_BasicServiceCode *basicServiceGroup;


- (void)processBeforeEncode;
- (UMGSMMAP_CCBS_Feature *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

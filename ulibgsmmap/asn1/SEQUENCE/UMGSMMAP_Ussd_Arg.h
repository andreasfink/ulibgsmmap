//
//  UMGSMMAP_Ussd_Arg.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_USSD_DataCodingScheme.h"
#import "UMGSMMAP_USSD_String.h"
#import "UMGSMMAP_ISDN_AddressString.h"

@interface UMGSMMAP_Ussd_Arg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_USSD_DataCodingScheme *ussd_DataCodingScheme;
	UMGSMMAP_USSD_String *ussd_String;
	UMASN1OctetString *alertingPattern;
	UMGSMMAP_ISDN_AddressString *msisdn;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_USSD_DataCodingScheme *ussd_DataCodingScheme;
@property(readwrite,strong)	UMGSMMAP_USSD_String *ussd_String;
@property(readwrite,strong)	UMASN1OctetString *alertingPattern;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *msisdn;


- (void)processBeforeEncode;
- (UMGSMMAP_Ussd_Arg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

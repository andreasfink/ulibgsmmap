//
//  UMGSMMAP_Ussd_Res.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

#import <ulibgsmmap/UMGSMMAP_USSD_DataCodingScheme.h>
#import <ulibgsmmap/UMGSMMAP_USSD_String.h>

@interface UMGSMMAP_Ussd_Res : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_USSD_DataCodingScheme *ussd_DataCodingScheme;
	UMGSMMAP_USSD_String *ussd_String;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_USSD_DataCodingScheme *ussd_DataCodingScheme;
@property(readwrite,strong)	UMGSMMAP_USSD_String *ussd_String;


- (void)processBeforeEncode;
- (UMGSMMAP_Ussd_Res *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

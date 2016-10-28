//
//  UMGSMMAP_MAP_ProviderAbortReason.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"


typedef enum UMGSMMAP_MAP_ProviderAbortReason_enum
{
    UMGSMMAP_MAP_ProviderAbortReason_abnormalDialogue = 0,
    UMGSMMAP_MAP_ProviderAbortReason_invalidPDU = 1,
}  UMGSMMAP_MAP_ProviderAbortReason_enum;


@interface UMGSMMAP_MAP_ProviderAbortReason : UMASN1Enumerated<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
}
@property(readwrite,strong)    NSString *operationName;

- (UMGSMMAP_MAP_ProviderAbortReason *)initWithString:(NSString *)s;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

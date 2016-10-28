//
//  UMGSMMAP_CurrentSecurityContext.h
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

#import "UMGSMMAP_GSM_SecurityContextData.h"
#import "UMGSMMAP_UMTS_SecurityContextData.h"

@interface UMGSMMAP_CurrentSecurityContext : UMASN1Choice<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_GSM_SecurityContextData *gsm_SecurityContextData;
	UMGSMMAP_UMTS_SecurityContextData *umts_SecurityContextData;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_GSM_SecurityContextData *gsm_SecurityContextData;
@property(readwrite,strong)	UMGSMMAP_UMTS_SecurityContextData *umts_SecurityContextData;


- (void)processBeforeEncode;
- (UMGSMMAP_CurrentSecurityContext *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

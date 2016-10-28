//
//  UMGSMMAP_UMTS_SecurityContextData.h
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

#import "UMGSMMAP_CK.h"
#import "UMGSMMAP_IK.h"
#import "UMGSMMAP_KSI.h"

@interface UMGSMMAP_UMTS_SecurityContextData : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_CK *ck;
	UMGSMMAP_IK *ik;
	UMGSMMAP_KSI *ksi;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_CK *ck;
@property(readwrite,strong)	UMGSMMAP_IK *ik;
@property(readwrite,strong)	UMGSMMAP_KSI *ksi;


- (void)processBeforeEncode;
- (UMGSMMAP_UMTS_SecurityContextData *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

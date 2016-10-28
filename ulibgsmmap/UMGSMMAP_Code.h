//
//  UMGSMMAP_Code.h
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


@interface UMGSMMAP_Code : UMASN1Choice<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMASN1Integer *local;
	UMASN1Object *global;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMASN1Integer *local;
@property(readwrite,strong)	UMASN1Object *global;


- (void)processBeforeEncode;
- (UMGSMMAP_Code *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

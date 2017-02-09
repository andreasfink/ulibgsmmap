//
//  UMGSMMAP_CellIdOrLAI.h
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_CellIdFixedLength.h"
#import "UMGSMMAP_LAIFixedLength.h"

@interface UMGSMMAP_CellIdOrLAI : UMASN1Choice<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_CellIdFixedLength *cellIdFixedLength;
	UMGSMMAP_LAIFixedLength *laiFixedLength;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_CellIdFixedLength *cellIdFixedLength;
@property(readwrite,strong)	UMGSMMAP_LAIFixedLength *laiFixedLength;


- (void)processBeforeEncode;
- (UMGSMMAP_CellIdOrLAI *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

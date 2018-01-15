//
//  UMGSMMAP_EraseCC_EntryRes.h
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

#import "UMGSMMAP_SS_Code.h"
#import "UMGSMMAP_SS_Status.h"

@interface UMGSMMAP_EraseCC_EntryRes : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_SS_Code *ss_Code;
	UMGSMMAP_SS_Status *ss_Status;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_SS_Code *ss_Code;
@property(readwrite,strong)	UMGSMMAP_SS_Status *ss_Status;


- (void)processBeforeEncode;
- (UMGSMMAP_EraseCC_EntryRes *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

//
//  UMGSMMAP_Ss_Info.h
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

#import "UMGSMMAP_ForwardingInfo.h"
#import "UMGSMMAP_CallBarringInfo.h"
#import "UMGSMMAP_SS_Data.h"

@interface UMGSMMAP_Ss_Info : UMASN1Choice<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_ForwardingInfo *forwardingInfo;
	UMGSMMAP_CallBarringInfo *callBarringInfo;
	UMGSMMAP_SS_Data *ss_Data;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_ForwardingInfo *forwardingInfo;
@property(readwrite,strong)	UMGSMMAP_CallBarringInfo *callBarringInfo;
@property(readwrite,strong)	UMGSMMAP_SS_Data *ss_Data;


- (void)processBeforeEncode;
- (UMGSMMAP_Ss_Info *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

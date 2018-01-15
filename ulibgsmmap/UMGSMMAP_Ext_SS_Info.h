//
//  UMGSMMAP_Ext_SS_Info.h
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

#import "UMGSMMAP_Ext_ForwInfo.h"
#import "UMGSMMAP_Ext_CallBarInfo.h"
#import "UMGSMMAP_CUG_Info.h"
#import "UMGSMMAP_Ext_SS_Data.h"
#import "UMGSMMAP_EMLPP_Info.h"

@interface UMGSMMAP_Ext_SS_Info : UMASN1Choice<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_Ext_ForwInfo *forwardingInfo;
	UMGSMMAP_Ext_CallBarInfo *callBarringInfo;
	UMGSMMAP_CUG_Info *cug_Info;
	UMGSMMAP_Ext_SS_Data *ss_Data;
	UMGSMMAP_EMLPP_Info *emlpp_Info;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_Ext_ForwInfo *forwardingInfo;
@property(readwrite,strong)	UMGSMMAP_Ext_CallBarInfo *callBarringInfo;
@property(readwrite,strong)	UMGSMMAP_CUG_Info *cug_Info;
@property(readwrite,strong)	UMGSMMAP_Ext_SS_Data *ss_Data;
@property(readwrite,strong)	UMGSMMAP_EMLPP_Info *emlpp_Info;


- (void)processBeforeEncode;
- (UMGSMMAP_Ext_SS_Info *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

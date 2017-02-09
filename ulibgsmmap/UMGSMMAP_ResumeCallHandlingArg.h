//
//  UMGSMMAP_ResumeCallHandlingArg.h
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

#import "UMGSMMAP_CallReferenceNumber.h"
#import "UMGSMMAP_Ext_BasicServiceCode.h"
#import "UMGSMMAP_ForwardingData.h"
#import "UMGSMMAP_IMSI.h"
#import "UMGSMMAP_CUG_CheckInfo.h"
#import "UMGSMMAP_O_CSI.h"
#import "UMGSMMAP_ExtensionContainer.h"
#import "UMGSMMAP_ISDN_AddressString.h"
#import "UMGSMMAP_UU_Data.h"

@interface UMGSMMAP_ResumeCallHandlingArg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_CallReferenceNumber *callReferenceNumber;
	UMGSMMAP_Ext_BasicServiceCode *basicServiceGroup;
	UMGSMMAP_ForwardingData *forwardingData;
	UMGSMMAP_IMSI *imsi;
	UMGSMMAP_CUG_CheckInfo *cug_CheckInfo;
	UMGSMMAP_O_CSI *o_CSI;
	UMGSMMAP_ExtensionContainer *extensionContainer;
	BOOL ccbs_Possible;
	UMGSMMAP_ISDN_AddressString *msisdn;
	UMGSMMAP_UU_Data *uu_Data;
	BOOL allInformationSent;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_CallReferenceNumber *callReferenceNumber;
@property(readwrite,strong)	UMGSMMAP_Ext_BasicServiceCode *basicServiceGroup;
@property(readwrite,strong)	UMGSMMAP_ForwardingData *forwardingData;
@property(readwrite,strong)	UMGSMMAP_IMSI *imsi;
@property(readwrite,strong)	UMGSMMAP_CUG_CheckInfo *cug_CheckInfo;
@property(readwrite,strong)	UMGSMMAP_O_CSI *o_CSI;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,assign)	BOOL ccbs_Possible;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *msisdn;
@property(readwrite,strong)	UMGSMMAP_UU_Data *uu_Data;
@property(readwrite,assign)	BOOL allInformationSent;


- (void)processBeforeEncode;
- (UMGSMMAP_ResumeCallHandlingArg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

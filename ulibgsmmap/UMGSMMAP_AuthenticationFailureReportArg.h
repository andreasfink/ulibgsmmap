//
//  UMGSMMAP_AuthenticationFailureReportArg.h
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

#import "UMGSMMAP_IMSI.h"
#import "UMGSMMAP_ExtensionContainer.h"
#import "UMGSMMAP_RAND.h"
#import "UMGSMMAP_ISDN_AddressString.h"

@interface UMGSMMAP_AuthenticationFailureReportArg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_IMSI *imsi;
	UMASN1Boolean *failureCause;
	UMGSMMAP_ExtensionContainer *extensionContainer;
	UMASN1Boolean *re_attempt;
	UMASN1Boolean *accessType;
	UMGSMMAP_RAND *rand;
	UMGSMMAP_ISDN_AddressString *vlr_Number;
	UMGSMMAP_ISDN_AddressString *sgsn_Number;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_IMSI *imsi;
@property(readwrite,strong)	UMASN1Boolean *failureCause;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,strong)	UMASN1Boolean *re_attempt;
@property(readwrite,strong)	UMASN1Boolean *accessType;
@property(readwrite,strong)	UMGSMMAP_RAND *rand;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *vlr_Number;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *sgsn_Number;


- (void)processBeforeEncode;
- (UMGSMMAP_AuthenticationFailureReportArg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

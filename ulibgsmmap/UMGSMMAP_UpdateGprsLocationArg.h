//
//  UMGSMMAP_UpdateGprsLocationArg.h
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

#import "UMGSMMAP_IMSI.h"
#import "UMGSMMAP_ISDN_AddressString.h"
#import "UMGSMMAP_GSN_Address.h"
#import "UMGSMMAP_ExtensionContainer.h"
#import "UMGSMMAP_SGSN_Capability.h"

@interface UMGSMMAP_UpdateGprsLocationArg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_IMSI *imsi;
	UMGSMMAP_ISDN_AddressString *sgsn_Number;
	UMGSMMAP_GSN_Address *sgsn_Address;
	UMGSMMAP_ExtensionContainer *extensionContainer;
	UMGSMMAP_SGSN_Capability *sgsn_Capability;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_IMSI *imsi;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *sgsn_Number;
@property(readwrite,strong)	UMGSMMAP_GSN_Address *sgsn_Address;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,strong)	UMGSMMAP_SGSN_Capability *sgsn_Capability;


- (void)processBeforeEncode;
- (UMGSMMAP_UpdateGprsLocationArg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

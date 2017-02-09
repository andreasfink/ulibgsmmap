//
//  UMGSMMAP_UpdateLocationArg.h
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
#import "UMGSMMAP_ISDN_AddressString.h"
#import "UMGSMMAP_LMSI.h"
#import "UMGSMMAP_ExtensionContainer.h"
#import "UMGSMMAP_VLR_Capability.h"

@interface UMGSMMAP_UpdateLocationArg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_IMSI *imsi;
	UMGSMMAP_ISDN_AddressString *msc_Number;
	UMGSMMAP_ISDN_AddressString *vlr_Number;
	UMGSMMAP_LMSI *lmsi;
	UMGSMMAP_ExtensionContainer *extensionContainer;
	UMGSMMAP_VLR_Capability *vlr_Capability;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_IMSI *imsi;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *msc_Number;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *vlr_Number;
@property(readwrite,strong)	UMGSMMAP_LMSI *lmsi;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,strong)	UMGSMMAP_VLR_Capability *vlr_Capability;


- (void)processBeforeEncode;
- (UMGSMMAP_UpdateLocationArg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

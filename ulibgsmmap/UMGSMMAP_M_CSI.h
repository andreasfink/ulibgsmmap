//
//  UMGSMMAP_M_CSI.h
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

#import "UMGSMMAP_MobilityTriggers.h"
#import "UMGSMMAP_ServiceKey.h"
#import "UMGSMMAP_ISDN_AddressString.h"
#import "UMGSMMAP_ExtensionContainer.h"

@interface UMGSMMAP_M_CSI : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_MobilityTriggers *mobilityTriggers;
	UMGSMMAP_ServiceKey *serviceKey;
	UMGSMMAP_ISDN_AddressString *gsmSCF_Address;
	UMGSMMAP_ExtensionContainer *extensionContainer;
	BOOL notificationToCSE;
	BOOL csi_Active;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_MobilityTriggers *mobilityTriggers;
@property(readwrite,strong)	UMGSMMAP_ServiceKey *serviceKey;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *gsmSCF_Address;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,assign)	BOOL notificationToCSE;
@property(readwrite,assign)	BOOL csi_Active;


- (void)processBeforeEncode;
- (UMGSMMAP_M_CSI *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

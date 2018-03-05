//
//  UMGSMMAP_VLR_Capability.h
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

#import "UMGSMMAP_SupportedCamelPhases.h"
#import "UMGSMMAP_ExtensionContainer.h"
#import "UMGSMMAP_SuperChargerInfo.h"
#import "UMGSMMAP_IST_SupportIndicator.h"
#import "UMGSMMAP_SupportedLCS_CapabilitySets.h"
#import "UMGSMMAP_OfferedCamel4CSIs.h"
#import "UMGSMMAP_SupportedRAT_Types.h"

@interface UMGSMMAP_VLR_Capability : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_SupportedCamelPhases *supportedCamelPhases;
	UMGSMMAP_ExtensionContainer *extensionContainer;
	BOOL solsaSupportIndicator;
    UMGSMMAP_IST_SupportIndicator *_istSupportIndicator;
    UMGSMMAP_SuperChargerInfo *_superChargerSupportedInServingNetworkEntity;
    BOOL _longFTNSupported;
    UMGSMMAP_SupportedLCS_CapabilitySets *_supportedLCS_CapabilitySets;
    UMGSMMAP_OfferedCamel4CSIs *_offeredCamel4CSIs;
    UMGSMMAP_SupportedRAT_Types *_supportedRAT_TypesIndicator;
    BOOL _longGroupID_Supported;
    BOOL _mtRoamingForwardingSupported;
    BOOL _msisdn_lessOperation_Supported;
    BOOL _reset_ids_Supported;
}

@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_SupportedCamelPhases *supportedCamelPhases;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,assign)	BOOL solsaSupportIndicator;


@property(readwrite,strong)    UMGSMMAP_IST_SupportIndicator *istSupportIndicator;
@property(readwrite,strong)    UMGSMMAP_SuperChargerInfo *superChargerSupportedInServingNetworkEntity;
@property(readwrite,assign)    BOOL longFTNSupported;
@property(readwrite,strong)    UMGSMMAP_SupportedLCS_CapabilitySets *supportedLCS_CapabilitySets;
@property(readwrite,strong)    UMGSMMAP_OfferedCamel4CSIs *offeredCamel4CSIs;
@property(readwrite,strong)    UMGSMMAP_SupportedRAT_Types *supportedRAT_TypesIndicator;
@property(readwrite,assign)    BOOL longGroupID_Supported;
@property(readwrite,assign)    BOOL mtRoamingForwardingSupported;
@property(readwrite,assign)    BOOL msisdn_lessOperation_Supported;
@property(readwrite,assign)    BOOL reset_ids_Supported;

- (void)processBeforeEncode;
- (UMGSMMAP_VLR_Capability *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;
- (UMGSMMAP_VLR_Capability *)initWithString:(NSString *)s;
@end

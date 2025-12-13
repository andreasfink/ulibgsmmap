//
//  UMGSMMAP_PurgeMS_Arg.h
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

#import <ulibgsmmap/UMGSMMAP_IMSI.h>
#import <ulibgsmmap/UMGSMMAP_ISDN_AddressString.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>
#import <ulibgsmmap/UMGSMMAP_LocationInformation.h>
#import <ulibgsmmap/UMGSMMAP_LocationInformationGPRS.h>
#import <ulibgsmmap/UMGSMMAP_LocationInformationEPS.h>


@interface UMGSMMAP_PurgeMS_Arg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString                            *_operationName;
	UMGSMMAP_IMSI                       *_imsi;
	UMGSMMAP_ISDN_AddressString         *_vlr_Number;
	UMGSMMAP_ISDN_AddressString         *_sgsn_Number;
	UMGSMMAP_ExtensionContainer         *_extensionContainer;
    UMGSMMAP_LocationInformation        *_locationInformation;
    UMGSMMAP_LocationInformationGPRS    *_locationInformationGPRS;
    UMGSMMAP_LocationInformationEPS     *_locationInformationEPS;
}
@property(readwrite,strong) NSString                    *operationName;
@property(readwrite,strong) UMGSMMAP_IMSI               *imsi;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *vlr_Number;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *sgsn_Number;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,strong) UMGSMMAP_LocationInformation        *locationInformation;
@property(readwrite,strong) UMGSMMAP_LocationInformationGPRS    *locationInformationGPRS;
@property(readwrite,strong) UMGSMMAP_LocationInformationEPS     *locationInformationEPS;


- (void)processBeforeEncode;
- (UMGSMMAP_PurgeMS_Arg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

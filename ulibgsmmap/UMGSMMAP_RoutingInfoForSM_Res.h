//
//  UMGSMMAP_RoutingInfoForSM_Res.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 19.04.16.
//
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1.h>
#import <ulibgsmmap/UMGSMMAP_IMSI.h>
#import <ulibgsmmap/UMGSMMAP_LocationInfoWithLMSI.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>

/*
 RoutingInfoForSM-Res ::= SEQUENCE
 {
	imsi					IMSI,
	locationInfoWithLMSI	[0] IMPLICIT SEQUENCE {
 networkNode-Number		[1] IMPLICIT ISDN-AddressString,
 lmsi					LMSI			OPTIONAL,
 extensionContainer		ExtensionContainer	OPTIONAL,
 ...,
 gprsNodeIndicator		[5]	NULL		OPTIONAL,
 -- gprsNodeIndicator is set only if the SGSN number is sent as the
 -- Network Node Number
 additional-Number		[6] Additional-Number	OPTIONAL
 -- NetworkNode-number can be either msc-number or sgsn-number
 } ,
	extensionContainer		[4] ExtensionContainer	OPTIONAL,
	...
 }
*/

@interface UMGSMMAP_RoutingInfoForSM_Res : UMGSMMAP_asn1
{
    UMGSMMAP_IMSI *imsi;
    UMGSMMAP_LocationInfoWithLMSI *locationInfoWithLMSI;
    UMGSMMAP_ExtensionContainer *extensionContainer;
    
/*  UMGSMMAP_Address    *msisdn;
    UMGSMMAP_sm_RP_PRI  *sm_RP_PRI;
    UMGSMMAP_Address    *serviceCenterAddress;
    UMGSMMAP_extensionContainer *extensionContainer;
    UMGSMMAP_gprsSupportIndicator   *gprsSupportIndicator;
    UMGSMMAP_sm_RP_MTI              *sm_RP_MTI;
    UMGSMMAP_sm_RP_SMEA             *sm_RP_SMEA;
 */
}

@property(readwrite,strong) UMGSMMAP_IMSI *imsi;
@property(readwrite,strong) UMGSMMAP_LocationInfoWithLMSI *locationInfoWithLMSI;
@property(readwrite,strong) UMGSMMAP_ExtensionContainer *extensionContainer;

@end

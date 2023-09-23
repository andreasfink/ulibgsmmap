//
//  UMGSMMAP_NoteMM_EventArg.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 05.05.19.
//  Copyright © 2019 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>

#import <ulibgsmmap/UMGSMMAP_ISDN_AddressString.h>
#import <ulibgsmmap/UMGSMMAP_LocationInformation.h>
#import <ulibgsmmap/UMGSMMAP_LocationInformationGPRS.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>
#import <ulibgsmmap/UMGSMMAP_SupportedCamelPhases.h>
#import <ulibgsmmap/UMGSMMAP_MM_Code.h>
#import <ulibgsmmap/UMGSMMAP_ServiceKey.h>
#import <ulibgsmmap/UMGSMMAP_IMSI.h>
#import <ulibgsmmap/UMGSMMAP_OfferedCamel4Functionalities.h>

@interface UMGSMMAP_NoteMM_EventArg : UMASN1Sequence
{
    UMGSMMAP_ServiceKey *_serviceKey;
    UMGSMMAP_MM_Code *_eventMet;
    UMGSMMAP_IMSI *_imsi;
    UMGSMMAP_ISDN_AddressString *_msisdn;
    UMGSMMAP_LocationInformation *_locationInformation;
    UMGSMMAP_SupportedCamelPhases *_supportedCAMELPhases;
    UMGSMMAP_ExtensionContainer *_extensionContainer;
    UMGSMMAP_LocationInformationGPRS *_locationInformationGPRS;
    UMGSMMAP_OfferedCamel4Functionalities *_offeredCamel4Funcationalities;
}


@property(readwrite,strong,atomic)    UMGSMMAP_ServiceKey *serviceKey;
@property(readwrite,strong,atomic)    UMGSMMAP_MM_Code *eventMet;
@property(readwrite,strong,atomic)    UMGSMMAP_IMSI *imsi;
@property(readwrite,strong,atomic)    UMGSMMAP_ISDN_AddressString *msisdn;
@property(readwrite,strong,atomic)    UMGSMMAP_LocationInformation *locationInformation;
@property(readwrite,strong,atomic)    UMGSMMAP_SupportedCamelPhases *supportedCAMELPhases;
@property(readwrite,strong,atomic)    UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,strong,atomic)    UMGSMMAP_LocationInformationGPRS *locationInformationGPRS;
@property(readwrite,strong,atomic)    UMGSMMAP_OfferedCamel4Functionalities *l_offeredCamel4Funcationalities;

@end

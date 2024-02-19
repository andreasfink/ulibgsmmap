//
//  UMGSMMAP_Reject.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 02.01.2024.
//  Copyright © 2024 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>

@interface UMGSMMAP_Reject : UMASN1Sequence
{
    UMASN1Integer   *_invokeIDRej;
    UMASN1Object    *_problem;
    UMGSMMAP_ExtensionContainer *_extensionContainer;
    BOOL            _currentLocation;
    UMASN1Integer   *_requestedDomain;
    BOOL            _imei;
    BOOL            _ms_classmark;
    BOOL            _mnpRequestedInfo;
    BOOL            _locationInformationEPS_Supported;
    BOOL            _t_adsData;
    UMASN1BitString *_requestedNodes;
    BOOL            _servingNodeIndication;
    BOOL            _localTimeZoneRequest;
}

@property(readwrite,strong,atomic)  UMASN1Integer   *invokeIDRej;
@property(readwrite,strong,atomic)  UMASN1Object    *problem;
@property(readwrite,strong,atomic)  UMGSMMAP_ExtensionContainer *extensionContainer;

@property(readwrite,assign,atomic)  BOOL            currentLocation;
@property(readwrite,strong,atomic)  UMASN1Integer   *requestedDomain;
@property(readwrite,assign,atomic)  BOOL            imei;
@property(readwrite,assign,atomic)  BOOL            ms_classmark;
@property(readwrite,assign,atomic)  BOOL            mnpRequestedInfo;
@property(readwrite,assign,atomic)  BOOL            locationInformationEPS_Supported;
@property(readwrite,assign,atomic)  BOOL            t_adsData;
@property(readwrite,strong,atomic)  UMASN1BitString *requestedNodes;
@property(readwrite,assign,atomic)  BOOL            servingNodeIndication;
@property(readwrite,assign,atomic)  BOOL            localTimeZoneRequest;

@end


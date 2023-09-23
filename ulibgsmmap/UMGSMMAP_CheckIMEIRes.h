//
//  UMGSMMAP_CheckIMEIRes.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 28.02.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>
#import <ulibgsmmap/UMGSMMAP_EquipmentStatus.h>
#import <ulibgsmmap/UMGSMMAP_UESBI_Iu.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>

@interface UMGSMMAP_CheckIMEIRes : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
    UMGSMMAP_EquipmentStatus *_equipmentStatus;
    UMGSMMAP_UESBI_Iu *_bmuef;
    UMGSMMAP_ExtensionContainer *_extensionContainer;
}

@property(readwrite,strong,atomic)  UMGSMMAP_EquipmentStatus *equipmentStatus;
@property(readwrite,strong,atomic)  UMGSMMAP_UESBI_Iu *bmuef;
@property(readwrite,strong,atomic)  UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,strong) NSString *operationName;

@end

//
//  UMGSMMAP_RequestedEquipmentInfo.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 28.02.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

@interface UMGSMMAP_RequestedEquipmentInfo : UMASN1BitString<UMGSMMAP_asn1_protocol>
{
    
}

@property(readwrite,assign,atomic)  BOOL equipmentStatus;
@property(readwrite,assign,atomic)  BOOL bmuef;
@end

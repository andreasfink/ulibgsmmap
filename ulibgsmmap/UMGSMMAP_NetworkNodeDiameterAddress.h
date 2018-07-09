//
//  UMGSMMAP_NetworkNodeDiameterAddress.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 09.07.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_DiameterIdentity.h"
#import "UMGSMMAP_asn1_protocol.h"

@interface UMGSMMAP_NetworkNodeDiameterAddress : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
    UMGSMMAP_DiameterIdentity *_diameter_Name;
    UMGSMMAP_DiameterIdentity *_diameter_Realm;
}

@property(readwrite,strong,atomic)  UMGSMMAP_DiameterIdentity *diameter_Name;
@property(readwrite,strong,atomic)  UMGSMMAP_DiameterIdentity *diameter_Realm;


@end

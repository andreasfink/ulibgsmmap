//
//  UMGSMMAP_CorrelationID.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 09.05.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>

#import "UMGSMMAP_HLR_Id.h"
#import "UMGSMMAP_SIP_URI.h"

@interface UMGSMMAP_CorrelationID : UMASN1Sequence
{
    UMGSMMAP_HLR_Id     *_hlr_id;
    UMGSMMAP_SIP_URI    *_sip_uri_A;
    UMGSMMAP_SIP_URI    *_sip_uri_B;
}

@property(readwrite,strong) UMGSMMAP_HLR_Id     *hlr_id;
@property(readwrite,strong) UMGSMMAP_SIP_URI    *sip_uri_A;
@property(readwrite,strong) UMGSMMAP_SIP_URI    *sip_uri_B;


@end

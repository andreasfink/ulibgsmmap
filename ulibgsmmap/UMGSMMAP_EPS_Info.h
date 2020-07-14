//
//  UMGSMMAP_EPS_Info.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 14.07.20.
//  Copyright © 2020 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>

#import "UMGSMMAP_PDN_GW_Update.h"
#import "UMGSMMAP_ISR_Information.h"

@interface UMGSMMAP_EPS_Info : UMASN1Choice
{
    UMGSMMAP_PDN_GW_Update      *_pdn_gw_update;
    UMGSMMAP_ISR_Information    *_isr_Information;
}

@property(readwrite,strong,atomic)  UMGSMMAP_PDN_GW_Update      *pdn_gw_update;
@property(readwrite,strong,atomic)  UMGSMMAP_ISR_Information    *isr_Information;

- (UMGSMMAP_EPS_Info *)initWithString:(NSString *)str;
@end


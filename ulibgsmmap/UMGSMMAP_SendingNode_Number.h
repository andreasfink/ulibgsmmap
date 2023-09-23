//
//  UMGSMMAP_SendingNode_Number
//  ulibgsmmap
//
//  Copyright © 2021 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>
#import <ulibgsmmap/UMGSMMAP_ISDN_AddressString.h>

@interface UMGSMMAP_SendingNode_Number : UMASN1Sequence
{
    UMGSMMAP_ISDN_AddressString *_hlr_Number;
    UMGSMMAP_ISDN_AddressString *_css_Number;
}

@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *hlr_Number;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *css_Number;


- (void)processBeforeEncode;
- (UMGSMMAP_SendingNode_Number *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;

@end

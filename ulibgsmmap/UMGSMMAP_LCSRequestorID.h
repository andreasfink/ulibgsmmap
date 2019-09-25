//
//  UMGSMMAP_LCSRequestorID.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 04/07/16.
//
//

#import <ulibasn1/ulibasn1.h>

#import "UMGSMMAP_USSD_DataCodingScheme.h"
#import "UMGSMMAP_LCS_FormatIndicator.h"
#import "UMGSMMAP_RequestorIDString.h"

@interface UMGSMMAP_LCSRequestorID : UMASN1Sequence
{
    UMGSMMAP_USSD_DataCodingScheme *_dataCodingScheme;
    UMGSMMAP_RequestorIDString *_requestorIdString;
    UMGSMMAP_LCS_FormatIndicator *_lcs_FormatIndicator;
}
- (UMGSMMAP_LCSRequestorID *)initWithString:(NSString *)str;
@end

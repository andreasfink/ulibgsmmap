//
//  UMGSMMAP_LCS_ClientID.h
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_LCSClientType.h"
#import "UMGSMMAP_LCSClientExternalID.h"
#import "UMGSMMAP_AddressString.h"
#import "UMGSMMAP_LCSClientInternalID.h"
#import "UMGSMMAP_LCSClientName.h"
#import "UMGSMMAP_LCSRequestorID.h"
#import "UMGSMMAP_APN.h"

@interface UMGSMMAP_LCS_ClientID : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_LCSClientType *_lcsClientType;
	UMGSMMAP_LCSClientExternalID *_lcsClientExternalID;
	UMGSMMAP_AddressString *_lcsClientDialedByMS;
	UMGSMMAP_LCSClientInternalID *_lcsClientInternalID;
	UMGSMMAP_LCSClientName *_lcsClientName;
    UMGSMMAP_APN *_lcsAPN;
    UMGSMMAP_LCSRequestorID *_lcsRequestorID;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong) UMGSMMAP_LCSClientType *lcsClientType;
@property(readwrite,strong) UMGSMMAP_LCSClientExternalID *lcsClientExternalID;
@property(readwrite,strong) UMGSMMAP_AddressString *lcsClientDialedByMS;
@property(readwrite,strong)	UMGSMMAP_LCSClientInternalID *lcsClientInternalID;
@property(readwrite,strong) UMGSMMAP_LCSClientName *lcsClientName;
@property(readwrite,strong) UMGSMMAP_APN *lcsAPN;
@property(readwrite,strong) UMGSMMAP_LCSRequestorID *lcsRequestorID;

- (UMGSMMAP_LCS_ClientID *)initWithClientTypeString:(NSString *)s;
- (void)processBeforeEncode;
- (UMGSMMAP_LCS_ClientID *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;

@end

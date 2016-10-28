//
//  UMGSMMAP_LCS_ClientID.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_LCSClientType.h"
#import "UMGSMMAP_LCSClientExternalID.h"
#import "UMGSMMAP_AddressString.h"
#import "UMGSMMAP_LCSClientInternalID.h"
#import "UMGSMMAP_LCSClientName.h"

@interface UMGSMMAP_LCS_ClientID : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_LCSClientType *lcsClientType;
	UMGSMMAP_LCSClientExternalID *lcsClientExternalID;
	UMGSMMAP_AddressString *lcsClientDialedByMS;
	UMGSMMAP_LCSClientInternalID *lcsClientInternalID;
	UMGSMMAP_LCSClientName *lcsClientName;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_LCSClientType *lcsClientType;
@property(readwrite,strong)	UMGSMMAP_LCSClientExternalID *lcsClientExternalID;
@property(readwrite,strong)	UMGSMMAP_AddressString *lcsClientDialedByMS;
@property(readwrite,strong)	UMGSMMAP_LCSClientInternalID *lcsClientInternalID;
@property(readwrite,strong)	UMGSMMAP_LCSClientName *lcsClientName;


- (void)processBeforeEncode;
- (UMGSMMAP_LCS_ClientID *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;

@end

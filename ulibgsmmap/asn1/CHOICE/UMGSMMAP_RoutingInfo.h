//
//  UMGSMMAP_RoutingInfo.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_ISDN_AddressString.h"
#import "UMGSMMAP_ForwardingData.h"

@interface UMGSMMAP_RoutingInfo : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_ISDN_AddressString *roamingNumber;
	UMGSMMAP_ForwardingData *forwardingData;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *roamingNumber;
@property(readwrite,strong)	UMGSMMAP_ForwardingData *forwardingData;


- (void)processBeforeEncode;
- (UMGSMMAP_RoutingInfo *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;

@end

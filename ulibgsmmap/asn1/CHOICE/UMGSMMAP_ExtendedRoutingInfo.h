//
//  UMGSMMAP_ExtendedRoutingInfo.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_RoutingInfo.h"
#import "UMGSMMAP_CamelRoutingInfo.h"

@interface UMGSMMAP_ExtendedRoutingInfo : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_RoutingInfo *routingInfo;
	UMGSMMAP_CamelRoutingInfo *camelRoutingInfo;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_RoutingInfo *routingInfo;
@property(readwrite,strong)	UMGSMMAP_CamelRoutingInfo *camelRoutingInfo;


- (void)processBeforeEncode;
- (UMGSMMAP_ExtendedRoutingInfo *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;

@end

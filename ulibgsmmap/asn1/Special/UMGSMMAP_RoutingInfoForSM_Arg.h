//
//  UMGSMMAP_RoutingInfoForSM_Arg.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>


@interface UMGSMMAP_RoutingInfoForSM_Arg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMASN1OctetString *msisdn;
	UMASN1Boolean *sm_RP_PRI;
	UMASN1OctetString *serviceCentreAddress;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMASN1OctetString *msisdn;
@property(readwrite,strong)	UMASN1Boolean *sm_RP_PRI;
@property(readwrite,strong)	UMASN1OctetString *serviceCentreAddress;


- (void)processBeforeEncode;
- (UMGSMMAP_RoutingInfoForSM_Arg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;

@end

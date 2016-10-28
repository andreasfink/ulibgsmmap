//
//  UMGSMMAP_SM_RP_OA.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_ISDN_AddressString.h"
#import "UMGSMMAP_AddressString.h"

@interface UMGSMMAP_SM_RP_OA : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_ISDN_AddressString *msisdn;
	UMGSMMAP_AddressString *serviceCentreAddressOA;
	BOOL noSM_RP_OA;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *msisdn;
@property(readwrite,strong)	UMGSMMAP_AddressString *serviceCentreAddressOA;
@property(readwrite,assign)	BOOL noSM_RP_OA;


- (void)processBeforeEncode;
- (UMGSMMAP_SM_RP_OA *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;

@end

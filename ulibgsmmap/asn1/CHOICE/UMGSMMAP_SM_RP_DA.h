//
//  UMGSMMAP_SM_RP_DA.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_IMSI.h"
#import "UMGSMMAP_LMSI.h"
#import "UMGSMMAP_AddressString.h"

@interface UMGSMMAP_SM_RP_DA : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_IMSI *imsi;
	UMGSMMAP_LMSI *lmsi;
	UMGSMMAP_AddressString *serviceCentreAddressDA;
	BOOL noSM_RP_DA;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_IMSI *imsi;
@property(readwrite,strong)	UMGSMMAP_LMSI *lmsi;
@property(readwrite,strong)	UMGSMMAP_AddressString *serviceCentreAddressDA;
@property(readwrite,assign)	BOOL noSM_RP_DA;


- (void)processBeforeEncode;
- (UMGSMMAP_SM_RP_DA *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;

@end

//
//  UMGSMMAP_Additional_Number.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_ISDN_AddressString.h"

@interface UMGSMMAP_Additional_Number : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_ISDN_AddressString *msc_Number;
	UMGSMMAP_ISDN_AddressString *sgsn_Number;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *msc_Number;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *sgsn_Number;


- (void)processBeforeEncode;
- (UMGSMMAP_Additional_Number *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;

@end

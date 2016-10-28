//
//  UMGSMMAP_GPRSMSClass.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_MSNetworkCapability.h"
#import "UMGSMMAP_MSRadioAccessCapability.h"

@interface UMGSMMAP_GPRSMSClass : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_MSNetworkCapability *mSNetworkCapability;
	UMGSMMAP_MSRadioAccessCapability *mSRadioAccessCapability;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_MSNetworkCapability *mSNetworkCapability;
@property(readwrite,strong)	UMGSMMAP_MSRadioAccessCapability *mSRadioAccessCapability;


- (void)processBeforeEncode;
- (UMGSMMAP_GPRSMSClass *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

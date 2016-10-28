//
//  UMGSMMAP_DestinationNumberCriteria.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_MatchType.h"
#import "UMGSMMAP_DestinationNumberList.h"
#import "UMGSMMAP_DestinationNumberLengthList.h"

@interface UMGSMMAP_DestinationNumberCriteria : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_MatchType *matchType;
	UMGSMMAP_DestinationNumberList *destinationNumberList;
	UMGSMMAP_DestinationNumberLengthList *destinationNumberLengthList;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_MatchType *matchType;
@property(readwrite,strong)	UMGSMMAP_DestinationNumberList *destinationNumberList;
@property(readwrite,strong)	UMGSMMAP_DestinationNumberLengthList *destinationNumberLengthList;


- (void)processBeforeEncode;
- (UMGSMMAP_DestinationNumberCriteria *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

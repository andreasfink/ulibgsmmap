//
//  UMGSMMAP_DestinationNumberCriteria.h
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

#import <ulibgsmmap/UMGSMMAP_MatchType.h>
#import <ulibgsmmap/UMGSMMAP_DestinationNumberList.h>
#import <ulibgsmmap/UMGSMMAP_DestinationNumberLengthList.h>

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
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

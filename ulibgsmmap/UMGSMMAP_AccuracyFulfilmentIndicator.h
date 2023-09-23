//
//  UMGSMMAP_AccuracyFulfilmentIndicator.h
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


 typedef enum UMGSMMAP_AccuracyFulfilmentIndicator_enum
 {
    UMGSMMAP_AccuracyFulfilmentIndicator_requestedAccuracyFulfilled = 0,
    UMGSMMAP_AccuracyFulfilmentIndicator_requestedAccuracyNotFulfilled = 1,
 }UMGSMMAP_AccuracyFulfilmentIndicator_enum;
       

@interface UMGSMMAP_AccuracyFulfilmentIndicator : UMASN1Enumerated<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
}
@property(readwrite,strong)    NSString *operationName;

- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;
@end

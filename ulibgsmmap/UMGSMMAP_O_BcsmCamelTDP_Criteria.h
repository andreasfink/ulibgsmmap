//
//  UMGSMMAP_O_BcsmCamelTDP_Criteria.h
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

#import <ulibgsmmap/UMGSMMAP_O_BcsmTriggerDetectionPoint.h>
#import <ulibgsmmap/UMGSMMAP_DestinationNumberCriteria.h>
#import <ulibgsmmap/UMGSMMAP_BasicServiceCriteria.h>
#import <ulibgsmmap/UMGSMMAP_CallTypeCriteria.h>

@interface UMGSMMAP_O_BcsmCamelTDP_Criteria : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_O_BcsmTriggerDetectionPoint *o_BcsmTriggerDetectionPoint;
	UMGSMMAP_DestinationNumberCriteria *destinationNumberCriteria;
	UMGSMMAP_BasicServiceCriteria *basicServiceCriteria;
	UMGSMMAP_CallTypeCriteria *callTypeCriteria;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_O_BcsmTriggerDetectionPoint *o_BcsmTriggerDetectionPoint;
@property(readwrite,strong)	UMGSMMAP_DestinationNumberCriteria *destinationNumberCriteria;
@property(readwrite,strong)	UMGSMMAP_BasicServiceCriteria *basicServiceCriteria;
@property(readwrite,strong)	UMGSMMAP_CallTypeCriteria *callTypeCriteria;


- (void)processBeforeEncode;
- (UMGSMMAP_O_BcsmCamelTDP_Criteria *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

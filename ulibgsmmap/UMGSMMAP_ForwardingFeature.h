//
//  UMGSMMAP_ForwardingFeature.h
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_BasicServiceCode.h"
#import "UMGSMMAP_SS_Status.h"
#import "UMGSMMAP_ISDN_AddressString.h"
#import "UMGSMMAP_ISDN_SubaddressString.h"
#import "UMGSMMAP_ForwardingOptions.h"
#import "UMGSMMAP_NoReplyConditionTime.h"

@interface UMGSMMAP_ForwardingFeature : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_BasicServiceCode *basicService;
	UMGSMMAP_SS_Status *ss_Status;
	UMGSMMAP_ISDN_AddressString *forwardedToNumber;
	UMGSMMAP_ISDN_SubaddressString *forwardedToSubaddress;
	UMGSMMAP_ForwardingOptions *forwardingOptions;
	UMGSMMAP_NoReplyConditionTime *noReplyConditionTime;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_BasicServiceCode *basicService;
@property(readwrite,strong)	UMGSMMAP_SS_Status *ss_Status;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *forwardedToNumber;
@property(readwrite,strong)	UMGSMMAP_ISDN_SubaddressString *forwardedToSubaddress;
@property(readwrite,strong)	UMGSMMAP_ForwardingOptions *forwardingOptions;
@property(readwrite,strong)	UMGSMMAP_NoReplyConditionTime *noReplyConditionTime;


- (void)processBeforeEncode;
- (UMGSMMAP_ForwardingFeature *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

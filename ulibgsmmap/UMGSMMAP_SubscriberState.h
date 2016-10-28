//
//  UMGSMMAP_SubscriberState.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_NotReachableReason.h"

@interface UMGSMMAP_SubscriberState : UMASN1Choice<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	BOOL assumedIdle;
	BOOL camelBusy;
	UMGSMMAP_NotReachableReason *netDetNotReachable;
	BOOL notProvidedFromVLR;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,assign)	BOOL assumedIdle;
@property(readwrite,assign)	BOOL camelBusy;
@property(readwrite,strong)	UMGSMMAP_NotReachableReason *netDetNotReachable;
@property(readwrite,assign)	BOOL notProvidedFromVLR;


- (void)processBeforeEncode;
- (UMGSMMAP_SubscriberState *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

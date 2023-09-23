//
//  UMGSMMAP_SubscriberState.h
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

#import <ulibgsmmap/UMGSMMAP_NotReachableReason.h>

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
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

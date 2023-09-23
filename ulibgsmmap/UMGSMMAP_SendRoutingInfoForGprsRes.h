//
//  UMGSMMAP_SendRoutingInfoForGprsRes.h
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

#import <ulibgsmmap/UMGSMMAP_GSN_Address.h>
#import <ulibgsmmap/UMGSMMAP_AbsentSubscriberDiagnosticSM.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>

@interface UMGSMMAP_SendRoutingInfoForGprsRes : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_GSN_Address *sgsn_Address;
	UMGSMMAP_GSN_Address *ggsn_Address;
	UMGSMMAP_AbsentSubscriberDiagnosticSM *mobileNotReachableReason;
	UMGSMMAP_ExtensionContainer *extensionContainer;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_GSN_Address *sgsn_Address;
@property(readwrite,strong)	UMGSMMAP_GSN_Address *ggsn_Address;
@property(readwrite,strong)	UMGSMMAP_AbsentSubscriberDiagnosticSM *mobileNotReachableReason;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;


- (void)processBeforeEncode;
- (UMGSMMAP_SendRoutingInfoForGprsRes *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

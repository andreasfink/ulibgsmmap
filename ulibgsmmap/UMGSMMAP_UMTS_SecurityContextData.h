//
//  UMGSMMAP_UMTS_SecurityContextData.h
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

#import <ulibgsmmap/UMGSMMAP_CK.h>
#import <ulibgsmmap/UMGSMMAP_IK.h>
#import <ulibgsmmap/UMGSMMAP_KSI.h>

@interface UMGSMMAP_UMTS_SecurityContextData : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_CK *ck;
	UMGSMMAP_IK *ik;
	UMGSMMAP_KSI *ksi;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_CK *ck;
@property(readwrite,strong)	UMGSMMAP_IK *ik;
@property(readwrite,strong)	UMGSMMAP_KSI *ksi;


- (void)processBeforeEncode;
- (UMGSMMAP_UMTS_SecurityContextData *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

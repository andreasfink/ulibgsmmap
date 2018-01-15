//
//  UMGSMMAP_AuthenticationQuintuplet.h
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

#import "UMGSMMAP_RAND.h"
#import "UMGSMMAP_XRES.h"
#import "UMGSMMAP_CK.h"
#import "UMGSMMAP_IK.h"
#import "UMGSMMAP_AUTN.h"

@interface UMGSMMAP_AuthenticationQuintuplet : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_RAND *rand;
	UMGSMMAP_XRES *xres;
	UMGSMMAP_CK *ck;
	UMGSMMAP_IK *ik;
	UMGSMMAP_AUTN *autn;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_RAND *rand;
@property(readwrite,strong)	UMGSMMAP_XRES *xres;
@property(readwrite,strong)	UMGSMMAP_CK *ck;
@property(readwrite,strong)	UMGSMMAP_IK *ik;
@property(readwrite,strong)	UMGSMMAP_AUTN *autn;


- (void)processBeforeEncode;
- (UMGSMMAP_AuthenticationQuintuplet *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

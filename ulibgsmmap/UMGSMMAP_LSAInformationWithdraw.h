//
//  UMGSMMAP_LSAInformationWithdraw.h
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

#import "UMGSMMAP_LSAIdentityList.h"

@interface UMGSMMAP_LSAInformationWithdraw : UMASN1Choice<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	BOOL allLSAData;
	UMGSMMAP_LSAIdentityList *lsaIdentityList;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,assign)	BOOL allLSAData;
@property(readwrite,strong)	UMGSMMAP_LSAIdentityList *lsaIdentityList;


- (void)processBeforeEncode;
- (UMGSMMAP_LSAInformationWithdraw *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

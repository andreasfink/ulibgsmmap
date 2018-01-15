//
//  UMGSMMAP_LCSInformation.h
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

#import "UMGSMMAP_GMLC_List.h"
#import "UMGSMMAP_LCS_PrivacyExceptionList.h"
#import "UMGSMMAP_MOLR_List.h"

@interface UMGSMMAP_LCSInformation : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_GMLC_List *gmlc_List;
	UMGSMMAP_LCS_PrivacyExceptionList *lcs_PrivacyExceptionList;
	UMGSMMAP_MOLR_List *molr_List;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_GMLC_List *gmlc_List;
@property(readwrite,strong)	UMGSMMAP_LCS_PrivacyExceptionList *lcs_PrivacyExceptionList;
@property(readwrite,strong)	UMGSMMAP_MOLR_List *molr_List;


- (void)processBeforeEncode;
- (UMGSMMAP_LCSInformation *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

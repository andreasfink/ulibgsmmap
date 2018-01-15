//
//  UMGSMMAP_CCBS_Data.h
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

#import "UMGSMMAP_CCBS_Feature.h"
#import "UMGSMMAP_ISDN_AddressString.h"
#import "UMGSMMAP_ServiceIndicator.h"
#import "UMGSMMAP_ExternalSignalInfo.h"

@interface UMGSMMAP_CCBS_Data : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_CCBS_Feature *ccbs_Feature;
	UMGSMMAP_ISDN_AddressString *translatedB_Number;
	UMGSMMAP_ServiceIndicator *serviceIndicator;
	UMGSMMAP_ExternalSignalInfo *callInfo;
	UMGSMMAP_ExternalSignalInfo *networkSignalInfo;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_CCBS_Feature *ccbs_Feature;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *translatedB_Number;
@property(readwrite,strong)	UMGSMMAP_ServiceIndicator *serviceIndicator;
@property(readwrite,strong)	UMGSMMAP_ExternalSignalInfo *callInfo;
@property(readwrite,strong)	UMGSMMAP_ExternalSignalInfo *networkSignalInfo;


- (void)processBeforeEncode;
- (UMGSMMAP_CCBS_Data *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

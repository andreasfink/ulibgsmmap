//
//  UMGSMMAP_PrepareHO_Arg.h
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

#import <ulibgsmmap/UMGSMMAP_GlobalCellId.h>
#import <ulibgsmmap/UMGSMMAP_ExternalSignalInfo.h>

@interface UMGSMMAP_PrepareHO_Arg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_GlobalCellId *targetCellId;
	BOOL ho_NumberNotRequired;
	UMGSMMAP_ExternalSignalInfo *bss_APDU;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_GlobalCellId *targetCellId;
@property(readwrite,assign)	BOOL ho_NumberNotRequired;
@property(readwrite,strong)	UMGSMMAP_ExternalSignalInfo *bss_APDU;


- (void)processBeforeEncode;
- (UMGSMMAP_PrepareHO_Arg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

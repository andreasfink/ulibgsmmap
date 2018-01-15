//
//  UMGSMMAP_SendIdentificationArg.h
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

#import "UMGSMMAP_Tmsi.h"
#import "UMGSMMAP_NumberOfRequestedVectors.h"
#import "UMGSMMAP_ExtensionContainer.h"
#import "UMGSMMAP_ISDN_AddressString.h"
#import "UMGSMMAP_LAIFixedLength.h"

@interface UMGSMMAP_SendIdentificationArg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_Tmsi *tmsi;
	UMGSMMAP_NumberOfRequestedVectors *numberOfRequestedVectors;
	BOOL segmentationProhibited;
	UMGSMMAP_ExtensionContainer *extensionContainer;
	UMGSMMAP_ISDN_AddressString *msc_Number;
	UMGSMMAP_LAIFixedLength *previous_LAI;
	UMASN1Integer *hopCounter;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_Tmsi *tmsi;
@property(readwrite,strong)	UMGSMMAP_NumberOfRequestedVectors *numberOfRequestedVectors;
@property(readwrite,assign)	BOOL segmentationProhibited;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *msc_Number;
@property(readwrite,strong)	UMGSMMAP_LAIFixedLength *previous_LAI;
@property(readwrite,strong)	UMASN1Integer *hopCounter;


- (void)processBeforeEncode;
- (UMGSMMAP_SendIdentificationArg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

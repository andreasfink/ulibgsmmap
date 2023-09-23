//
//  UMGSMMAP_RemoteUserFreeArg.h
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

#import <ulibgsmmap/UMGSMMAP_IMSI.h>
#import <ulibgsmmap/UMGSMMAP_ExternalSignalInfo.h>
#import <ulibgsmmap/UMGSMMAP_CCBS_Feature.h>
#import <ulibgsmmap/UMGSMMAP_ISDN_AddressString.h>
#import <ulibgsmmap/UMGSMMAP_AlertingPattern.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>

@interface UMGSMMAP_RemoteUserFreeArg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_IMSI *imsi;
	UMGSMMAP_ExternalSignalInfo *callInfo;
	UMGSMMAP_CCBS_Feature *ccbs_Feature;
	UMGSMMAP_ISDN_AddressString *translatedB_Number;
	BOOL replaceB_Number;
	UMGSMMAP_AlertingPattern *alertingPattern;
	UMGSMMAP_ExtensionContainer *extensionContainer;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_IMSI *imsi;
@property(readwrite,strong)	UMGSMMAP_ExternalSignalInfo *callInfo;
@property(readwrite,strong)	UMGSMMAP_CCBS_Feature *ccbs_Feature;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *translatedB_Number;
@property(readwrite,assign)	BOOL replaceB_Number;
@property(readwrite,strong)	UMGSMMAP_AlertingPattern *alertingPattern;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;


- (void)processBeforeEncode;
- (UMGSMMAP_RemoteUserFreeArg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

//
//  UMGSMMAP_ReadyForSM_Arg.h
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibtcap/ulibtcap.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

#import <ulibgsmmap/UMGSMMAP_IMSI.h>
#import <ulibgsmmap/UMGSMMAP_AlertReason.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>

@interface UMGSMMAP_ReadyForSM_Arg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_IMSI *_imsi;
	UMGSMMAP_AlertReason *_alertReason;
	BOOL _alertReasonIndicator;
    BOOL _additionalAlertReasonIndicator;
	UMGSMMAP_ExtensionContainer *_extensionContainer;
}

@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_IMSI                   *imsi;
@property(readwrite,strong) UMGSMMAP_AlertReason            *alertReason;
@property(readwrite,assign) BOOL                            alertReasonIndicator;
@property(readwrite,strong) UMGSMMAP_ExtensionContainer     *extensionContainer;
@property(readwrite,assign) BOOL                            additionalAlertReasonIndicator;


- (void)processBeforeEncode;
- (UMGSMMAP_ReadyForSM_Arg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

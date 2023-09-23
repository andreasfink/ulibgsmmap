//
//  UMGSMMAP_ProvideSubscriberInfoArg.h
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
#import <ulibgsmmap/UMGSMMAP_LMSI.h>
#import <ulibgsmmap/UMGSMMAP_RequestedInfo.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>
#import <ulibgsmmap/UMGSMMAP_EMLPP_Priority.h>

@interface UMGSMMAP_ProvideSubscriberInfoArg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_IMSI *imsi;
	UMGSMMAP_LMSI *lmsi;
	UMGSMMAP_RequestedInfo *requestedInfo;
	UMGSMMAP_ExtensionContainer *extensionContainer;
    UMGSMMAP_EMLPP_Priority *_callPriority;
    BOOL    _flag65711;

}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_IMSI *imsi;
@property(readwrite,strong)	UMGSMMAP_LMSI *lmsi;
@property(readwrite,strong)	UMGSMMAP_RequestedInfo *requestedInfo;
@property(readwrite,strong)    UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,strong)    UMGSMMAP_EMLPP_Priority *callPriority;
@property(readwrite,assign)    BOOL    flag65711;


- (void)processBeforeEncode;
- (UMGSMMAP_ProvideSubscriberInfoArg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

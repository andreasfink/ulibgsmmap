//
//  UMGSMMAP_ForwardGroupCallSignallingArg.h
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

#import "UMGSMMAP_IMSI.h"
#import "UMGSMMAP_ExtensionContainer.h"

@interface UMGSMMAP_ForwardGroupCallSignallingArg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_IMSI *imsi;
	BOOL uplinkRequestAck;
	BOOL uplinkReleaseIndication;
	BOOL uplinkRejectCommand;
	BOOL uplinkSeizedCommand;
	BOOL uplinkReleaseCommand;
	UMGSMMAP_ExtensionContainer *extensionContainer;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_IMSI *imsi;
@property(readwrite,assign)	BOOL uplinkRequestAck;
@property(readwrite,assign)	BOOL uplinkReleaseIndication;
@property(readwrite,assign)	BOOL uplinkRejectCommand;
@property(readwrite,assign)	BOOL uplinkSeizedCommand;
@property(readwrite,assign)	BOOL uplinkReleaseCommand;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;


- (void)processBeforeEncode;
- (UMGSMMAP_ForwardGroupCallSignallingArg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

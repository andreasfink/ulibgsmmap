//
//  UMGSMMAP_SMS_CSI.h
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

#import "UMGSMMAP_SMS_CAMEL_TDP_DataList.h"
#import "UMGSMMAP_CamelCapabilityHandling.h"
#import "UMGSMMAP_ExtensionContainer.h"

@interface UMGSMMAP_SMS_CSI : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_SMS_CAMEL_TDP_DataList *sms_CAMEL_TDP_DataList;
	UMGSMMAP_CamelCapabilityHandling *camelCapabilityHandling;
	UMGSMMAP_ExtensionContainer *extensionContainer;
	BOOL notificationToCSE;
	BOOL csi_Active;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_SMS_CAMEL_TDP_DataList *sms_CAMEL_TDP_DataList;
@property(readwrite,strong)	UMGSMMAP_CamelCapabilityHandling *camelCapabilityHandling;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,assign)	BOOL notificationToCSE;
@property(readwrite,assign)	BOOL csi_Active;


- (void)processBeforeEncode;
- (UMGSMMAP_SMS_CSI *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

//
//  UMGSMMAP_ExternalClient.h
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

#import <ulibgsmmap/UMGSMMAP_LCSClientExternalID.h>
#import <ulibgsmmap/UMGSMMAP_GMLC_Restriction.h>
#import <ulibgsmmap/UMGSMMAP_NotificationToMSUser.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>

@interface UMGSMMAP_ExternalClient : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_LCSClientExternalID *clientIdentity;
	UMGSMMAP_GMLC_Restriction *gmlc_Restriction;
	UMGSMMAP_NotificationToMSUser *notificationToMSUser;
	UMGSMMAP_ExtensionContainer *extensionContainer;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_LCSClientExternalID *clientIdentity;
@property(readwrite,strong)	UMGSMMAP_GMLC_Restriction *gmlc_Restriction;
@property(readwrite,strong)	UMGSMMAP_NotificationToMSUser *notificationToMSUser;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;


- (void)processBeforeEncode;
- (UMGSMMAP_ExternalClient *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

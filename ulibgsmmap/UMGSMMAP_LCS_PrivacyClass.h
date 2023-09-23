//
//  UMGSMMAP_LCS_PrivacyClass.h
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

#import <ulibgsmmap/UMGSMMAP_SS_Code.h>
#import <ulibgsmmap/UMGSMMAP_Ext_SS_Status.h>
#import <ulibgsmmap/UMGSMMAP_NotificationToMSUser.h>
#import <ulibgsmmap/UMGSMMAP_ExternalClientList.h>
#import <ulibgsmmap/UMGSMMAP_PLMNClientList.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>

@interface UMGSMMAP_LCS_PrivacyClass : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_SS_Code *ss_Code;
	UMGSMMAP_Ext_SS_Status *ss_Status;
	UMGSMMAP_NotificationToMSUser *notificationToMSUser;
	UMGSMMAP_ExternalClientList *externalClientList;
	UMGSMMAP_PLMNClientList *plmnClientList;
	UMGSMMAP_ExtensionContainer *extensionContainer;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_SS_Code *ss_Code;
@property(readwrite,strong)	UMGSMMAP_Ext_SS_Status *ss_Status;
@property(readwrite,strong)	UMGSMMAP_NotificationToMSUser *notificationToMSUser;
@property(readwrite,strong)	UMGSMMAP_ExternalClientList *externalClientList;
@property(readwrite,strong)	UMGSMMAP_PLMNClientList *plmnClientList;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;


- (void)processBeforeEncode;
- (UMGSMMAP_LCS_PrivacyClass *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

//
//  UMGSMMAP_InsertSubscriberDataRes.h
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

#import <ulibgsmmap/UMGSMMAP_TeleserviceList.h>
#import <ulibgsmmap/UMGSMMAP_BearerServiceList.h>
#import <ulibgsmmap/UMGSMMAP_SS_List.h>
#import <ulibgsmmap/UMGSMMAP_ODB_GeneralData.h>
#import <ulibgsmmap/UMGSMMAP_RegionalSubscriptionResponse.h>
#import <ulibgsmmap/UMGSMMAP_SupportedCamelPhases.h>
#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>

@interface UMGSMMAP_InsertSubscriberDataRes : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_TeleserviceList *teleserviceList;
	UMGSMMAP_BearerServiceList *bearerServiceList;
	UMGSMMAP_SS_List *ss_List;
	UMGSMMAP_ODB_GeneralData *odb_GeneralData;
	UMGSMMAP_RegionalSubscriptionResponse *regionalSubscriptionResponse;
	UMGSMMAP_SupportedCamelPhases *supportedCamelPhases;
	UMGSMMAP_ExtensionContainer *extensionContainer;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_TeleserviceList *teleserviceList;
@property(readwrite,strong)	UMGSMMAP_BearerServiceList *bearerServiceList;
@property(readwrite,strong)	UMGSMMAP_SS_List *ss_List;
@property(readwrite,strong)	UMGSMMAP_ODB_GeneralData *odb_GeneralData;
@property(readwrite,strong)	UMGSMMAP_RegionalSubscriptionResponse *regionalSubscriptionResponse;
@property(readwrite,strong)	UMGSMMAP_SupportedCamelPhases *supportedCamelPhases;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;


- (void)processBeforeEncode;
- (UMGSMMAP_InsertSubscriberDataRes *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

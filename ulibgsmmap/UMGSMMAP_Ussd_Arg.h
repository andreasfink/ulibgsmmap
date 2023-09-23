//
//  UMGSMMAP_Ussd_Arg.h
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

#import <ulibgsmmap/UMGSMMAP_USSD_DataCodingScheme.h>
#import <ulibgsmmap/UMGSMMAP_USSD_String.h>
#import <ulibgsmmap/UMGSMMAP_ISDN_AddressString.h>

@interface UMGSMMAP_Ussd_Arg : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_USSD_DataCodingScheme *ussd_DataCodingScheme;
	UMGSMMAP_USSD_String *ussd_String;
	UMASN1OctetString *alertingPattern;
	UMGSMMAP_ISDN_AddressString *msisdn;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_USSD_DataCodingScheme *ussd_DataCodingScheme;
@property(readwrite,strong)	UMGSMMAP_USSD_String *ussd_String;
@property(readwrite,strong)	UMASN1OctetString *alertingPattern;
@property(readwrite,strong)	UMGSMMAP_ISDN_AddressString *msisdn;


- (void)processBeforeEncode;
- (UMGSMMAP_Ussd_Arg *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

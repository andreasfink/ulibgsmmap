//
//  UMGSMMAP_MySubscriberInfo.h
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


@interface UMGSMMAP_MySubscriberInfo : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMASN1Integer *locationInformation;
	UMASN1OctetString *geographicalInformation;
	UMASN1OctetString *vlr_number;
	UMASN1OctetString *locationNumber;
	UMASN1OctetString *cellGlobalIdOrServiceAreaIdOrLAI;
	UMASN1OctetString *laiFixedLength;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMASN1Integer *locationInformation;
@property(readwrite,strong)	UMASN1OctetString *geographicalInformation;
@property(readwrite,strong)	UMASN1OctetString *vlr_number;
@property(readwrite,strong)	UMASN1OctetString *locationNumber;
@property(readwrite,strong)	UMASN1OctetString *cellGlobalIdOrServiceAreaIdOrLAI;
@property(readwrite,strong)	UMASN1OctetString *laiFixedLength;


- (void)processBeforeEncode;
- (UMGSMMAP_MySubscriberInfo *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;

@end

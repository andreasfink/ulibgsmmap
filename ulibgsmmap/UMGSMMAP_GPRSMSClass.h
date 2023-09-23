//
//  UMGSMMAP_GPRSMSClass.h
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

#import <ulibgsmmap/UMGSMMAP_MSNetworkCapability.h>
#import <ulibgsmmap/UMGSMMAP_MSRadioAccessCapability.h>

@interface UMGSMMAP_GPRSMSClass : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_MSNetworkCapability *mSNetworkCapability;
	UMGSMMAP_MSRadioAccessCapability *mSRadioAccessCapability;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_MSNetworkCapability *mSNetworkCapability;
@property(readwrite,strong)	UMGSMMAP_MSRadioAccessCapability *mSRadioAccessCapability;


- (void)processBeforeEncode;
- (UMGSMMAP_GPRSMSClass *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

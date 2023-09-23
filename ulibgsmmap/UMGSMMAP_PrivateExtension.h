//
//  UMGSMMAP_PrivateExtension.h
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


@interface UMGSMMAP_PrivateExtension : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
    UMASN1ObjectIdentifier *_extId;
    UMASN1Object *_extensionData;
}
@property(readwrite,strong) NSString *operationName;
@property(readwrite,strong) UMASN1ObjectIdentifier *extId;
@property(readwrite,strong) UMASN1Object *extensionData;

- (void)processBeforeEncode;
- (UMGSMMAP_PrivateExtension *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

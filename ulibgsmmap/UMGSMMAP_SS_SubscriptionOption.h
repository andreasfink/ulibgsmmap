//
//  UMGSMMAP_SS_SubscriptionOption.h
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

#import <ulibgsmmap/UMGSMMAP_CliRestrictionOption.h>
#import <ulibgsmmap/UMGSMMAP_OverrideCategory.h>

@interface UMGSMMAP_SS_SubscriptionOption : UMASN1Choice<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_CliRestrictionOption *cliRestrictionOption;
	UMGSMMAP_OverrideCategory *overrideCategory;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_CliRestrictionOption *cliRestrictionOption;
@property(readwrite,strong)	UMGSMMAP_OverrideCategory *overrideCategory;


- (void)processBeforeEncode;
- (UMGSMMAP_SS_SubscriptionOption *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

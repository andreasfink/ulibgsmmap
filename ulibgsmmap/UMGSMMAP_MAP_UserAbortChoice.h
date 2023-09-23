//
//  UMGSMMAP_MAP_UserAbortChoice.h
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

#import <ulibgsmmap/UMGSMMAP_ResourceUnavailableReason.h>
#import <ulibgsmmap/UMGSMMAP_ProcedureCancellationReason.h>

@interface UMGSMMAP_MAP_UserAbortChoice : UMASN1Choice<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	BOOL userSpecificReason;
	BOOL userResourceLimitation;
	UMGSMMAP_ResourceUnavailableReason *resourceUnavailable;
	UMGSMMAP_ProcedureCancellationReason *applicationProcedureCancellation;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,assign)	BOOL userSpecificReason;
@property(readwrite,assign)	BOOL userResourceLimitation;
@property(readwrite,strong)	UMGSMMAP_ResourceUnavailableReason *resourceUnavailable;
@property(readwrite,strong)	UMGSMMAP_ProcedureCancellationReason *applicationProcedureCancellation;


- (void)processBeforeEncode;
- (UMGSMMAP_MAP_UserAbortChoice *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

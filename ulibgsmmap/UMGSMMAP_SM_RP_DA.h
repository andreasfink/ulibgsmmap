//
//  UMGSMMAP_SM_RP_DA.h
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

#import <ulibgsmmap/UMGSMMAP_IMSI.h>
#import <ulibgsmmap/UMGSMMAP_LMSI.h>
#import <ulibgsmmap/UMGSMMAP_AddressString.h>

@interface UMGSMMAP_SM_RP_DA : UMASN1Choice<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_IMSI *imsi;
	UMGSMMAP_LMSI *lmsi;
	UMGSMMAP_AddressString *serviceCentreAddressDA;
	BOOL noSM_RP_DA;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_IMSI *imsi;
@property(readwrite,strong)	UMGSMMAP_LMSI *lmsi;
@property(readwrite,strong)	UMGSMMAP_AddressString *serviceCentreAddressDA;
@property(readwrite,assign)	BOOL noSM_RP_DA;


- (void)processBeforeEncode;
- (UMGSMMAP_SM_RP_DA *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

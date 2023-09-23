//
//  UMGSMMAP_AuthenticationSetList.h
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

#import <ulibgsmmap/UMGSMMAP_AuthenticationTripletList.h>
#import <ulibgsmmap/UMGSMMAP_AuthenticationQuintupletList.h>

@interface UMGSMMAP_AuthenticationSetList : UMASN1Choice<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_AuthenticationTripletList *_tripletList;
	UMGSMMAP_AuthenticationQuintupletList *_quintupletList;
}
@property(readwrite,strong) NSString *operationName;
@property(readwrite,strong)	UMGSMMAP_AuthenticationTripletList      *tripletList;
@property(readwrite,strong)	UMGSMMAP_AuthenticationQuintupletList   *quintupletList;


- (void)processBeforeEncode;
- (UMGSMMAP_AuthenticationSetList *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

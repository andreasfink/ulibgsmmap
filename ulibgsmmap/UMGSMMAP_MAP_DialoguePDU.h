//
//  UMGSMMAP_MAP_DialoguePDU.h
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_MAP_OpenInfo.h"
#import "UMGSMMAP_MAP_AcceptInfo.h"
#import "UMGSMMAP_MAP_CloseInfo.h"
#import "UMGSMMAP_MAP_RefuseInfo.h"
#import "UMGSMMAP_MAP_UserAbortInfo.h"
#import "UMGSMMAP_MAP_ProviderAbortInfo.h"

@interface UMGSMMAP_MAP_DialoguePDU : UMASN1Choice<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_MAP_OpenInfo *map_open;
	UMGSMMAP_MAP_AcceptInfo *map_accept;
	UMGSMMAP_MAP_CloseInfo *map_close;
	UMGSMMAP_MAP_RefuseInfo *map_refuse;
	UMGSMMAP_MAP_UserAbortInfo *map_userAbort;
	UMGSMMAP_MAP_ProviderAbortInfo *map_providerAbort;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_MAP_OpenInfo *map_open;
@property(readwrite,strong)	UMGSMMAP_MAP_AcceptInfo *map_accept;
@property(readwrite,strong)	UMGSMMAP_MAP_CloseInfo *map_close;
@property(readwrite,strong)	UMGSMMAP_MAP_RefuseInfo *map_refuse;
@property(readwrite,strong)	UMGSMMAP_MAP_UserAbortInfo *map_userAbort;
@property(readwrite,strong)	UMGSMMAP_MAP_ProviderAbortInfo *map_providerAbort;


- (void)processBeforeEncode;
- (UMGSMMAP_MAP_DialoguePDU *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end

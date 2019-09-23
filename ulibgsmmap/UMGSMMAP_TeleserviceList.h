//
//  UMGSMMAP_TeleserviceList.h
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
#import "UMGSMMAP_Ext_TeleserviceCode.h"

@interface UMGSMMAP_TeleserviceList : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	NSMutableArray *_sequenceEntries;
}
@property(readwrite,strong)    NSString *operationName;
@property(readwrite,strong)    NSMutableArray *sequenceEntries;

- (void)processBeforeEncode;
- (UMGSMMAP_TeleserviceList *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (void)addServices:(UMGSMMAP_TeleserviceList *)list;
- (void)addEntry:(UMGSMMAP_Ext_TeleserviceCode  *)e;
- (UMGSMMAP_TeleserviceList *)initWithString:(NSString *)str;

@end

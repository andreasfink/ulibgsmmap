//
//  UMGSMMAP_ForwardingFeatureList.h
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
#import <ulibgsmmap/UMGSMMAP_ForwardingFeature.h>

@interface UMGSMMAP_ForwardingFeatureList : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	NSMutableArray *_sequenceEntries;
}
@property(readwrite,strong)    NSString *operationName;
@property(readwrite,strong)    NSMutableArray *sequenceEntries;

- (void)processBeforeEncode;
- (UMGSMMAP_ForwardingFeatureList *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (void)addEntry:(UMGSMMAP_ForwardingFeature *)e;
@end

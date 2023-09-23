//
//  UMGSMMAP_FTSExtensionList.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 31.03.20.
//  Copyright © 2020 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>

#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>
#import <ulibgsmmap/UMGSMMAP_FTSExtension.h>

#define FTS_OID @"2.16.756.5.40"

@interface UMGSMMAP_FTSExtensionList : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
    NSString        *_operationName;
    NSMutableArray  *_sequenceEntries;
}
@property(readwrite,strong)    NSString         *operationName;
@property(readwrite,strong)    NSMutableArray   *sequenceEntries;

- (void)processBeforeEncode;
- (UMGSMMAP_FTSExtensionList *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (void)addEntry:(UMGSMMAP_FTSExtension  *)e;
- (UMGSMMAP_FTSExtensionList *)initWithString:(NSString *)str;

@end


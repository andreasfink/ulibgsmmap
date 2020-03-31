//
//  UMGSMMAP_FTSExtensionList.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 31.03.20.
//  Copyright © 2020 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>

#import "UMGSMMAP_asn1_protocol.h"
#import "UMGSMMAP_FTSExtension.h"

@interface UMGSMMAP_FTSExtensionList : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
    NSString *_operationName;
    NSMutableArray *_sequenceEntries;
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

